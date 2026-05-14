#!/usr/bin/env python3
from __future__ import annotations

import re
import json
import copy
from pathlib import Path

from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parent
CORE_DIR = ROOT.parent / "cheatsheet" / "sections" / "core-statutes"

CAP_MAP = {
    "a-copyright.typ": ("A. Copyright Ordinance (Cap.528)", "Cap.528", ROOT / "Cap.528.html"),
    "b-pdpo.typ": ("B. PDPO (Cap.486)", "Cap.486", ROOT / "Cap.486.html"),
    "c-patent.typ": ("C. Patents Ordinance (Cap.514)", "Cap.514", ROOT / "Cap.514.html"),
}

CELL = "dual"
DASH_CHARS = "—―－"


def def_cell(cell: str) -> str:
    if cell == "dual":
        return "source-statutes-dual-cell"
    return "source-statutes-cell"


def build_cell(cell: str, zh: str, en: str = None) -> str:
    if cell == "dual":
        return f"source-statutes-dual-cell({zh}, {en})"
    return f"source-statutes-cell({zh})"


def normalize_space(s: str) -> str:
    s = re.sub(r"\s+", " ", s.replace("\xa0", " ")).strip()
    s = re.sub(r"\(\s*([0-9A-Za-z]+)\s*\)", r"(\1)", s)
    # Remove useless spaces just inside parentheses.
    s = re.sub(r"\(\s+", "(", s)
    s = re.sub(r"\s+\)", ")", s)
    # Remove spaces accidentally inserted between CJK characters.
    s = re.sub(r"(?<=[\u4e00-\u9fff])\s+(?=[\u4e00-\u9fff])", "", s)
    # Remove spaces between CJK and adjacent parentheses.
    s = re.sub(r"(?<=[\u4e00-\u9fff])\s+(?=\()", "", s)
    s = re.sub(r"(?<=\))\s+(?=[\u4e00-\u9fff])", "", s)
    # Normalize multi-em-dash lead-ins like "— —", "——", "————" to "——".
    s = re.sub(rf"(?:\s*[{DASH_CHARS}]\s*){{2,}}", "——", s)
    return s


def extract_refs_from_typ(typ_text: str) -> list[str]:
    cells = re.findall(r"^\s*\[([^\]]+)\],\s*$", typ_text, flags=re.M)
    data_cells = cells[4:]
    refs = []
    for i in range(0, len(data_cells), 4):
        cell = data_cells[i].strip()
        # A cell may contain multiple references, e.g. "ss.41-45 ss.55-59".
        parts = re.findall(
            r"(?:ss\.\s*\d+[a-z]?\s*[-–—―－]+\s*\d+[a-z]?|s\.\s*\d+[a-z]?(?:\s*\([0-9a-z]+\))*)",
            cell,
            flags=re.I,
        )
        refs.extend(p.strip() for p in (parts or [cell]))

    out: list[str] = []
    seen = set()
    for r in refs:
        if r not in seen:
            out.append(r)
            seen.add(r)
    return out


def norm_ref(ref: str) -> str:
    r = re.sub(r"\s+", "", ref).lower()
    return (
        r.replace("–", "-")
        .replace("—", "-")
        .replace("―", "-")
        .replace("－", "-")
    )


def ref_to_temporalid(ref: str) -> str | None:
    r = norm_ref(ref)
    if not r.startswith("s."):
        return None
    body = r[2:]
    m = re.match(r"(\d+[a-z]?)(.*)$", body)
    if not m:
        return None
    sec = m.group(1)
    tail = m.group(2)
    parts = [f"s{sec}"]
    for p in re.findall(r"\(([0-9a-z]+)\)", tail):
        parts.append(p)
    return "_".join(parts)


def sort_token_key(token: str):
    if token.isdigit():
        return (0, int(token), token)
    return (1, token)


def expand_simple_section_ref(ref: str, by_temporalid: dict[str, list]) -> list[str]:
    # Keep original refs only; do not auto-expand into subsections/subparagraphs.
    return [ref]


