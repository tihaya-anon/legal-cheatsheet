# File Structure
```
.
├── README.md       # project overview / documentation
├── scripts         # utility scripts
├── enriched        # adds answers to questions from exams and lectures
│   ├── exam
│   └── lecture
├── formatted       # adds markdown formatting to extracted PDF content
│   ├── exam
│   └── lecture
├── src             # original PDF files
│   ├── exam
│   └── lecture
└── translated      # Chinese (Simplified) version
    └── lecture
```

## Cheatsheet fonts (Typst)

`cheatsheet/main.typ` recommends these fonts:

- `Noto Serif CJK SC` (Chinese, Songti style)
- `Tinos` (free Times New Roman-compatible alternative)

Download the required fonts into `cheatsheet/fonts`:

```bash
bash scripts/download-cheatsheet-fonts.sh
```

The script is idempotent: if a font file already exists, it will be skipped.

Then compile with Typst and explicitly include the local font directory:

```bash
typst compile --font-path cheatsheet/fonts cheatsheet/main.typ cheatsheet/main.pdf
```
