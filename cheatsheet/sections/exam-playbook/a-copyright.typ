#import "../premable.typ": h2

#h2([A. Copyright Questions])
#table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Issue Type*], [*Statutory Route*], [*What to Prove (Checklist)*], [*Ready-to-Use Answer Skeleton*],
  [Identify works],
  [s.2(1), s.4],
  [逐项拆分：文本、图表、源代码、目标代码、字幕、数据库结构等是否是独立作品类别。],
  [“Relevant works include [...]. Each qualifies as [literary/artistic/etc.] under s.[...].”],

  [Authorship & first ownership],
  [s.11-s.15, s.13],
  [先定作者，再定第一所有权；雇员职务作品通常归雇主；委托关系看合同。],
  [“Authorship lies with [...], but first ownership vests in [...] under s.[...], subject to any contrary agreement.”],

  [Freelancer/commissioned work],
  [s.14(1), s.15(1), s.15(2)],
  [先分流：employee 还是 independent contractor（freelancer）；若是雇员再看是否 in the course of employment；若是委托创作先看合同，没写明时补上 s.15(2) 的法定独占利用权 + 禁止不合理用途权。],
  [“As X is a freelancer, ownership is governed primarily by contract under s.15(1); even absent express assignment, the commissioner may rely on s.15(2) statutory exploitation rights.”],

  [Primary infringement],
  [s.22 + s.23/24/25/27/28A/29],
  [是否实施受限制行为；是否取用实质部分；有无许可；线上行为优先审 s.28A。],
  [“By [copying/communicating/adapting] a substantial part without licence, D prima facie infringes under s.22 read with s.[...].”],

  [Software modification],
  [s.23, s.29(3)(b)],
  [反编译、替换模块、翻译代码都要审复制/改编；“自己写的新模块”不当然免除对原作取用。],
  [“Even if D wrote new code, liability remains if substantial original code/structure was copied or adapted.”],

  [Secondary infringement],
  [s.30-s.32, s.35],
  [进口、持有、分销、售卖侵权复制品；是否知悉或应知。],
  [“D dealt in infringing copies in the course of business and had at least reason to believe their status, engaging s.[...].”],

  [Criminal copyright],
  [s.118, s.120],
  [商业规模、牟利性、跨境复制并回港等情形；民刑分流要写清。],
  [“Civil liability arises under ss.30-32; criminal exposure may additionally arise under ss.118/120 on these commercial facts.”],

  [Exclusive licensee standing],
  [s.103, s.112, s.113],
  [排他被许可人可否单独起诉，是否须并列权利人。],
  [“LetFlix, as exclusive licensee, may sue under s.[...] subject to procedural joinder requirements.”],

  [Fair dealing defences],
  [s.37(3), s.38, s.39, s.39A, s.41A],
  [目的、比例、市场替代效应、鸣谢；“非商业”声明不自动成立抗辩。],
  [“The defence is unlikely because the use substituted the market for the original and exceeded what is fair under s.37(3).”],

  [Internet/transmission],
  [s.28A, s.65],
  [串流、缓存、可下载性、向公众开放程度；浏览豁免边界。],
  [“Uploading/streaming to subscribers is communication to the public under s.28A; s.65 does not excuse this commercial dissemination.”],
)