def parent_ref(ref: str) -> str | None:
    r = ref.strip()
    m = re.fullmatch(r"(s\.\d+[a-zA-Z]*)\([0-9a-zA-Z]+\)", r)
    if m:
        return m.group(1)
    return None


def expand_section_range_ref(ref: str) -> list[str]:
    r = norm_ref(ref)
    m = re.fullmatch(r"ss\.(\d+)-(\d+)", r)
    if not m:
        return [ref]
    start = int(m.group(1))
    end = int(m.group(2))
    if end < start:
        start, end = end, start
    return [f"s.{n}" for n in range(start, end + 1)]


def to_main_section_ref(ref: str) -> str:
    r = ref.strip()
    m = re.fullmatch(r"(s\.\d+[a-zA-Z]*)(?:\([0-9a-zA-Z]+\))*", r)
    if not m:
        return ref
    return m.group(1)


def expand_refs(refs: list[str], by_temporalid: dict[str, list]) -> list[str]:
    out: list[str] = []
    seen = set()
    for ref in refs:
        range_expanded = expand_section_range_ref(ref)
        if len(range_expanded) > 1:
            for rr in range_expanded:
                if rr not in seen:
                    out.append(rr)
                    seen.add(rr)
            continue
        for r in expand_simple_section_ref(ref, by_temporalid):
            main_r = to_main_section_ref(r)
            if main_r not in seen:
                out.append(main_r)
                seen.add(main_r)
    return out


def ref_sort_key(ref: str):
    r = norm_ref(ref)
    m = re.fullmatch(r"s\.(\d+)([a-z]?)(.*)", r)
    if m:
        sec_num = int(m.group(1))
        sec_suffix = m.group(2)
        tail = m.group(3)
        toks = re.findall(r"\(([0-9a-z]+)\)", tail)
        key = [0, sec_num, sec_suffix]
        for t in toks:
            if t.isdigit():
                key.extend([0, int(t)])
            else:
                key.extend([1, t])
        return tuple(key)
    return (9, r)


def node_text(node, limit: int = 1400) -> str:
    text = normalize_space(node.get_text(" ", strip=True))
    return text if len(text) <= limit else text[: limit - 3] + "..."


def strip_subsections_text(text: str) -> str:
    # Keep only the lead-in text before top-level subsection markers like "(1)".
    m = re.search(r"\(\s*1\s*\)", text)
    if not m:
        return text
    head = normalize_space(text[: m.start()])
    return head or text


def text_with_direct_children(node, skip_classes: set[str], limit: int = 1400) -> str:
    parts: list[str] = []
    for child in getattr(node, "children", []):
        if getattr(child, "name", None) is None:
            continue
        cls = set(child.get("class") or [])
        if cls & skip_classes:
            continue
        t = normalize_space(child.get_text(" ", strip=True))
        if t:
            parts.append(t)
    text = normalize_space(" ".join(parts))
    if not text:
        return node_text(node, limit)
    return text if len(text) <= limit else text[: limit - 3] + "..."


def node_text_without_classes(node, skip_classes: set[str], limit: int = 1400) -> str:
    # Deep clone via re-parse to avoid mutating/depending on original tree links.
    cloned = BeautifulSoup(str(node), "html.parser")
    root = cloned.find()
    if root is None:
        return node_text(node, limit)
    for t in list(cloned.find_all(True)):
        if not getattr(t, "attrs", None):
            continue
        cls = set(t.get("class") or [])
        if cls & skip_classes:
            t.decompose()
    text = normalize_space(root.get_text(" ", strip=True))
    if not text:
        return node_text(node, limit)
    return text if len(text) <= limit else text[: limit - 3] + "..."


