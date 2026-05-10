#let h1(t) = heading(level: 1)[#t]
#let h2(t) = heading(level: 2)[#t]
#let cell(x) = [#x]

#h1([High-Frequency Tests])

#h2([A. Patent Tests])
#table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Test / Doctrine*], [*Authority*], [*Checklist (Exam Steps)*], [*Output Line*],
  [Actavis 3-question equivalence test], [*Actavis UK v Eli Lilly* [2017] UKSC 48; Cap.514 s.73], [1) 变体是否以基本相同方式实现基本相同结果；2) 在优先权日假设知识下，该等同方式对本领域技术人员是否显而易见；3) 技术人员会否认为专利权人仍坚持字面严格遵守为必要要求。], [“Applying *Actavis*, Q1/Q2 are yes and Q3 is no, so the variant is likely within claim scope by equivalence.”],
  [Claim construction first], [Cap.514 s.73; lecture method], [先解释权利要求文字与必要技术特征，再做逐项比对；不要跳过 claim construction 直接谈侵权。], [“The infringement analysis starts with claim construction; only then can the alleged product/process be mapped to each essential integer.”],
  [Aerotel 4-step excluded subject matter test], [*Aerotel v Telco* [2006] EWCA Civ 1371; Cap.514 s.9A(2)], [1) properly construe claim；2) identify actual contribution；3) 看是否仅落入排除客体；4) 检查贡献是否具技术性质。], [“On *Aerotel* step 3/4, the contribution is [pure business rule / technical], so s.9A exclusion [does / does not] apply.”],
  [Novelty full anticipation check], [Cap.514 s.9B + s.2(1)], [锁定 material date；找单一最接近文献/公开使用；逐项核对必要特征是否全部已公开（enabling disclosure）。], [“Because one prior disclosure contains all claim integers before the material date, novelty under s.9B is destroyed.”],
  [Inventive step obviousness check], [Cap.514 s.9C], [识别区别特征；以本领域技术人员视角判断是否显而易见；避免 hindsight reasoning。], [“The only difference is [...], which would be obvious to the skilled person; s.9C is therefore not satisfied.”],
)

#h2([B. Copyright Tests])
#table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Test / Doctrine*], [*Authority*], [*Checklist (Exam Steps)*], [*Output Line*],
  [Employee vs freelancer ownership test], [Cap.528 s.14(1), s.15(1), s.15(2)], [1) 先定身份：employee 或 independent contractor；2) employee 则查是否 in course of employment（事实判断）；3) freelancer/commissioned 则以合同分配为主；4) 若合同未写明归属，补写 s.15(2) 两项法定权利。], [“Ownership does not automatically pass to the hiring party for freelancer work; absent assignment, analyse s.15(1) contract terms and s.15(2) statutory rights.”],
  [Substantial part test (qualitative)], [Cap.528 s.22(3); case law approach], [判断“实质部分”看质不看量：是否取用了体现原创性的核心表达/结构/编排，而非仅看字节或行数。], [“Although quantitatively limited, what was taken is qualitatively substantial, so s.22(3) is met.”],
  [Moorhouse authorisation test], [*UNSW v Moorhouse*; Cap.528 s.22(2), s.22(2A)], [看被告是否控制侵权工具/平台、知悉或应知侵权风险、且未采取合理限缩措施；“仅便利”不当然等于授权。], [“Given control + knowledge + inadequate preventive steps, D likely authorised primary infringement under s.22(2).”],
  [Hypothetical manufacture test for infringing copy], [Cap.528 s.35(3)], [针对境外制作复制品：若“假设在香港制作”会侵权，则该复制品可被视为 infringing copy（并联动次级侵权）。], [“Under s.35(3), the imported copies are treated as infringing copies because local hypothetical manufacture would infringe.”],
  [Fair dealing 4-factor test], [Cap.528 s.38(3), s.39(4), s.39A(2), s.41A(2), s.37(3)], [四因素：用途性质、原作品性质、取用比例与实质性、对市场替代影响；并总览全部情境与正常利用冲突。], [“On the four factors, the dealing substitutes the original market and is unlikely to be fair.”],
)

#h2([C. PDPO Tests])
#table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Test / Doctrine*], [*Authority*], [*Checklist (Exam Steps)*], [*Output Line*],
  [Personal data threshold test], [Cap.486 s.2(1)], [是否关乎在世个人 + 能否直接/间接识别 + 是否由 data user 控制/持有于相关处理场景。], [“The dataset is personal data because individuals are identifiable from linked identifiers and account records.”],
  [New purpose + prescribed consent test], [DPP3 + Cap.486 s.2(12)], [先定原收集目的，再看现用途是否“new purpose”；若是新用途，检查是否有有效订明同意与证据链。], [“The marketing/doxxing use is a new purpose and is unlawful absent prescribed consent under DPP3.”],
  [DPP4 practicable security test], [DPP4], [是否有合理可行保安措施：最小权限、访问控制、日志审计、离职权限回收、异常告警、供应商管理。], [“Given weak access controls and missing audit safeguards, DPP4 non-compliance is likely.”],
  [DAR partial compliance test], [Cap.486 ss.18-21, esp. s.20], [先审是否 requester 的 personal data；若夹杂第三方信息，优先删改/遮蔽后部分披露；拒绝须逐项给法定理由。], [“The data user should provide a redacted response rather than blanket refusal, with specific s.20 reasons for withheld parts.”],
  [Doxxing elements test], [Cap.486 s.64(1), (3)/(3A)/(3B)/(3C)/(3D)], [未经相关同意披露 + 意图或罔顾造成指明伤害 +（加重型）实际伤害/持续扩散；最后单列抗辩。], [“The postings likely satisfy unauthorised disclosure and harm-intent elements, engaging s.64 doxxing liability.”],
)

