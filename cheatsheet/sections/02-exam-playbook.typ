#let h1(t) = heading(level: 1)[#t]
#let h2(t) = heading(level: 2)[#t]
#let cell(x) = [#x]

#h1([Exam Answer Playbook])

#h2([A. Copyright Questions])
#table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Issue Type*], [*Statutory Route*], [*What to Prove (Checklist)*], [*Ready-to-Use Answer Skeleton*],
  [Identify works], [s.2(1), s.4], [逐项拆分：文本、图表、源代码、目标代码、字幕、数据库结构等是否是独立作品类别。], [“Relevant works include [...]. Each qualifies as [literary/artistic/etc.] under s.[...].”],
  [Authorship & first ownership], [s.11-s.15, s.13], [先定作者，再定第一所有权；雇员职务作品通常归雇主；委托关系看合同。], [“Authorship lies with [...], but first ownership vests in [...] under s.[...], subject to any contrary agreement.”],
  [Freelancer/commissioned work], [s.14(1), s.15(1), s.15(2)], [先分流：employee 还是 independent contractor（freelancer）；若是雇员再看是否 in the course of employment；若是委托创作先看合同，没写明时补上 s.15(2) 的法定独占利用权 + 禁止不合理用途权。], [“As X is a freelancer, ownership is governed primarily by contract under s.15(1); even absent express assignment, the commissioner may rely on s.15(2) statutory exploitation rights.”],
  [Primary infringement], [s.22 + s.23/24/25/27/28A/29], [是否实施受限制行为；是否取用实质部分；有无许可；线上行为优先审 s.28A。], [“By [copying/communicating/adapting] a substantial part without licence, D prima facie infringes under s.22 read with s.[...].”],
  [Software modification], [s.23, s.29(3)(b)], [反编译、替换模块、翻译代码都要审复制/改编；“自己写的新模块”不当然免除对原作取用。], [“Even if D wrote new code, liability remains if substantial original code/structure was copied or adapted.”],
  [Secondary infringement], [s.30-s.32, s.35], [进口、持有、分销、售卖侵权复制品；是否知悉或应知。], [“D dealt in infringing copies in the course of business and had at least reason to believe their status, engaging s.[...].”],
  [Criminal copyright], [s.118, s.120], [商业规模、牟利性、跨境复制并回港等情形；民刑分流要写清。], [“Civil liability arises under ss.30-32; criminal exposure may additionally arise under ss.118/120 on these commercial facts.”],
  [Exclusive licensee standing], [s.103, s.112, s.113], [排他被许可人可否单独起诉，是否须并列权利人。], [“LetFlix, as exclusive licensee, may sue under s.[...] subject to procedural joinder requirements.”],
  [Fair dealing defences], [s.37(3), s.38, s.39, s.39A, s.41A], [目的、比例、市场替代效应、鸣谢；“非商业”声明不自动成立抗辩。], [“The defence is unlikely because the use substituted the market for the original and exceeded what is fair under s.37(3).”],
  [Internet/transmission], [s.28A, s.65], [串流、缓存、可下载性、向公众开放程度；浏览豁免边界。], [“Uploading/streaming to subscribers is communication to the public under s.28A; s.65 does not excuse this commercial dissemination.”],
)