def subsection_leadin_text(node, limit: int = 1400) -> str | None:
    num = node.find("div", class_="hklm_num", recursive=False)
    leadin = node.find("div", class_="hklm_leadIn", recursive=False)
    if not leadin:
        return None
    num_t = normalize_space(num.get_text(" ", strip=True)) if num else ""
    lead_t = normalize_space(leadin.get_text(" ", strip=True))
    text = normalize_space(f"{num_t} {lead_t}".strip())
    if not text:
        return None
    return text if len(text) <= limit else text[: limit - 3] + "..."


def is_leadin_only_text(text: str) -> bool:
    t = normalize_space(text)
    # Cases like "(2) 有关条件是——" / "(2) The conditions are—"
    return bool(
        re.fullmatch(
            rf"\([0-9a-zA-Z]+\)\s*[^。；;:.!?]*(?:[{DASH_CHARS}-]\s*)+\s*", t
        )
    )


def subsection_has_nested_items(node) -> bool:
    for p in node.find_all("div", class_="hklm_paragraph", recursive=False):
        for t in p.find_all("div", recursive=False):
            cls = set(t.get("class") or [])
            if any(c.startswith("hklm_subparagraph") for c in cls):
                return True
    return False


def subsection_has_direct_paragraphs(node) -> bool:
    return bool(node.find("div", class_="hklm_paragraph", recursive=False))


def parse_section_ref(ref: str) -> tuple[str, list[str]] | None:
    r = ref.strip()
    m = re.fullmatch(r"s\.(\d+[a-zA-Z]*)((?:\([0-9a-zA-Z]+\))*)", r)
    if not m:
        return None
    sec = m.group(1).lower()
    tail = m.group(2)
    tokens = re.findall(r"\(([0-9a-zA-Z]+)\)", tail)
    return sec, tokens


def node_num_token(node) -> str:
    num = node.find("div", class_="hklm_num")
    if not num:
        return ""
    t = normalize_space(num.get_text(" ", strip=True))
    t = t.strip().strip("()").replace(" ", "")
    return t.lower()


def find_child_by_num(parent, token: str):
    token_l = token.lower()
    for child in parent.find_all("div", class_=re.compile(r"^hklm_"), recursive=False):
        cls = set(child.get("class") or [])
        if not ({"hklm_subsection", "hklm_paragraph"} & cls):
            continue
        if node_num_token(child) == token_l:
            return child
    return None


def find_node_by_ref_tokens(section_node, tokens: list[str]):
    cur = section_node
    for tok in tokens:
        nxt = find_child_by_num(cur, tok)
        if not nxt:
            return None
        cur = nxt
    return cur


def build_indices(soup: BeautifulSoup):
    by_temporalid: dict[str, list] = {}
    by_name: dict[str, list] = {}

    for tag in soup.find_all(attrs={"temporalid": True}):
        tid = str(tag.get("temporalid")).lower()
        by_temporalid.setdefault(tid, []).append(tag)

    for sec in soup.find_all("div", class_="hklm_section"):
        name = sec.get("name")
        if name:
            by_name.setdefault(str(name).lower(), []).append(sec)

    return by_temporalid, by_name


def pick_lang_node(nodes: list, lang: str):
    if not nodes:
        return None
    for n in nodes:
        p = n
        while p is not None:
            if (
                getattr(p, "name", None) == "div"
                and p.get("class")
                and "hklm_main" in p.get("class")
            ):
                if p.get("lang") == lang:
                    return n
                break
            p = p.parent
    return None


