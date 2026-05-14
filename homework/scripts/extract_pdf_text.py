from __future__ import annotations

from pathlib import Path
import re

import pdfplumber
from pypdf import PdfReader


ROOT = Path(__file__).resolve().parents[1]
PDF_DIR = ROOT / "data"
OUT_DIR = ROOT / "data" / "extracted"


def clean_text(text: str) -> str:
    text = text.replace("\r\n", "\n").replace("\r", "\n")
    text = text.replace("\x00", "")
    # collapse excessive blank lines
    text = re.sub(r"\n{3,}", "\n\n", text)
    return text.strip()


def extract_with_pdfplumber(pdf_path: Path) -> list[str]:
    pages: list[str] = []
    with pdfplumber.open(pdf_path) as pdf:
        for p in pdf.pages:
            pages.append((p.extract_text() or "").strip())
    return pages


def extract_with_pypdf(pdf_path: Path) -> list[str]:
    pages: list[str] = []
    reader = PdfReader(str(pdf_path))
    for p in reader.pages:
        pages.append((p.extract_text() or "").strip())
    return pages


def extract_pdf(pdf_path: Path) -> tuple[str, int, int]:
    pages = extract_with_pdfplumber(pdf_path)
    nonempty = sum(1 for x in pages if x)

    if nonempty == 0:
        pages = extract_with_pypdf(pdf_path)
        nonempty = sum(1 for x in pages if x)

    chunks: list[str] = []
    for i, text in enumerate(pages, start=1):
        label = f"--- page {i} ---"
        chunks.append(label)
        chunks.append(text if text else "[NO TEXT EXTRACTED]")

    joined = clean_text("\n\n".join(chunks)) + "\n"
    return joined, len(pages), nonempty


def main() -> None:
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    pdf_files = sorted(PDF_DIR.glob("*.pdf"))

    if not pdf_files:
        raise SystemExit(f"No PDF files found in {PDF_DIR}")

    report_lines: list[str] = []

    for pdf_path in pdf_files:
        text, total_pages, nonempty_pages = extract_pdf(pdf_path)
        out_name = pdf_path.stem + ".txt"
        out_path = OUT_DIR / out_name
        out_path.write_text(text, encoding="utf-8")

        report_lines.append(
            f"{pdf_path.name}: pages={total_pages}, nonempty_pages={nonempty_pages}, output={out_path.relative_to(ROOT)}"
        )

    report = "\n".join(report_lines)
    print(report)


if __name__ == "__main__":
    main()
