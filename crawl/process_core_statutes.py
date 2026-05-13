#!/usr/bin/env python3
from __future__ import annotations

import re
import json
from pathlib import Path

from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parent
CORE_DIR = ROOT.parent / "cheatsheet" / "sections" / "core-statutes"

CAP_MAP = {
    "a-copyright.typ": ("Cap.528", ROOT / "Cap.528.html"),
    "b-pdpo.typ": ("Cap.486", ROOT / "Cap.486.html"),
    "c-patent.typ": ("Cap.514", ROOT / "Cap.514.html"),
}


def normalize_space(s: str) -> str:
    return re.sub(r"\s+", " ", s.replace("\xa0", " ")).strip()


def extract_refs_from_typ(typ_text: str) -> list[str]:
    cells = re.findall(r"^\s*\[([^\]]+)\],\s*$", typ_text, flags=re.M)
    data_cells = cells[4:]
    refs = []
    for i in range(0, len(data_cells), 4):
        refs.append(data_cells[i].strip())

    out: list[str] = []
    seen = set()
    for r in refs:
        if r not in seen:
            out.append(r)
            seen.add(r)
    return out


def norm_ref(ref: str) -> str:
    return re.sub(r"\s+", "", ref).lower()


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
    # Expand only plain section refs like s.198 -> s.198(1), s.198(2) / s.198(a), ...
    if not re.fullmatch(r"s\.\d+[a-zA-Z]*", ref.strip()):
        return [ref]

    base_tid = ref_to_temporalid(ref)
    if not base_tid:
        return [ref]

    tokens: set[str] = set()
    base_l = base_tid.lower()
    for key in by_temporalid.keys():
        k = key.lower()
        prefix = base_l + "_"
        if not k.startswith(prefix):
            continue
        rest = k[len(prefix) :]
        if "_" in rest:
            continue
        if re.fullmatch(r"[0-9a-z]+", rest):
            tokens.add(rest)

    if not tokens:
        return [ref]

    sec = ref.strip()[2:]
    expanded = [f"s.{sec}({t})" for t in sorted(tokens, key=sort_token_key)]
    return [ref] + expanded


def expand_refs(refs: list[str], by_temporalid: dict[str, list]) -> list[str]:
    out: list[str] = []
    seen = set()
    for ref in refs:
        for r in expand_simple_section_ref(ref, by_temporalid):
            if r not in seen:
                out.append(r)
                seen.add(r)
    return out


def node_text(node, limit: int = 1400) -> str:
    text = normalize_space(node.get_text(" ", strip=True))
    return text if len(text) <= limit else text[: limit - 3] + "..."


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
    return nodes[0]


def extract_entry_by_lang(
    ref: str, by_temporalid, by_name, full_text: str, lang: str
) -> str | None:
    tid = ref_to_temporalid(ref)
    if tid and tid.lower() in by_temporalid:
        n = pick_lang_node(by_temporalid[tid.lower()], lang)
        if n:
            return node_text(n)

    r = norm_ref(ref)
    if r.startswith("s."):
        m = re.match(r"s\.(\d+[a-z]?)", r)
        if m:
            sec_name = f"s{m.group(1)}"
            nodes = by_name.get(sec_name.lower(), [])
            n = pick_lang_node(nodes, lang)
            if n:
                return node_text(n)

    if r.startswith("ss."):
        m = re.match(r"ss\.(\d+)-(\d+)", r)
        if m:
            start = int(m.group(1))
            end = int(m.group(2))
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


def main() -> None:
    out = ["# Core Statutes Mentioned Provisions (from crawled HTML)", ""]
    jsonl_by_cap: dict[str, list[dict[str, str | bool]]] = {}

    for typ_name, (cap_name, html_path) in CAP_MAP.items():
        cap_records: list[dict[str, str | bool]] = []
        typ_text = (CORE_DIR / typ_name).read_text(encoding="utf-8")
        refs = extract_refs_from_typ(typ_text)

        html = html_path.read_text(encoding="utf-8", errors="ignore")
        soup = BeautifulSoup(html, "html.parser")
        by_temporalid, by_name = build_indices(soup)
        full_text = normalize_space(soup.get_text(" ", strip=True))
        refs = expand_refs(refs, by_temporalid)

        out.append(f"## {cap_name}")
        out.append("")
        out.append("| statutes | zh | en |")
        out.append("|---|---|---|")

        found = 0
        for ref in refs:
            zh = extract_entry_by_lang(
                ref, by_temporalid, by_name, full_text, "zh-Hant-HK"
            )
            en = extract_entry_by_lang(ref, by_temporalid, by_name, full_text, "en")
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
    typst_dir: Path = ROOT.parent / "cheatsheet" / "sections" / "source-statues"
    typst_dir.mkdir(exist_ok=True)
    for typ_name, (cap_name, html_path) in CAP_MAP.items():
        typst_path = typst_dir / f"{typ_name}"
        records = jsonl_by_cap[cap_name]
        lines = [
            '#import "../preamble.typ": source-statutes-table, h2',
            "\n",
            "#h2([])\n",
            "#source-statutes-table(\n",
            "  [*Section*],\n  [*ZH*],\n  [*EN*],\n\n",
        ]
        for record in records:
            lines.append(
                f"  [{record['statutes']}],\n  [{record['zh']}],\n  [{record['en']}],\n\n"
            )
        lines.append(")")
        with typst_path.open("w", encoding="utf-8") as f:
            f.writelines(lines)
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
