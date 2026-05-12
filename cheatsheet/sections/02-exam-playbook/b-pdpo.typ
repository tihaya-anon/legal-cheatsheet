#import "../premable.typ": cell, h2

#h2([B. PDPO Questions])
#table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Issue Type*], [*Statutory Route*], [*What to Prove (Checklist)*], [*Ready-to-Use Answer Skeleton*],
  [Is it personal data?],
  [s.2(1)],
  [是否识别在世个人；数据是否由 data user 控制；是否来自 data processor 场景。],
  [“The information (name + address + phone + account linkage) clearly constitutes personal data under s.2(1).”],

  [New purpose use],
  [DPP3 + s.2(12)],
  [原收集目的与现用途是否一致；是否有订明同意。],
  [“Using the data for direct marketing/doxxing is a new purpose and requires prescribed consent under DPP3.”],

  [Data security incident],
  [DPP4],
  [是否采取合理保安措施；是否存在访问控制、最小权限、日志审计缺陷。],
  [“The breach indicates likely non-compliance with DPP4 unless PFB can show practicable safeguards were in place.”],

  [Data access request],
  [ss.18-21, s.20],
  [请求对象是否“personal data”；能否分离第三方信息；是否触发拒绝理由。],
  [“Bestrade should provide call records as requester’s personal data, but may redact third-party data and rely on s.20 grounds where strictly applicable.”],

  [Data correction],
  [ss.22-25],
  [是否属于不准确资料；更正后通知义务。],
  [“If inaccuracy is established, the data user must correct and notify downstream recipients as required.”],

  [Direct marketing],
  [Part 6A, ss.35B-35M],
  [先告知、同意/不反对、首次通知、退出机制、第三方转移条件。],
  [“SWB’s use appears to contravene Part 6A because consent/notification prerequisites were not met before marketing use.”],

  [Doxxing offences],
  [s.64(1), (3A), (3C) + (3)/(3B)/(3D)],
  [未经同意披露 + 意图/罔顾造成指明伤害 + 实际后果。],
  [“Alex’s postings likely satisfy doxxing elements: unauthorised disclosure, intent/recklessness, and specified harm.”],

  [Commissioner powers],
  [s.50A, s.50B, s.66K-66O],
  [执行通知与停止披露通知是否已发；不遵从的独立刑责。],
  [“If a cessation notice is served, continued disclosure would trigger separate offence exposure under s.66O.”],

  [Compensation claim],
  [s.66, s.66(2), s.65],
  [资料当事人损失（含情感损害）；雇主替代责任与免责。],
  [“Betty may seek compensation under s.66, including injury to feelings, and employer liability may arise via s.65 where applicable.”],
)