def extract_entry_by_lang(
    ref: str,
    by_temporalid,
    by_name,
    full_text: str,
    lang: str,
    leadin_only_refs: set[str] | None = None,
) -> str | None:
    r0 = ref.strip()
    parsed = parse_section_ref(r0)
    is_plain_section_ref = bool(parsed and len(parsed[1]) == 0)
    is_subsection_ref = bool(parsed and len(parsed[1]) == 1)

    # Prefer structure-based lookup by displayed numbering to avoid temporalid mismatches.
    if parsed:
        sec, tokens = parsed
        sec_nodes = by_name.get(f"s{sec}", [])
        sec_node = pick_lang_node(sec_nodes, lang)
        if sec_node:
            target = (
                sec_node if not tokens else find_node_by_ref_tokens(sec_node, tokens)
            )
            if target:
                if not tokens:
                    # For main section refs, keep the full section text (including subsections).
                    return node_text(target)
                if len(tokens) == 1:
                    leadin_text = subsection_leadin_text(target)
                    if leadin_text and (
                        not leadin_only_refs or norm_ref(ref) in leadin_only_refs
                    ):
                        return leadin_text
                    if subsection_has_direct_paragraphs(target):
                        return node_text(target)
                    stripped = node_text_without_classes(target, {"hklm_paragraph"})
                    if is_leadin_only_text(stripped) and subsection_has_nested_items(
                        target
                    ):
                        return node_text(target)
                    return stripped
                return node_text(target)

    # Fallback to temporalid when structure lookup does not resolve.
    tid = ref_to_temporalid(ref)
    if tid:
        nodes = by_temporalid.get(tid.lower())
        if nodes:
            n = pick_lang_node(nodes, lang)
            if not n:
                return None
            text = node_text(n)
            if is_plain_section_ref:
                # For main section refs, keep the full section text (including subsections).
                return node_text(n)
            if is_subsection_ref:
                leadin_text = subsection_leadin_text(n)
                if leadin_text and (
                    not leadin_only_refs or norm_ref(ref) in leadin_only_refs
                ):
                    return leadin_text
                if subsection_has_direct_paragraphs(n):
                    return node_text(n)
                stripped = node_text_without_classes(n, {"hklm_paragraph"})
                if is_leadin_only_text(stripped) and subsection_has_nested_items(n):
                    return node_text(n)
                return stripped
            return text

    r = norm_ref(ref)
    if r.startswith("s."):
        m = re.match(r"s\.(\d+[a-z]?)", r)
        if m:
            sec_name = f"s{m.group(1)}"
            nodes = by_name.get(sec_name.lower(), [])
            n = pick_lang_node(nodes, lang)
            if n:
                text = node_text(n)
                if is_plain_section_ref:
                    # For main section refs, keep the full section text (including subsections).
                    return node_text(n)
                return text

    if r.startswith("ss."):
        m = re.match(r"ss\.(\d+[a-z]?)-(\d+[a-z]?)$", r)
        if m:
            start_s = m.group(1)
            end_s = m.group(2)
            if not start_s.isdigit() or not end_s.isdigit():
                return None
            start = int(start_s)
            end = int(end_s)
            parts = []
            for n in range(start, end + 1):
                sec = pick_lang_node(by_name.get(f"s{n}".lower(), []), lang)
                if sec:
                    parts.append(f"Section {n}: {node_text(sec, 500)}")
            if parts:
                return " ".join(parts)

    q = ref.strip()
    idx = full_text.lower().find(q.lower())
    if idx == -1 and q.lower().startswith("part"):
        idx = full_text.lower().find(q.lower().replace(" ", ""))
    if idx != -1:
        s = max(0, idx - 220)
        e = min(len(full_text), idx + 900)
        return normalize_space(full_text[s:e])
    return None


def md_cell(s: str) -> str:
    return s.replace("|", "\\|")


def typst_str(s: str) -> str:
    # Emit a Typst string literal safe for arbitrary statute text.
    s = normalize_space(s).replace("\n", " ")
    return (
        '"'
        + s.replace("\\", "\\\\")
        .replace('"', '\\"')
        + '"'
    )


