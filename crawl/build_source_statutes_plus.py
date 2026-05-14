#!/usr/bin/env python3
from __future__ import annotations

import re
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = ROOT / "cheatsheet" / "sections" / "source-statutes"
OUT_DIR = ROOT / "cheatsheet" / "sections" / "source-statutes-plus"
FILES = ["a-copyright.typ", "b-pdpo.typ", "c-patent.typ"]
NOTES_PATH = ROOT / "crawl" / "source_statutes_plus_notes.json"
CAP_BY_FILE = {
    "a-copyright.typ": "Cap.528",
    "b-pdpo.typ": "Cap.486",
    "c-patent.typ": "Cap.514",
}


def esc_typst_str(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def parse_entries(content: str) -> list[tuple[str, str]]:
    # Match:
    #   "s.xx",
    #   source-statutes-cell("...")
    pattern = re.compile(
        r'\n\s*"([^"]+)",\n\s*source-statutes-cell\("((?:[^"\\]|\\.)*)"\),'
    )
    out: list[tuple[str, str]] = []
    for sec, raw in pattern.findall(content):
        text = raw.replace('\\"', '"').replace("\\\\", "\\")
        out.append((sec, text))
    return out


def build_file(name: str) -> None:
    notes_all = json.loads(NOTES_PATH.read_text(encoding="utf-8"))
    cap = CAP_BY_FILE[name]
    notes_map: dict[str, str] = notes_all.get(cap, {})

    src = (SRC_DIR / name).read_text(encoding="utf-8")
    title_m = re.search(r"#h2\(\[(.*?)\]\)", src)
    title = title_m.group(1) if title_m else ""
    entries = parse_entries(src)

    lines = [
        '#import "../preamble.typ": source-statutes-plus-table, source-statutes-cell, h2',
        f"#h2([{title}])",
        "#source-statutes-plus-table(",
        "  [*Section*],",
        "  [*Text*],",
        "  [*Notes*],",
        "",
    ]
    for sec, txt in entries:
        note = notes_map.get(sec)
        if not note:
            note = "待补：人工口语化注释。"
        if re.sub(r"\s+", " ", txt).strip().startswith("NOT FOUND"):
            note = "未匹配到条文。先核对条号，再回抓。"
        lines.append(f"  {esc_typst_str(sec)},")
        lines.append(f"  source-statutes-cell({esc_typst_str(txt)}),")
        lines.append(f"  source-statutes-cell({esc_typst_str(note)}),")
        lines.append("")
    lines.append(")")
    (OUT_DIR / name).write_text("\n".join(lines), encoding="utf-8")


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    for name in FILES:
        build_file(name)
    (OUT_DIR / "index.typ").write_text(
        "\n".join(
            [
                '#import "../preamble.typ": h1',
                "#h1([Source Statutes])",
                '#include "a-copyright.typ"',
                '#include "b-pdpo.typ"',
                '#include "c-patent.typ"',
            ]
        ),
        encoding="utf-8",
    )
    print(f"Wrote: {OUT_DIR}")


if __name__ == "__main__":
    main()
