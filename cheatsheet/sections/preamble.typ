#let h1(t) = heading(level: 1)[#t]
#let h2(t) = heading(level: 2)[#t]

#let source-statutes-table(..c) = table(
  columns: (0.7fr, 8.55fr),
  inset: 1.6pt,
  stroke: .35pt,
  align: left + top,
  ..c,
)
#let source-statutes-dual-cell(zh, en) = [
  #zh
  #linebreak()
  #en
]
#let source-statutes-cell(c) = [
  #c
]
#let core-statutes-table(..c) = table(
  columns: (0.7fr, 1.45fr, 3.9fr, 2.4fr),
  inset: 3pt,
  stroke: .4pt,
  align: left + top,
  ..c,
)
#let exam-playbook-table(..c) = table(
  columns: (1.5fr, 1.4fr, 3.6fr, 3.5fr),
  inset: 3pt,
  stroke: .4pt,
  align: left + top,
  ..c,
)
#let high-frequency-table(..c) = table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 3pt,
  stroke: .4pt,
  align: left + top,
  ..c,
)
