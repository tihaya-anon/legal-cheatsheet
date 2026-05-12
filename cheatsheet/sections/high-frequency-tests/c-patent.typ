#import "../preamble.typ": h2, high-frequency-table
#h2([C. Patent Tests])
#high-frequency-table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Test / Doctrine*],
  [*Authority*],
  [*Checklist (Exam Steps)*],
  [*Output Line*],
  [Actavis 3-question equivalence test],
  [*Actavis UK v Eli Lilly* [2017] UKSC 48; Cap.514 s.73],
  [1) 变体是否以基本相同方式实现基本相同结果；2) 在优先权日假设知识下，该等同方式对本领域技术人员是否显而易见；3) 技术人员会否认为专利权人仍坚持字面严格遵守为必要要求。],
  [“Applying *Actavis*, Q1/Q2 are yes and Q3 is no, so the variant is likely within claim scope by equivalence.”],

  [Claim construction first],
  [Cap.514 s.73; lecture method],
  [先解释权利要求文字与必要技术特征，再做逐项比对；不要跳过 claim construction 直接谈侵权。],
  [“The infringement analysis starts with claim construction; only then can the alleged product/process be mapped to each essential integer.”],

  [Aerotel 4-step excluded subject matter test],
  [*Aerotel v Telco* [2006] EWCA Civ 1371; Cap.514 s.9A(2)],
  [1) properly construe claim；2) identify actual contribution；3) 看是否仅落入排除客体；4) 检查贡献是否具技术性质。],
  [“On *Aerotel* step 3/4, the contribution is [pure business rule / technical], so s.9A exclusion [does / does not] apply.”],

  [Novelty full anticipation check],
  [Cap.514 s.9B + s.2(1)],
  [锁定 material date；找单一最接近文献/公开使用；逐项核对必要特征是否全部已公开（enabling disclosure）。],
  [“Because one prior disclosure contains all claim integers before the material date, novelty under s.9B is destroyed.”],

  [Inventive step obviousness check],
  [Cap.514 s.9C],
  [识别区别特征；以本领域技术人员视角判断是否显而易见；避免 hindsight reasoning。],
  [“The only difference is [...], which would be obvious to the skilled person; s.9C is therefore not satisfied.”],
)
