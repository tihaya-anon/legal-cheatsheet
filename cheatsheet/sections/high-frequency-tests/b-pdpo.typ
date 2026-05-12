#import "../preamble.typ": h2, high-frequency-table
#h2([B. PDPO Tests])
#high-frequency-table(
  columns: (1.9fr, 2.5fr, 3.8fr, 3.1fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Test / Doctrine*],
  [*Authority*],
  [*Checklist (Exam Steps)*],
  [*Output Line*],
  [Personal data threshold test],
  [Cap.486 s.2(1)],
  [是否关乎在世个人 + 能否直接/间接识别 + 是否由 data user 控制/持有于相关处理场景。],
  [“The dataset is personal data because individuals are identifiable from linked identifiers and account records.”],

  [New purpose + prescribed consent test],
  [DPP3 + Cap.486 s.2(12)],
  [先定原收集目的，再看现用途是否“new purpose”；若是新用途，检查是否有有效订明同意与证据链。],
  [“The marketing/doxxing use is a new purpose and is unlawful absent prescribed consent under DPP3.”],

  [DPP4 practicable security test],
  [DPP4],
  [是否有合理可行保安措施：最小权限、访问控制、日志审计、离职权限回收、异常告警、供应商管理。],
  [“Given weak access controls and missing audit safeguards, DPP4 non-compliance is likely.”],

  [DAR partial compliance test],
  [Cap.486 ss.18-21, esp. s.20],
  [先审是否 requester 的 personal data；若夹杂第三方信息，优先删改/遮蔽后部分披露；拒绝须逐项给法定理由。],
  [“The data user should provide a redacted response rather than blanket refusal, with specific s.20 reasons for withheld parts.”],

  [Doxxing elements test],
  [Cap.486 s.64(1), (3)/(3A)/(3B)/(3C)/(3D)],
  [未经相关同意披露 + 意图或罔顾造成指明伤害 +（加重型）实际伤害/持续扩散；最后单列抗辩。],
  [“The postings likely satisfy unauthorised disclosure and harm-intent elements, engaging s.64 doxxing liability.”],
)