#h2([B. PDPO Questions])
#table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Issue Type*], [*Statutory Route*], [*What to Prove (Checklist)*], [*Ready-to-Use Answer Skeleton*],
  [Is it personal data?], [s.2(1)], [是否识别在世个人；数据是否由 data user 控制；是否来自 data processor 场景。], [“The information (name + address + phone + account linkage) clearly constitutes personal data under s.2(1).”],
  [New purpose use], [DPP3 + s.2(12)], [原收集目的与现用途是否一致；是否有订明同意。], [“Using the data for direct marketing/doxxing is a new purpose and requires prescribed consent under DPP3.”],
  [Data security incident], [DPP4], [是否采取合理保安措施；是否存在访问控制、最小权限、日志审计缺陷。], [“The breach indicates likely non-compliance with DPP4 unless PFB can show practicable safeguards were in place.”],
  [Data access request], [ss.18-21, s.20], [请求对象是否“personal data”；能否分离第三方信息；是否触发拒绝理由。], [“Bestrade should provide call records as requester’s personal data, but may redact third-party data and rely on s.20 grounds where strictly applicable.”],
  [Data correction], [ss.22-25], [是否属于不准确资料；更正后通知义务。], [“If inaccuracy is established, the data user must correct and notify downstream recipients as required.”],
  [Direct marketing], [Part 6A, ss.35B-35M], [先告知、同意/不反对、首次通知、退出机制、第三方转移条件。], [“SWB’s use appears to contravene Part 6A because consent/notification prerequisites were not met before marketing use.”],
  [Doxxing offences], [s.64(1), (3A), (3C) + (3)/(3B)/(3D)], [未经同意披露 + 意图/罔顾造成指明伤害 + 实际后果。], [“Alex’s postings likely satisfy doxxing elements: unauthorised disclosure, intent/recklessness, and specified harm.”],
  [Commissioner powers], [s.50A, s.50B, s.66K-66O], [执行通知与停止披露通知是否已发；不遵从的独立刑责。], [“If a cessation notice is served, continued disclosure would trigger separate offence exposure under s.66O.”],
  [Compensation claim], [s.66, s.66(2), s.65], [资料当事人损失（含情感损害）；雇主替代责任与免责。], [“Betty may seek compensation under s.66, including injury to feelings, and employer liability may arise via s.65 where applicable.”],
)

#h2([C. Patent Questions])
#table(
  columns: (1.5fr, 2.4fr, 3.6fr, 3.5fr),
  inset: 4pt,
  stroke: .4pt,
  align: left + top,
  [*Issue Type*], [*Statutory Route*], [*What to Prove (Checklist)*], [*Ready-to-Use Answer Skeleton*],
  [Excluded subject matter], [s.9A, s.9A(2)-(6)], [先定 claim 的“真正内容”；再逐项看是否落入发现/数学方法/商业方法/治疗方法等排除。若有技术效果与技术手段，论证其不只是抽象规则。], [“The process claim should first be screened under s.9A. On these facts, the claim is [not merely abstract / likely an excluded method] because ... Therefore the claim is [not excluded / excluded] at this stage.”],
  [Novelty attack], [s.9B + s.2(1)], [锁定 material date；找最接近现有技术；比对每个必要技术特征是否全部先前公开。只要单一文献完整披露，即缺新颖性。], [“The material date is [date]. If the prior use/publication already disclosed all essential integers of the claim, the claim lacks novelty under s.9B.”],
  [Inventive step], [s.9C], [识别区别特征；判断对本领域技术人员是否显而易见；避免事后诸葛。若仅替换同等元件，通常显而易见。], [“Compared with [closest prior art], the only distinguishing feature is [...]. This appears [obvious/non-obvious] to the skilled person, so s.9C is [not met/met].”],
  [Industrial applicability], [s.9D], [能否在产业中制造或使用并重复实现技术效果。纯审美/纯智力步骤较难满足。], [“The claimed invention is capable of industrial application because it can be repeatedly implemented in [...], satisfying s.9D.”],
  [Employee invention ownership], [s.57, s.9E], [是否在受雇过程中作出；是否属受雇职责或特别指派任务；合同是否另有约定。], [“Although X is named inventor, entitlement depends on s.57 and employment context. Since the invention was made [in/outside] normal duties, title should vest in [employer/employee].”],
  [Co-ownership/licensing], [s.54(1)-(3)], [若为共同权利人，审查单方许可或处分是否需要他方同意。], [“Under s.54, a co-owner cannot freely grant third-party rights beyond the statutory scope without the required concurrence.”],
  [Revocation strategy], [s.91, s.9A-9D, s.11A], [被诉方应同时主张不可专利、新颖性缺失、创造性不足、说明不足等；并检视不损害披露例外是否可救。], [“DreamToys should file revocation under s.91, relying primarily on [s.9B/s.9C], and pre-empt any s.11A exception by contesting its conditions.”],
  [Pre-grant protection], [s.88(1), s.88(3)], [公开后到授权前是否可追溯；需证明后续授权权利覆盖相关行为。], [“If grant is eventually obtained, s.88 may allow limited retrospective relief for acts done after publication, subject to statutory conditions.”],
)