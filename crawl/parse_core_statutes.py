#!/usr/bin/env python3
from __future__ import annotations

import re
from dataclasses import dataclass
from pathlib import Path
from bs4 import BeautifulSoup

ROOT = Path(__file__).resolve().parents[1]
CORE = ROOT / "cheatsheet" / "sections" / "core-statutes"

@dataclass
class Statute:
    name: str
    cap: str
    typ_file: Path
    html_file: Path

STATUTES = [
    Statute("Copyright Ordinance", "Cap.528", CORE / "a-copyright.typ", Path(__file__).resolve().parent / "Cap.528.html"),
    Statute("Personal Data (Privacy) Ordinance", "Cap.486", CORE / "b-pdpo.typ", Path(__file__).resolve().parent / "Cap.486.html"),
    Statute("Patents Ordinance", "Cap.514", CORE / "c-patent.typ", Path(__file__).resolve().parent / "Cap.514.html"),
]

REF_RE = re.compile(r"\[((?:s|ss)\.[^\]]+|DPP\d+|Part\s+\d+[A-Z]?)\]")


def extract_refs(typ_text: str) -> list[str]:
    refs: list[str] = []
    seen = set()
    for m in REF_RE.finditer(typ_text):
        ref = m.group(1).strip()
        if ref not in seen:
            seen.add(ref)
            refs.append(ref)
    return refs


def expand_ref(ref: str) -> list[str]:
    if ref.startswith("ss."):
        tail = ref[3:].strip()
        m = re.fullmatch(r"(\d+)-(?:(\d+))", tail)
        if m:
            a, b = int(m.group(1)), int(m.group(2))
            if a <= b:
                return [f"s.{i}" for i in range(a, b + 1)]
        return [ref]
    return [ref]


def ref_to_temporalid(ref: str) -> str | None:
    ref = ref.strip()
    if ref.startswith("Part "):
        return "P" + ref.split()[1]
    if ref.startswith("DPP"):
        n = ref.replace("DPP", "").strip()
        if n.isdigit():
            return f"sch1_s{n}"
        return None
    if not ref.startswith("s."):
        return None

    m = re.match(r"s\.([0-9]+[A-Z]?)(.*)$", ref)
    if not m:
        return None

    section = m.group(1)
    rest = m.group(2)
    parts = [section]
    for token in re.findall(r"\(([^)]+)\)", rest):
        parts.append(token)
    return "s" + "_".join(parts)


def clean_text(s: str) -> str:
    s = re.sub(r"\s+", " ", s or "").strip()
    return s


def extract_heading_and_excerpt(el) -> tuple[str, str]:
    heading = ""
    h = el.find(class_=re.compile(r"hklm_heading|hklm_crossHeading")) if hasattr(el, "find") else None
    if h:
        heading = clean_text(h.get_text(" ", strip=True))

    body_bits: list[str] = []
    if hasattr(el, "find_all"):
        for cls in ["hklm_leadIn", "hklm_content", "hklm_continued"]:
            for c in el.find_all(class_=cls):
                txt = clean_text(c.get_text(" ", strip=True))
                if txt:
                    body_bits.append(txt)
    excerpt = clean_text(" ".join(body_bits))
    if len(excerpt) > 220:
        excerpt = excerpt[:217] + "..."
    return heading, excerpt


def find_best_temporal_match(soup: BeautifulSoup, temporalid: str):
    candidates = []
    for key in (temporalid, temporalid.lower(), temporalid.upper()):
        candidates.extend(soup.find_all(attrs={"temporalid": key}))
    if not candidates:
        return None
    # Prefer node with richer text (avoids empty wrapper duplicates).
    return max(candidates, key=lambda el: len(clean_text(el.get_text(" ", strip=True))))


def main() -> None:
    out_lines = [
        "# Core Statutes Extract (from downloaded Cap HTML)",
        "",
        "| Statute | Cap | Requested Ref | Matched Item | Heading | Excerpt |",
        "|---|---|---|---|---|---|",
    ]

    for st in STATUTES:
        typ_text = st.typ_file.read_text(encoding="utf-8")
        refs = extract_refs(typ_text)

        html = st.html_file.read_text(encoding="utf-8", errors="ignore")
        soup = BeautifulSoup(html, "html.parser")

        for raw_ref in refs:
            expanded = expand_ref(raw_ref)
            for ref in expanded:
                temporalid = ref_to_temporalid(ref)
                matched = None

                if temporalid:
                    matched = find_best_temporal_match(soup, temporalid)
                if matched is None:
                    out_lines.append(
                        f"| {st.name} | {st.cap} | `{ref}` | NOT FOUND |  |  |"
                    )
                    continue

                heading, excerpt = extract_heading_and_excerpt(matched)
                matched_id = temporalid if temporalid else ref
                heading = heading.replace("|", "\\|")
                excerpt = excerpt.replace("|", "\\|")
                out_lines.append(
                    f"| {st.name} | {st.cap} | `{ref}` | `{matched_id}` | {heading} | {excerpt} |"
                )

    out_path = Path(__file__).resolve().parent / "core-statutes-extract.md"
    out_path.write_text("\n".join(out_lines) + "\n", encoding="utf-8")
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