def main() -> None:
    out = ["# Core Statutes Mentioned Provisions (from crawled HTML)", ""]
    jsonl_by_cap: dict[str, list[dict[str, str | bool]]] = {}

    for typ_name, (_, cap_name, html_path) in CAP_MAP.items():
        cap_records: list[dict[str, str | bool]] = []
        typ_text = (CORE_DIR / typ_name).read_text(encoding="utf-8")
        refs_raw = extract_refs_from_typ(typ_text)

        html = html_path.read_text(encoding="utf-8", errors="ignore")
        soup = BeautifulSoup(html, "html.parser")
        by_temporalid, by_name = build_indices(soup)
        full_text = normalize_space(soup.get_text(" ", strip=True))
        refs = expand_refs(refs_raw, by_temporalid)
        refs = sorted(refs, key=lambda x: norm_ref(x))
        refs_raw_norm = [norm_ref(r) for r in refs_raw]
        leadin_only_refs: set[str] = set()
        # Mark subsection refs like s.118(1) as lead-in only
        # when explicit child refs like s.118(1)(a) exist in raw refs.
        for r in refs_raw_norm:
            if not re.fullmatch(r"s\.\d+[a-z]?(?:\([0-9a-z]+\)){2,}", r):
                continue
            parent = re.sub(r"\([0-9a-z]+\)$", "", r)
            leadin_only_refs.add(parent)

        out.append(f"## {cap_name}")
        out.append("")
        out.append("| statutes | zh | en |")
        out.append("|---|---|---|")

        found = 0
        for ref in refs:
            zh = extract_entry_by_lang(
                ref,
                by_temporalid,
                by_name,
                full_text,
                "zh-Hant-HK",
                leadin_only_refs,
            )
            en = extract_entry_by_lang(
                ref, by_temporalid, by_name, full_text, "en", leadin_only_refs
            )
            is_found = bool(zh or en)
            if zh or en:
                found += 1
            else:
                zh = f"NOT FOUND in {cap_name}"
                en = f"NOT FOUND in {cap_name}"
            out.append(
                f"| {md_cell(ref)} | {md_cell(zh or '')} | {md_cell(en or '')} |"
            )
            cap_records.append(
                {
                    "cap": cap_name,
                    "statutes": ref,
                    "zh": zh or "",
                    "en": en or "",
                    "found": is_found,
                }
            )

        out.append("")
        out.append(f"Matched: {found}/{len(refs)}")
        out.append("")
        jsonl_by_cap[cap_name] = cap_records

    out_path = ROOT / "core_statutes_matched.md"
    out_path.write_text("\n".join(out), encoding="utf-8")
    print(f"Wrote: {out_path}")

    for cap_name, records in jsonl_by_cap.items():
        cap_token = cap_name.replace(".", "").replace(" ", "_")
        jsonl_path = ROOT / f"{cap_token}.jsonl"
        with jsonl_path.open("w", encoding="utf-8") as f:
            for record in records:
                f.write(json.dumps(record, ensure_ascii=False) + "\n")
        print(f"Wrote: {jsonl_path}")
    typst_dir: Path = ROOT.parent / "cheatsheet" / "sections" / "source-statutes"
    typst_dir.mkdir(exist_ok=True)
    for typ_name, (title, cap_name, html_path) in CAP_MAP.items():
        typst_path = typst_dir / f"{typ_name}"
        records = jsonl_by_cap[cap_name]
        lines = [
            f'#import "../preamble.typ": source-statutes-table, {def_cell(CELL)}, h2',
            "\n",
            f"#h2([{title}])\n",
            "#source-statutes-table(\n",
            "  [*Section*],\n  [*Text*],\n\n",
        ]
        for record in records:
            lines.append(
                f"  {typst_str(str(record['statutes']))},\n"
                f"  {build_cell(CELL,typst_str(str(record['zh'])),typst_str(str(record['en'])))},\n\n"
            )
        lines.append(")")
        with typst_path.open("w", encoding="utf-8") as f:
            f.writelines(lines)
        print(f"Wrote: {typst_path}")
    index_path = typst_dir / "index.typ"
    with index_path.open("w", encoding="utf-8") as f:
        f.writelines(
            [
                '#import "../preamble.typ": h1\n',
                "#h1([Source Statutes])\n",
                '#include "a-copyright.typ"\n',
                '#include "b-pdpo.typ"\n',
                '#include "c-patent.typ"\n',
            ]
        )


if __name__ == "__main__":
    main()
