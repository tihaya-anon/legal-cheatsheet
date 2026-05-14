#import "../preamble.typ": h2, high-frequency-table
#h2([B. PDPO Tests])
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

  [要解决“这批信息是否受 PDPO 规制”的问题：是否构成 personal data。],
  [看是否关乎在世个人 + 是否可直接/间接识别 + 是否处于 data user 控制/持有场景 → 三者满足时通常构成 personal data，进入 DPP 义务框架；否则相关义务通常不触发或明显减弱。],
  [Personal data threshold test],
  [Cap.486 s.2(1)],
  [“The dataset is personal data because individuals are identifiable from linked identifiers and account records.”],

  [要解决“新用途是否合法”的问题：现用途是否超出原收集目的且缺乏同意。],
  [先定原收集目的 → 判断现用途是否属于 new purpose → 若是，继续查是否有有效 prescribed consent 与证据链；若无有效同意，通常违反 DPP3；若非 new purpose 或同意完整，风险下降。],
  [New purpose + prescribed consent test],
  [DPP3 + Cap.486 s.2(12)],
  [“The marketing/doxxing use is a new purpose and is unlawful absent prescribed consent under DPP3.”],

  [要解决“数据保安是否合规”的问题：是否已采取合理可行安全措施。],
  [按 DPP4 要素核查：最小权限、访问控制、日志审计、离职权限回收、异常告警、供应商管理 → 若关键环节缺失，较可能不合规；若措施系统且可证明执行，较能支持合规立场。],
  [DPP4 practicable security test],
  [DPP4],
  [“Given weak access controls and missing audit safeguards, DPP4 non-compliance is likely.”],

  [要解决“DAR 能否整体拒绝”的问题：是否应部分履行而非一概拒绝。],
  [先审请求是否针对 requester 本人 personal data → 若夹杂第三方信息，先做删改/遮蔽并部分披露 → 仅在适用法定例外时拒绝，且需逐项给出 s.20 理由；无充分理由的 blanket refusal 风险高。],
  [DAR partial compliance test],
  [Cap.486 ss.18-21, esp. s.20],
  [“The data user should provide a redacted response rather than blanket refusal, with specific s.20 reasons for withheld parts.”],

  [要解决“是否构成 doxxing 责任”的问题：行为是否满足法定构成要件。],
  [按要件逐层判断：是否未经同意披露 + 是否具伤害意图/罔顾 +（加重型）是否出现实际伤害或持续扩散 → 要件齐备则可能触发 s.64 责任；若关键要件缺失或抗辩成立，责任不成立或减轻。],
  [Doxxing elements test],
  [Cap.486 s.64(1), (3)/(3A)/(3B)/(3C)/(3D)],
  [“The postings likely satisfy unauthorised disclosure and harm-intent elements, engaging s.64 doxxing liability.”],
)
