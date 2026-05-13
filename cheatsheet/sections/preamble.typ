#let h1(t) = heading(level: 1)[#t]
#let h2(t) = heading(level: 2)[#t]

#let source-statutes-table(..c) = table(
  columns: (0.8fr, 3.9fr, 3.9fr),
  inset: 5pt,
  stroke: .5pt,
  align: left + top,
  ..c,
)
#let core-statutes-table(..c) = table(
  columns: (0.8fr, 1.45fr, 3.9fr, 2.4fr),
  inset: 5pt,
  stroke: .5pt,
  align: left + top,
  ..c,
)
#let exam-playbook-table(..c) = table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  ..c,
)
#let high-frequency-table(..c) = table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  ..c,
)
