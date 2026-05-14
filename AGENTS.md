# Repo Workflow Notes

- When editing `crawl/source_statutes_plus_notes.json` or other source-statutes-plus inputs, run generation and compile checks after changes.
- First run: `uv run python crawl/process_core_statutes.py`
- Then compile: `typst compile --font-path cheatsheet/fonts cheatsheet/main.typ cheatsheet/main.pdf`

