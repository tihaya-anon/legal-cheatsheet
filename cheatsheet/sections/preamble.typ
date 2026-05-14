#let h1(t) = heading(level: 1)[#t]
#let h2(t) = heading(level: 2)[#t]

#let bold-enum-markers(s) = {
  let pat = regex("\\([0-9A-Za-z]+\\)")
  let matches = s.matches(pat)
  if matches.len() == 0 {
    return [#s]
  }

  let chunks = ()
  let pos = 0
  for m in matches {
    if m.start > pos {
      chunks.push(s.slice(pos, m.start))
    }
    let token = m.text.slice(1, m.text.len() - 1)
    let is_enum = token.matches(regex("^[0-9]+[A-Z]{0,3}$")).len() > 0 or token.matches(regex("^[a-z]$")).len() > 0 or token.matches(regex("^[ivxlcdm]{1,6}$")).len() > 0
    if is_enum {
      chunks.push(text(weight: 900, m.text))
    } else {
      chunks.push(m.text)
    }
    pos = m.end
  }
  if pos < s.len() {
    chunks.push(s.slice(pos))
  }

  [
    #for c in chunks [
      #c
    ]
  ]
}

#let source-statutes-table(..c) = table(
  columns: (0.7fr, 8.55fr),
  inset: 1.6pt,
  stroke: .35pt,
  align: left + top,
  ..c,
)
#let source-statutes-dual-cell(zh, en) = [
  #bold-enum-markers(zh)
  #linebreak()
  #bold-enum-markers(en)
]
#let source-statutes-cell(c) = [
  #bold-enum-markers(c)
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
