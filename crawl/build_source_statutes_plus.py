#!/usr/bin/env python3
from __future__ import annotations

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = ROOT / "cheatsheet" / "sections" / "source-statutes"
OUT_DIR = ROOT / "cheatsheet" / "sections" / "source-statutes-plus"
FILES = ["a-copyright.typ", "b-pdpo.typ", "c-patent.typ"]


def clean_text(text: str) -> str:
    t = re.sub(r"\s+", " ", text).strip()
    t = re.sub(r"\(由[^)]*修订\)", "", t)
    t = re.sub(r"\[比照[^]]*]", "", t)
    t = re.sub(r"\s+", " ", t).strip()
    return t


def first_clauses(text: str, limit: int = 2) -> list[str]:
    t = clean_text(text)
    parts = re.split(r"[。；;!?！？]", t)
    out: list[str] = []
    for p in parts:
        p = p.strip(" ，,：:、")
        if not p:
            continue
        out.append(p)
        if len(out) >= limit:
            break
    return out


def simplify(text: str) -> str:
    raw = re.sub(r"\s+", " ", text).strip()
    if raw.startswith("NOT FOUND"):
        return "未匹配到条文。先核对条号，再回抓。"

    clauses = first_clauses(raw, limit=2)
    if not clauses:
        return "条文较长。先看左栏原文。"

    # Prefer short, direct statements; avoid fixed repetitive templates.
    c1 = clauses[0]
    c1 = re.sub(r"^\d+[A-Za-z]?\.\s*", "", c1).strip()
    c1 = re.sub(r"^第[一二三四五六七八九十0-9]+条\s*", "", c1).strip()
    c1 = re.sub(r"\([^)]*\)", "", c1).strip()
    c1 = c1[:46].rstrip(" ，,;；:：")

    if len(clauses) > 1:
        c2 = re.sub(r"\([^)]*\)", "", clauses[1]).strip()
        c2 = c2[:34].rstrip(" ，,;；:：")
        return f"{c1}。另：{c2}。"
    return f"{c1}。"


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
        lines.append(f"  {esc_typst_str(sec)},")
        lines.append(f"  source-statutes-cell({esc_typst_str(txt)}),")
        lines.append(f"  source-statutes-cell({esc_typst_str(simplify(txt))}),")
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
