#import "../preamble.typ": h2, high-frequency-table
#h2([C. Patent (Cap.514) Tests])
#high-frequency-table(
  columns: (2.8fr, 4.2fr, 1.9fr, 2.2fr, 2.9fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*在检验什么（适用问题）*],
  [*步骤 + 判断（决策树）*],
  [*Test / Doctrine*],
  [*Authority*],
  [*Output Line*],

  [要解决“未字面落入时是否仍侵权”的问题：变体是否按等同原则落入保护范围。],
  [依 Actavis 三问：Q1 是否同方式同结果；Q2 等同是否对本领域技术人员显而易见；Q3 技术人员是否仍理解为必须严格字面遵守 → 若 Q1/Q2 是且 Q3 否，通常落入等同范围；反之通常不落入。],
  [Actavis 3-question equivalence test],
  [*Actavis UK v Eli Lilly* [2017] UKSC 48; Cap.514 s.73],
  [“Applying *Actavis*, Q1/Q2 are yes and Q3 is no, so the variant is likely within claim scope by equivalence.”],

  [要解决“侵权比对基础是否正确”的问题：是否先完成 claim construction。],
  [先解释权利要求文字与必要技术特征 → 再逐项映射被诉产品/方法 → 若未先做或做错 claim construction，后续侵权结论通常不稳；解释正确后再进入逐项比对才有说服力。],
  [Claim construction first],
  [Cap.514 s.73; lecture method],
  [“The infringement analysis starts with claim construction; only then can the alleged product/process be mapped to each essential integer.”],

  [要解决“该发明能否作为可专利主题继续审查”的问题：是否落入 s.9A 排除客体。],
  [Aerotel 四步：1) properly construe claim；2) identify actual contribution；3) 判断该贡献是否仅落入 s.9A 排除范围；4) 判断该贡献是否具技术性质 → 若仅属排除客体且无技术性贡献，则不能获专利；否则可继续审查新颖性与创造性。],
  [Aerotel 4-step excluded subject matter test],
  [*Aerotel v Telco* [2006] EWCA Civ 1371; Cap.514 s.9A(2)],
  [“On *Aerotel* step 3/4, the contribution is [pure business rule / technical], so s.9A exclusion [does / does not] apply.”],

  [要解决“专利是否缺乏新颖性”的问题：是否被单一在先公开完整预见。],
  [锁定 material date → 寻找单一可实施公开（文献/公开使用）→ 逐项核对必要特征是否全部已公开 → 若单一公开已覆盖全部必要特征，则新颖性被破坏；否则该障碍不成立。],
  [Novelty full anticipation check],
  [Cap.514 s.9B + s.2(1)],
  [“Because one prior disclosure contains all claim integers before the material date, novelty under s.9B is destroyed.”],

  [要解决“专利是否缺乏创造性”的问题：区别特征是否显而易见。],
  [先识别区别特征 → 以本领域技术人员视角判断该区别是否显而易见（避免 hindsight）→ 若显而易见，不满足 s.9C；若不显而易见，可通过创造性门槛。],
  [Inventive step obviousness check],
  [Cap.514 s.9C],
  [“The only difference is [...], which would be obvious to the skilled person; s.9C is therefore not satisfied.”],
)
