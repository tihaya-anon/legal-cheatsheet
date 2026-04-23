#set page(
  paper: "a4",
  margin: (x: 6.5mm, y: 6mm),
)
#set text(
  size: 7pt,
  font: (
    "Tinos",
    "Noto Serif CJK SC",
    "Noto Sans CJK SC",
    "DejaVu Serif",
  ),
)
#set heading(numbering: none)
#set list(tight: true, spacing: 0em)
#set block(spacing: 0em)

#show heading.where(level: 1): it => block(
  above: 0em,
  below: 0em,
  inset: 1.1pt,
  fill: luma(240),
  stroke: 0.3pt + luma(180),
  radius: 1.2pt,
)[*#it.body*]

#show heading.where(level: 2): it => block(
  above: 0em,
  below: 0em,
)[#text(weight: "bold", it.body)]

#let h1(t) = [#heading(level: 1)[#t]]
#let h2(t) = [#heading(level: 2)[#t]]
#let sec(s) = [#text(weight: "bold", [s.#s])]
#let law(x) = [#text(weight: "bold", x)]
#let k(x) = [#text(style: "italic", x)]

#align(center)[
  #text(size: 10pt, weight: "bold", [COMP7901 Cheatsheet (HK IP + Privacy)])
]

#text(size: 5.4pt)[
  #columns(3, gutter: 4pt)[
    #set par(justify: true, leading: 0.88em, spacing: 0em)
    #outline(title: [目录 TOC], depth: 2)
  ]
]
#h2([关键词 Index])
- CO: s.22/23/28A/29/31/35A/39A/41A/65/107/118; PDPO: DPP1/3/4/6, s.20/26/35C/E/J/K/L, s.64, s.66; PO: s.9A/9B/9C/9D, s.57, s.73, s.75, s.91; tests: Moorhouse, Actavis 3Q, substantial part, novelty

#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([1. Copyright Ordinance (Cap.528) - Core])
    #h2([A. 受保护客体 + 门槛])
    - 版权只存在于法定作品类别（含 computer program / compilation）。
    - 文学/戏剧/音乐作品需 fixed（s.4(2)）。
    - 原创性（originality）看作者智力创作，不要求新颖性（不同于 patent）。
    - 算法本身通常不受 copyright 保护；表达（source/object code）受保护。

    #h2([B. 作者与所有权 (Authorship & Ownership)])
    - 作者：创作作品之人（s.11(1)）。
    - joint authorship：贡献不可分离时共同作者（s.12）。
    - computer-generated work：作者=作出必要安排的人（s.11(3), s.198(1)）。
    - 一般规则：作者为 first owner（s.13）。
    - employee work：雇佣期间作品通常归雇主（s.14(1)）。
    - commissioned work：看合同；无明文时委托方常有合理使用许可（s.15 思路）。

    #h2([C. 保护期 (Duration)])
    - 一般：作者终身 + 50 年（s.17(2)）。
    - 合著：以最后去世作者计算（s.17(7)）。
    - computer-generated：完成后 50 年（s.17(6)）。

    #h2([D. Restricted Acts（高频背诵）])
    - law([s.23]) Copying（含电子储存、瞬时复制）。
    - law([s.24]) Issue copies to the public（首次投入流通）。
    - law([s.25]) Rental to the public（需商业/经济利益）。
    - law([s.27]) Performance/playing/showing in public。
    - law([s.28A]) Communication to the public（broadcast/cable/making available）。
    - law([s.29]) Making adaptation；s.29(2) 对改编本行为亦侵原作。
    - 未经许可进行或授权他人进行 restricted act 即侵权（s.22(2)）。

    #h2([E. Substantial Part + Causation])
    - 实质部分看 qualitative, not quantitative。
    - 因果：相似性 + 接触机会（access）可推断 copying。
    - 抗辩“独立创作”要有可信解释（development records/version history）。

    #h1([2. Copyright Infringement Structure])
    #h2([A. Primary vs Secondary])
    - primary infringement：直接实施 restricted acts。
    - secondary infringement：商业处理侵权复制品（dealing/import/possess/sell）。
    - secondary 常需 knowledge（actual 或 constructive）。

    #h2([B. 授权侵权 (Authorisation)])
    - 关键词：sanction/approve/countenance。
    - law([Moorhouse test])：有控制手段 + 知道/有理由怀疑 + 未采取合理措施 -> 可推定授权。
    - 单纯提供中性工具不必然授权；看控制程度与防侵权措施。

    #h2([C. Infringing Copy 判断])
    - s.35(2)：本地制作若构成侵权 -> infringing copy。
    - s.35(3)：若该复制品“假设在香港制作会侵权”亦可算 infringing（hypothetical manufacture test）。
    - s.35A：境外合法制作 computer program 平行进口一般不构成侵权。

    #h2([D. Civil + Criminal])
    - Civil（s.107）：injunction / damages / account of profits / delivery up。
    - Criminal（尤其 s.118, s.120）：在 business/trade 过程大量制作、销售、分发、传播更易触发。

    #h2([E. Fair Dealing & Exceptions（常考）])
    - 研究/私人学习（s.38）。
    - 批评评论、报道时事（s.39）+ sufficient acknowledgement。
    - parody/satire/caricature/pastiche（s.39A）。
    - 教学用途（s.41A）可用但条件严格（范围、访问限制、时长等）。
    - 浏览技术所需瞬时复制（s.65）；ISP 临时复制（s.65A）。

    #h2([F. Fairness 四因素（答题模板）])
    - dealing purpose & nature。
    - work nature。
    - amount & substantiality。
    - market effect / prejudice to owner。
    - 结论句：是否与 normal exploitation 冲突、是否不合理损害权利人利益。
  ],
  [
    #h1([3. Copyright + Internet 高频结论句])
    - 上传/直播/平台提供可观看：通常触发 s.23 + s.28A。
    - 下载：通常触发复制（s.23），刑责看是否商业化/分发规模。
    - hyperlink：通常不等于直接复制；但若明知侵权并积极引流/控制，可能 authorisation。
    - “仅供个人非商业使用”条款：超出许可范围即侵权 + 可能违约。

    #h2([Exam Phrase Bank (English) - Copyright])
    - "X has carried out restricted acts without licence, in particular copying and making available to the public."
    - "A substantial part was taken in a qualitative sense."
    - "On these facts, fair dealing is unlikely because the use is commercially substitutive."
    - "Criminal exposure depends on business dealing and prejudice to the copyright owner."

    #h1([4. Personal Data (Privacy) Ordinance (Cap.486)])
    #h2([A. 基本概念])
    - personal data：可识别在世个人 + 与其有关 + 可实际查阅处理。
    - data user：控制收集/持有/处理/使用目的与方式者。
    - data processor：纯代处理且非自身目的（s.2(12) 逻辑）。
    - prescribed consent：自愿 + 明确 + 已获充分告知（可书面/口头，视条文）。

    #h2([B. DPP1-3（最常考）])
    - law([DPP1 Collection])：目的合法、与职能相关、必要不过度、方式公平合法、适当告知。
    - law([DPP2 Accuracy/Retention])：资料须准确、不过期；不再需要则删除（s.26）。
    - law([DPP3 Use Limitation])：只可用于原目的或直接相关目的；新目的需 prescribed consent。

    #h2([C. Direct Marketing Part 6A（超高频）])
    - s.35C：使用前须告知拟用资料种类、marketing subjects、并提供免费同意渠道。
    - s.35E：未获同意不得用；口头同意须 14 天内书面确认。
    - s.35F/s.35G：首次使用须告知可 opt-out；收到停止要求须停止。
    - s.35J/s.35K：向第三方提供作直销需书面告知 + 书面同意。
    - s.35L：可随时要求停止转移及通知受让人停止。
    - silent/no response != consent；“clear indication of no objection”才可。
    - 违反 35C/35E/35G/35J/35K/35L 可涉刑责（罚款+监禁）。

    #h2([D. DPP4-6 + Data Access/Correction])
    - law([DPP4 Security])：采取 all practicable steps 防未授权查阅/处理/删除/遗失。
    - law([DPP5 Openness])：公开私隐政策、资料种类、主要用途。
    - law([DPP6 Access/Correction])：查阅、更正、拒绝理由与申诉权。
    - 查阅请求（DAR）核心条文：s.18-21；更正请求：s.22-25。

    #h2([E. 拒绝 DAR（s.20）速记])
    - 必须拒绝（shall refuse）：
      1. 身份/关系资料不足（s.20(1)(a)）。
      2. 不可避免披露他人个人资料且未得同意（s.20(1)(b)）。
      3. 其他条例禁止（s.20(1)(c)）。
    - 可拒绝（may refuse）：非中英文、定位信息不足、重复骚扰式请求、受他方控制等（s.20(3)）。
    - 可删节就删节，不可整份一刀切拒绝（s.20(2)(b) 思路）。

    #h2([F. Doxxing 及域外])
    - 起底罪（s.64 系列）：未经同意披露个人资料并具指明意图或造成指明伤害。
    - 抗辩：依法/法院命令、合理相信已获同意、合法新闻活动等（视 s.64(4)）。
    - 域外 target disclosure：专员可发 cessation notice（s.66M 等），不遵从属罪。

    #h2([G. 豁免（Part VIII）])
    - 家居/家务用途（s.52）可豁免多数 DPP。
    - 就业规划、相关程序、推荐信、执法、健康、新闻、研究统计等条文各有范围限制。
    - 先问：条文是否真的覆盖该场景？是否仅豁免 DPP6 或亦豁免 DPP3？

    #h2([Exam Phrase Bank (English) - Privacy])
    - "The key issue is whether the use was for a new purpose under DPP3."
    - "Consent must be prescribed consent; silence is insufficient."
    - "The data user should comply by redacting third-party identifiers where practicable."
    - "There is potential criminal liability under Part 6A / section 64."

    #h1([5. Patent Ordinance (Cap.514) - Essentials])
    #h2([A. Patent vs Copyright])
    - patent 保护发明思想（invention）及其实践；copyright 保护表达。
    - patent 可阻止独立发明人实施同一发明（强于 copyright）。
    - patent 需申请、公开、审查；具地域性。

    #h2([B. 可专利性门槛])
    - patentable invention 需：novelty（s.9B）、inventive step（s.9C）、industrial application（s.9D）。
    - excluded subject matter（s.9A(2)）：discoveries/scientific theories/mathematical methods、aesthetic creations、rules/methods for mental acts or business、computer program as such、presentation of information 等。
    - 关键短语："as such"。若有技术贡献/进一步技术效果（technical contribution / further technical effect），较可能不被排除。

    #h2([C. Software Patent 审题口诀])
    - 问题导向：贡献点在“业务/内容逻辑”还是“技术实现改进”？
    - 若仅是生成诗词/商业规则自动化，易被排除。
    - 若改进计算机运行（速度、能耗、硬件控制、可靠性），较可能可专利。
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([6. Patent Application + Ownership])
    #h2([A. Claim Drafting Basics])
    - claim 决定保护范围（scope of monopoly）。
    - 产品权利要求（product claim）与方法权利要求（process claim）要分清。
    - independent claim 先立核心要件；dependent claim 提供 fallback positions。

    #h2([B. HK 标准专利制度])
    - 标准专利 20 年；短期专利 8 年（本课重点标准专利）。
    - 标准专利 (O): original grant in HK。
    - 标准专利 (R): 先在 designated patent office (CNIPA/UKIPO/EPO-UK) 后在 HK 完成两阶段登记。
    - (R) 关键时限：公布后 6 个月内第一阶段；DPO 授权后 6 个月内第二阶段（见 s.15, s.23）。

    #h2([C. Priority + Disclosure])
    - first-to-file：先申请优先（s.9E(3)）。
    - 巴黎公约 priority：首次申请后 12 个月内他国申请可主张优先权（s.37C 体系）。
    - 申请前公开演示/销售可能破坏 novelty（除非落入 non-prejudicial disclosure 例外）。
    - 一旦申请已公布，通常进入 prior art，即使其后撤回亦可能影响新颖性评估。

    #h2([D. Entitlement / Employee Inventions])
    - 起点：专利归发明人。
    - 若属 employee invention（s.57）：在正常或特别指派职责中作出，且合理预期会产生发明，通常归雇主。
    - 判断看“实际职责内容”而非仅岗位名称；课程案例常要求 minimal assumptions。

    #h1([7. Patent Infringement + Defences])
    #h2([A. Infringement (s.73)])
    - 产品发明：制造、处置、要约处置、使用、进口、为处置或其他目的而保存。
    - 方法发明：使用该方法；使用/处置由该方法直接获得的产品。
    - 可就公布后至授权前期间主张某些追溯救济，但诉权通常在授权后完整发生（s.88 逻辑）。

    #h2([B. Claim Construction & Variants])
    - 先识别 essential integers/features（必要技术特征）。
    - literal infringement：被控方案覆盖全部必要特征。
    - 变体（variant）也可能因等同而侵权。

    #h2([C. Actavis 3 Questions（必背）])
    1. 变体虽不落入字面，是否以基本相同方式实现基本相同结果？
    2. 对 skilled person 而言，这点在优先权日是否显而易见？
    3. skilled person 是否会认为专利人仍坚持严格字面含义为必要要求？
    - 常见结论：Q1/Q2 = Yes 且 Q3 = No -> 更可能构成 equivalence infringement。

    #h2([D. Exceptions (s.75)])
    - 私人且非商业使用。
    - 实验用途（experimental use）。
    - 其他法定例外按题目事实精确套入。

    #h2([E. Remedies + Invalidity])
    - 民事救济：injunction, damages, account of profits, delivery up。
    - 被告常见策略：non-infringement + counterclaim revocation（novelty/inventive step/subject-matter exclusion）。

    #h2([Exam Phrase Bank (English) - Patent])
    - "The contribution appears to lie in a computer program as such, so exclusion is likely."
    - "The court will construe the claims purposively and identify essential integers."
    - "Even absent literal infringement, equivalence may be established under Actavis."
    - "DreamToys should plead non-infringement and counterclaim revocation."
  ],
  [
    #h1([8. 通用答题框架（直接套）])
    #h2([A. 问题分解 IRAC+Statute])
    1. 定位法域：Copyright / PDPO / Patent（可并行）。
    2. 点名法条：先写 section no.，再写 legal test。
    3. 套事实：逐要件，少假设（minimal assumptions）。
    4. 抗辩/例外：fair dealing / consent / exemption / experimental use。
    5. 责任与救济：civil + criminal 分开写。

    #h2([B. 高频句型（中英混写）])
    - 结论先行："On balance, X is likely liable for ..."。
    - 不确定时："This turns on whether ...; on the given facts, the better view is ..."。
    - 对比论证："Even if ... , X may still ... because ..."。
    - 刑责保守句："Criminal liability is possible if the prosecution proves commercial dealing / requisite knowledge."。

    #h2([C. Exam 高频坑位清单])
    - 把“作者”与“所有权人”混为一谈（尤其 employee works）。
    - 忘记先判断“是否实质部分”，直接谈 fair dealing。
    - privacy 题把 DPP1/2/3 混写，不区分 collection / retention / new purpose。
    - 把 silence 当 consent（Part 6A 明确不行）。
    - DAR 题忽略“删节后可披露”的义务。
    - patent 题只谈 literal infringement，不谈 Actavis equivalence。
    - patentability 题漏写 prior disclosure 对 novelty 的致命影响。

    #h2([D. 三大模块速判流程])
    #text(weight: "bold", [Copyright])：
    - 有无 protected work -> 谁拥权 -> 哪个 restricted act -> substantial part/causation -> defence -> civil/criminal。

    #text(weight: "bold", [Privacy])：
    - data user? personal data? -> DPP1/2/3 或 Part 6A -> consent 要件 -> exemptions -> enforcement/criminal。

    #text(weight: "bold", [Patent])：
    - patentable subject matter? -> novelty/inventive step/industrial application -> entitlement -> claim scope -> infringement/invalidity。

    #h2([E. 常用法条速索引])
    - CO: s.22, 23, 24, 25, 27, 28A, 29, 31, 35, 35A, 38, 39, 39A, 41A, 65, 107, 118, 120。
    - PDPO: DPP1-6, s.18-25, s.26, Part 6A (35A-35M), s.50, s.64, s.66, Part VIII。
    - PO: s.9A-9E, s.15, s.23, s.37C, s.39, s.54, s.57, s.73, s.75, s.88, s.91。

    #h2([F. 1分钟检查清单（交卷前）])
    - 每小问至少点到 2-4 个 section numbers。
    - 每小问至少有 1 个反方/抗辩分析。
    - 结论语气用 "likely / unlikely / arguable"，避免绝对化。
    - 若题目给少量事实，明确写 "on minimal assumptions"。
    - 若涉平台/网络，记得区分 civil 与 criminal threshold。

    #h1([9. Case/Authority Snapshots])
    - #k([Moorhouse]): authorisation 的控制+知情+未限用标准。
    - #k([Actavis UK v Eli Lilly]): patent equivalence 三问法。
    - #k([Improver]): 旧式变体分析，现多由 Actavis 主导。
    - #k([Francis Day & Hunter v Bron]): copying 因果推定。
    - #k([Wu Kit Ping v AAB]): DAR 中删节后仍应尽量披露。

    #h2([G. 最短结论模板])
    - Copyright："X likely infringed by copying/communication; fair dealing unlikely; civil remedies available and criminal risk arguable on commercial facts."
    - Privacy："Use/disclosure appears a new purpose without prescribed consent, breaching DPP3; Part 6A / doxxing offences may also arise."
    - Patent："Liability depends on claim construction; literal infringement is arguable, and Actavis equivalence strengthens claimant’s case unless strict compliance was intended."

    #align(center)[#text(size: 7pt, [End of cheatsheet - keep updating with your own lecturer emphasis before exam.])]
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([10. Copyright Deep Dive - Section-by-Section])
    #h2([A. Primary Infringement 要件拆解])
    - law([s.23 Copying])：任何 material form 的再现；电子储存、服务器缓存、临时复制都可能计入。
    - law([s.24 Issue copies])：强调“首次投入流通”；后续二手转售通常不算。
    - law([s.25 Rental])：须有 direct/indirect commercial advantage。
    - law([s.27 Public performance/showing])：关键是 public 场景，家庭/准家庭例外。
    - law([s.28A Communication])：upload/stream/可按需访问（on-demand）为核心。
    - law([s.29 Adaptation])：程序改写、语言转换、decompile/assemble 等常触及。

    #h2([B. 程序作品的“改编”与“复制”并行])
    - 实务上常同时主张 copying + adaptation，避免单一路径失败。
    - 若代码“改变量大”，先找未改的核心段落做 copying。
    - 若仅功能相似、表达差异大，考虑结构/流程是否复制实质部分。

    #h2([C. Substantial Part 细化判断])
    - 数量少不等于非实质：关键算法、架构、关键流程即可能“实质”。
    - 注释、变量名更换通常不足以消除实质相似。
    - 证据优先级：版本记录 > 时间线 > 接触机会 > 专家比对。

    #h2([D. Causation / Access 作答模板])
    - Step 1：先列 objective similarities。
    - Step 2：写 access 事实（前员工、共享仓库、文档接触、公开下载）。
    - Step 3：被告解释是否可信（独立开发证据是否完整）。
    - Step 4：下结论（likely copied / insufficient proof）。

    #h2([E. Authorisation（s.22(2), s.22(2A)）])
    - 控制能力（control）越强，越容易被认定授权。
    - 对侵权风险的知悉（knowledge/suspicion）是重点。
    - 是否采取合理措施（warning/notice/filter/takedown）是关键。
    - 平台/学校/公司题：通常以 Moorhouse 测试作为主轴。

    #h2([F. Secondary Infringement 高频行为])
    - import/export infringing copies（s.30）。
    - possession, sale, distribution in business（s.31）。
    - 提供专门用于侵权复制的装置（s.32）。
    - “不知道是侵权复制品”可作抗辩，但需事实支持其合理性。

    #h2([G. 平行进口 (Parallel Imports) 快速判断])
    - 先判断境外制作是否合法。
    - 再判断作品类型：computer program 在 s.35A 下有特别规则。
    - 再看是否存在香港排他性许可与其他限制条文。

    #h2([H. Civil Remedies 写法模板])
    - 禁令：停止复制、下架链接、停止传播。
    - 金钱：damages 或 account of profits 二选一逻辑。
    - 交付/销毁：delivery up / disposal。
    - 证据保全与披露命令（按事实可提）。

    #h2([I. Criminal Threshold 写法模板])
    - 先写“商业过程/业务场景”要件。
    - 再写“规模与不利影响”要件。
    - 最后写主观状态：knew or had reason to believe。

    #h2([J. Internet 特别场景速判])
    - 直播体育赛事：s.28A communication 为主。
    - 用户上传平台：平台是否 authorise 取决于控制与应对机制。
    - CDN/cache：可援引 s.65/s.65A 但仅限技术必要与中立。
  ],
  [
    #h1([11. Copyright Exam Scenarios - Ready-to-Use])
    #h2([A. 离职员工带走文档/代码])
    - 文本部分作者常是撰写者；图表可为团队作者。
    - 所有权通常归雇主（employee works）。
    - 新公司沿用“重要段落/图表” -> copying + issuing copies。
    - 若指示团队继续用，可能 authorisation liability。

    #h2([B. 订阅服务条款“个人非商业用途”])
    - 超出许可条件（download/burn/sell）即无授权。
    - 行为链：download = copying；制作多张光盘 = repeated copying。
    - 跨境寄送销售：可能触发 import/export 相关条文与刑责。

    #h2([C. 自制字幕/翻译])
    - 字幕文本可有独立版权（译者作品）。
    - 但使用底层影片仍需原影片权利人许可。
    - “文化传播目的”非当然法定抗辩。

    #h2([D. Hyperlink 案型])
    - 单纯链接通常不是直接复制。
    - 若“明显侵权 + 主动组织 + 商业引流 + 可控制”，授权侵权风险上升。

    #h2([E. Fair Dealing 应试四段式])
    1. 指定法定目的（研究/评论/新闻/戏仿/教学）。
    2. 逐项过四因素（性质、作品、数量、市场影响）。
    3. 评估是否超出必要程度。
    4. 给出“likely fair / unlikely fair + short reason”。

    #h2([F. 常用英文句块])
    - "The defendant exceeded the scope of licence and therefore cannot rely on consent."
    - "The dealing was not transformative enough and displaced the normal market."
    - "Given the commercial scale, criminal exposure is not merely theoretical."
    - "The platform’s liability turns on control, knowledge, and reasonable preventive steps."

    #h2([G. 2024-25 Q2 风格模板（文档+图表）])
    - 先拆作品：document text / diagrams / software code。
    - 再拆作者：文字作者、图表作者、可能 joint authorship。
    - 再拆所有权：employee rule + contract clauses。
    - 再拆责任：Jacky 自身 + 新雇主 + 团队成员可能责任。

    #h2([H. 2023-24 Q3 风格模板（流媒体）])
    - 影片上传播放：复制 + 传播给公众。
    - 字幕不当然免责：底层 film rights 独立存在。
    - 用户下载刻盘寄售：复制 + 商业分发链条完整。

    #h2([I. 2022-23 Q2 风格模板（程序外流）])
    - 关注是否 substantial part（qualitative）。
    - 关注 access（借用、同事关系、newsgroup 发布）。
    - 关注第三人扩散行为（下载刻录再分发）。

    #h2([J. 结论句压缩版])
    - "On these facts, X is likely liable for primary infringement, with potential secondary/criminal liability depending on commercial dealing and knowledge."
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([12. PDPO Deep Dive - DPP & Access Regime])
    #h2([A. DPP1 Collection 三问])
    - 目的是否合法且与功能直接相关？
    - 资料是否必要而不过度（not excessive）？
    - 收集方式是否公平合法（lawful & fair）？
    - 是否履行通知义务（用途、承让人类别、可否拒供、后果）？

    #h2([B. DPP2 Accuracy/Retention])
    - 数据用户应确保准确、更新与保存期限合理。
    - 达成原目的后应删除（s.26），除非有法定保留需要。
    - 答题可写：未删除旧数据导致误用/泄漏即 DPP2 + DPP4 叠加风险。

    #h2([C. DPP3 Use Limitation 核心])
    - 先识别 original purpose。
    - 再判断新用途是否“directly related”。
    - 若非直接相关 -> 需 prescribed consent。
    - 向第三方出售/共享通常更易被认定 new purpose。

    #h2([D. DPP4 Security 技术-管理双维])
    - 技术措施：access control, encryption, logging, segmentation。
    - 管理措施：least privilege, policy, training, vendor management。
    - data processor 外包时需合同约束（含境外处理）。

    #h2([E. DPP5 Openness])
    - 私隐政策可被公众理解。
    - 说明持有何种数据、主要用途、行使权利方式。

    #h2([F. DPP6 Access/Correction])
    - 查阅资料请求（DAR）与改正请求需区分。
    - 可收取非过高费用；需在合理时间内处理。
    - 拒绝需给理由及反对渠道。

    #h2([G. DAR 拒绝规则精细化])
    - s.20(1) mandatory refusal：身份关系不足、第三者资料不可分、他法禁止。
    - s.20(3) discretionary refusal：语言、定位资料不足、重复不合理等。
    - 核心：能删节就删节，尽量部分披露。

    #h2([H. Correction Request 关键点])
    - 若拒绝更正，须说明理由。
    - 可附加“更正请求说明”以保留争议立场。
    - 对来自其他数据用户的资料，有时要通知来源方。

    #h2([I. 专员权力与程序])
    - 投诉 -> 初步评估 -> 调查 -> 执行通知（enforcement notice）。
    - 不遵从执行通知可构成罪行。
    - 可协助受屈人士寻求补偿（s.66A/66B 相关）。

    #h2([J. 补偿 (s.66)])
    - 可赔偿财务损失与精神损害（emotional distress）。
    - 雇主对雇员行为可负 vicarious liability，除非已尽 all practicable steps。
  ],
  [
    #h1([13. PDPO Deep Dive - Direct Marketing & Doxxing])
    #h2([A. Part 6A 流程图（作答顺序）])
    1. 是否 direct marketing means（按名指向个人的讯息/电话）？
    2. 是否已作 s.35C 告知（种类 + subjects + 免费渠道）？
    3. 是否取得有效 consent（沉默不算）？
    4. 若口头 consent，14 日书面确认是否完成（s.35E）？
    5. 首次使用是否告知可随时停用（s.35F）？
    6. 收到 opt-out 是否立即停用（s.35G）？

    #h2([B. 向第三方提供名单])
    - s.35J：提供前书面告知（是否牟利、资料种类、接收者类别、marketing subjects）。
    - s.35K：未得书面同意不得提供。
    - s.35L：被要求停止时须停供并通知受让方停用。

    #h2([C. 罪责层级记忆法])
    - “使用直销”违规：通常 HKD 500k + 3 years 量级。
    - “出售/转移供直销（尤其 for gain）”违规：可至 HKD 1M + 5 years。
    - 写作时用“may constitute offence punishable by ...”更稳妥。

    #h2([D. Consent 常见错误])
    - 未回覆/未勾拒绝框 != 同意。
    - “我再考虑”通常不构成明确 no objection。
    - 同意范围受“资料种类 + marketing subjects 类别”限制。

    #h2([E. Doxxing (s.64 系列) 答题框架])
    - 行为：披露 personal data。
    - 同意：是否取得相关同意。
    - 主观/结果：是否有指明意图或造成指明伤害。
    - 抗辩：依法披露、合理相信同意、合法新闻活动。

    #h2([F. 域外执行])
    - 面向香港人士的 target disclosure 可触发域外机制。
    - 专员可发 cessation notice 要求移除/限制存取。
    - 不遵从通知可构成独立罪行。

    #h2([G. Part VIII 豁免使用方法])
    - 先锁定条文对象（例如执法、健康、新闻、研究统计）。
    - 再确认豁免的是哪个 DPP（常见 DPP3 或 DPP6）。
    - 最后确认时间条件（如新闻发布前/相关程序完成前）。

    #h2([H. 数据泄露题固定写法])
    - 对买方（SWB 类型）：DPP3 新目的 + 直销同意不足 + 可能 Part 6A。
    - 对卖方/数据中心（MDC 类型）：DPP4 安全失当 + DPP1 不公平收集 + DPP3 非法披露。

    #h2([I. DAR 题固定写法])
    - 可披露：本人资料、可删节后提供部分。
    - 不可披露：第三方身份、受法定保密限制内容。
    - 非个人资料（policy/manual 纯制度文件）通常不属 DAR 强制范围。

    #h2([J. 常用英文句块])
    - "The proposed marketing use goes beyond the original purpose and requires prescribed consent."
    - "The data user should provide partial access by redacting third-party identifiers."
    - "Selling customer data for gain creates heightened criminal exposure under Part 6A."
    - "The doxxing provisions may apply where disclosure causes specified harm."
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([14. Patent Deep Dive - Patentability])
    #h2([A. 可专利性总流程])
    1. 是否属于“发明”且不落入 s.9A(2) 排除？
    2. 是否具 novelty（s.9B）？
    3. 是否具 inventive step（s.9C）？
    4. 是否 capable of industrial application（s.9D）？
    5. 是否有 disclosure bars/priority 问题？

    #h2([B. s.9A(2) 排除常见题])
    - math method / business method / mental act rules。
    - computer program as such。
    - presentation of information。
    - 口诀：仅抽象规则 -> 易排除；落地技术方案 -> 可争不排除。

    #h2([C. Technical Contribution 判别])
    - 改善计算机本身运行（速度、资源、可靠性） -> 倾向技术性。
    - 控制外部技术过程（设备、工业流程） -> 倾向技术性。
    - 仅改进内容生成质量/商业逻辑 -> 倾向非技术性。

    #h2([D. Novelty 审查要点])
    - prior art 范围非常广（书面/口头/使用/任何公开方式）。
    - 关键日期：提交日或优先权日。
    - 申请前 demo、销售、论文、公开视频都可能破坏新颖性。

    #h2([E. Inventive Step 写法])
    - 指出 closest prior art。
    - 写出区别特征（distinguishing features）。
    - 说明该区别对 skilled person 是否 obvious。
    - 给出“not obvious / obvious”结论并解释技术效果。

    #h2([F. Industrial Application])
    - 可制造或在产业中利用通常满足。
    - 人体/动物治疗方法有特殊排除脉络，需分开讨论。

    #h2([G. 申请与公开策略])
    - 先申请再公开（first-to-file 时代核心纪律）。
    - 若需展示，先评估 non-prejudicial disclosure 能否适用。
    - 国际布局关注 12 个月 priority 窗口。

    #h2([H. 标准专利 O/R 对比速记])
    - O：香港本地原授路径。
    - R：依附指定局后再在港登记授权。
    - 两者都需注意续期费与撤销风险。

    #h2([I. 所有权与雇员发明])
    - 关键不是头衔，而是 duties 的实质内容。
    - “被合理预期会产生发明”是雇主归属判断核心。
    - 研究型岗位更易落入雇主归属，教学型需细分事实。

    #h2([J. 2024-25 算法生成诗词题模板])
    - 先写可能是 program/method as such。
    - 再写是否有技术贡献（通常弱）。
    - 再写 demo 公开对 novelty 的威胁。
    - 最后写 entitlement（教授与大学合同职责）。
  ],
  [
    #h1([15. Patent Deep Dive - Infringement/Invalidity])
    #h2([A. Claim Construction 先于比较])
    - 先定 claim language 的 purposive meaning。
    - 再抽取 essential features / integers。
    - 再比对被控产品/方法是否覆盖全部要件。

    #h2([B. Literal vs Equivalents])
    - 全覆盖 -> literal infringement。
    - 非全覆盖但功能方式结果近似 -> 进入 Actavis 等同分析。

    #h2([C. Actavis 三问写作模板])
    - Q1 基本同结果同方式？
    - Q2 对 skilled person 显而易见？
    - Q3 专利人是否意图严格限于字面？
    - 收束：若 Q1/Q2 yes 且 Q3 no，倾向侵权。

    #h2([D. Improver 与 Actavis 关系])
    - Improver 为历史框架，Actavis 现更主导。
    - 答题可写："older Improver approach, now refined by Actavis"。

    #h2([E. 常见不侵权抗辩])
    - 缺少必要要件（missing integer）。
    - 被控方案技术路线不同，非同方式实现。
    - 专利权利要求应被狭义解释（基于说明书/审查历史）。

    #h2([F. 有效性反击（Counterclaim Revocation）])
    - 非发明/排除客体（s.9A）。
    - 缺乏新颖性（s.9B）。
    - 缺乏创造性（s.9C）。
    - 说明书公开不足、权利要求不清楚（按具体法条脉络写）。

    #h2([G. 侵权例外（s.75）])
    - 私人非商业。
    - 实验用途。
    - 仅在例外边界内免责，超范围仍可能侵权。

    #h2([H. 救济与诉讼策略])
    - 原告：禁令优先 + 损害赔偿/利润返还。
    - 被告：先打无效可显著改变谈判筹码。
    - 双方常同步进行 technical expert evidence。

    #h2([I. 2023-24 机器狗题模板])
    - method claim：英语版实现若核心方法相同，侵权风险高。
    - chip claim：2/3 要件 + 1替代要件，先争 no literal，再测 Actavis。
    - 另行检索 prior art（日本先用）支持 revocation。

    #h2([J. 常用英文句块])
    - "Infringement analysis must begin with purposive claim construction."
    - "DreamY omits one essential integer, so literal infringement is contested."
    - "Nevertheless, equivalence remains arguable under Actavis."
    - "The defendant should counterclaim revocation based on novelty/inventive-step attacks."
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([16. Past Papers Mapping (22-23 / 23-24 / 24-25)])
    #h2([A. 22-23 Q1 Patent（医疗方法+装置）])
    - 医疗方法通常触及可专利性排除脉络（method of treatment）。
    - 设备 claim 可与方法 claim 分开评估。
    - 所有权问：employee invention 以 duties 事实为核心。

    #h2([B. 22-23 Q2 Copyright（程序传播链）])
    - 借用软件 -> 上传群组 -> 第三人下载刻录分发。
    - 答题要同时抓 primary + secondary + authorisation。
    - 刑责看商业规模与不利影响。

    #h2([C. 22-23 Q3 Privacy（起底/家事公开）])
    - 先识别是否 personal data disclosure。
    - 再看同意、意图、造成伤害。
    - 再检索新闻/法律授权等抗辩。

    #h2([D. 23-24 Q1 Patent（语音识别方法+芯片）])
    - process claim 与 product claim 双轨侵权分析。
    - 缺要件先抗 literal；再谈等同。
    - prior use/public sales 可用于 invalidity 反击。

    #h2([E. 23-24 Q2 Privacy（起底 + DAR）])
    - (a) 起底：s.64 系列 + 指明伤害。
    - (b) DAR：只给 personal data，不必交整套内部规则文件。
    - 涉第三者数据要删节或拒绝并说明。

    #h2([F. 23-24 Q3 Copyright（串流+字幕+下载）])
    - 平台端：传播给公众 + 必要复制。
    - 用户端：下载刻盘分发，侵权链条完整。
    - “介绍文化”抗辩一般不够。

    #h2([G. 24-25 Q1 Patent（生成式AI算法）])
    - program as such 排除是主轴。
    - 如仅内容生成效果，技术贡献较弱。
    - 展示演示先于申请 -> novelty 风险。

    #h2([H. 24-25 Q2 Copyright（公司文档被带走）])
    - 先分解作品类别：文字、图表、软件规格。
    - 雇员创作所有权通常归雇主。
    - 拷贝并交新团队：复制 + 授权风险。

    #h2([I. 24-25 Q3 Privacy（黑客后交易数据）])
    - 买方银行：DPP3 + Part6A 潜在违规。
    - 数据中心：DPP4 安全失败 + DPP1/3 违规。
    - 可补写专员执法与赔偿路线。

    #h2([J. 近三年命题规律])
    - 每年三法域基本都出现。
    - 题目偏好“多主体链条责任”而非单点判断。
    - 高分答案特征：法条号 + 要件分解 + 反方分析 + 结论克制。
  ],
  [
    #h1([17. 30-Second Answer Skeletons])
    #h2([A. Copyright Liability Skeleton])
    1. Identify protected work + owner。
    2. Identify restricted act(s) by each defendant。
    3. Substantial part + causation。
    4. Defences/exceptions。
    5. Civil remedies + criminal possibility。

    #h2([B. Copyright Ownership Skeleton])
    - Author（s.11）-> First owner（s.13）-> Employee exception（s.14）-> Commissioned contract（s.15）。

    #h2([C. Privacy Contravention Skeleton])
    1. Is there personal data + data user status?
    2. Which DPP(s) engaged?
    3. Is there new purpose? (DPP3)
    4. Is prescribed consent obtained?
    5. Any Part VIII exemption?
    6. Enforcement/criminal exposure.

    #h2([D. Direct Marketing Skeleton])
    - s.35C notice -> consent -> s.35E condition -> s.35F first-use notice -> s.35G cease-on-request。
    - For transfer: s.35J/K/L chain。

    #h2([E. DAR Skeleton])
    - What is requested actually personal data?
    - mandatory refusal grounds?
    - discretionary refusal grounds?
    - redact and provide partial access where possible。

    #h2([F. Patentability Skeleton])
    1. Excluded subject matter?
    2. novelty?
    3. inventive step?
    4. industrial application?
    5. disclosure/priority hazards?

    #h2([G. Patent Infringement Skeleton])
    - construe claim -> identify essential integers -> compare facts -> Actavis -> exceptions -> remedies/counterclaim。

    #h2([H. Entitlement Skeleton])
    - inventor presumption -> employee invention test -> contractual allocation -> conclusion with minimal assumptions。

    #h2([I. Minimal Assumptions Writing])
    - "Assuming X is an employee and the work was created in the course of employment..."
    - "Assuming no licence was granted beyond personal use..."
    - "Assuming the disclosed method was accessible to the public before the priority date..."

    #h2([J. Examiner-friendly Ending])
    - "Accordingly, X is likely liable in civil law; criminal liability is arguable subject to proof of commercial dealing and knowledge."
    - "Accordingly, the patent is vulnerable to revocation and infringement should be denied in the alternative."

    #h1([18. Final Ultra-Short Checklist])
    - 每小问写 section no.。
    - 每小问写至少一个反方点。
    - 结论用 likely/unlikely/arguable。
    - 法条与事实一一对应。
    - 不写绝对句，不跳步骤。

    #align(center)[#text(size: 7pt, [Long Version End. If still under page limit, enlarge line spacing or add your own case notes.])]
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([19. Statute Quick Table - Copyright (Cap.528)])
    #h2([A. Core Rights & Liability])
    - s.22：restricted acts + authorisation 总入口。
    - s.23：copying。
    - s.24：issue copies to the public。
    - s.25：rental right。
    - s.27：public performance/playing/showing。
    - s.28A：communication to the public。
    - s.29：adaptation + adaptation-related acts。

    #h2([B. Secondary Infringement Cluster])
    - s.30：import/export infringing copies。
    - s.31：possess/sell/distribute infringing copies in business。
    - s.32：articles for making infringing copies。
    - s.35：infringing copy definition。
    - s.35A：parallel import carve-out for computer programs。

    #h2([C. Exceptions / Permitted Acts])
    - s.38：research/private study fair dealing。
    - s.39：criticism/review/current events。
    - s.39A：parody/satire/caricature/pastiche。
    - s.41A：education-related fair dealing。
    - s.65：transient/incidental copies for browsing。
    - s.65A：temporary copies by service providers。

    #h2([D. Remedies & Criminal])
    - s.107：civil remedies。
    - s.108+：additional civil framework（按课程覆盖范围点到）。
    - s.118：criminal offences（business/commercial handling）。
    - s.120：extra-territorial copyright crimes。

    #h2([E. Ownership & Duration])
    - s.11：author。
    - s.12：joint authorship。
    - s.13：first owner。
    - s.14：employee works。
    - s.15：commissioned works。
    - s.17：duration。

    #h2([F. Procedure & Proof Tips])
    - 先权利归属，后侵权行为。
    - 先 primary，后 secondary，再 criminal。
    - 每行为对应具体 section，不要抽象叙述。

    #h1([20. Statute Quick Table - PDPO (Cap.486)])
    #h2([A. Definitions & Scope])
    - s.2：personal data, data user, relevant person, prescribed consent。
    - s.2(12) 逻辑：纯代处理者通常非 data user（限处理/持有/使用）。

    #h2([B. DPPs])
    - DPP1：collection purpose/necessity/fairness/notice。
    - DPP2：accuracy/retention。
    - DPP3：use limitation。
    - DPP4：security。
    - DPP5：openness。
    - DPP6：access/correction。

    #h2([C. Access/Correction Mechanics])
    - s.18-21：data access request。
    - s.22-25：data correction request。
    - s.20：refusal grounds（mandatory/discretionary）。
    - s.26：erasure when no longer needed。

    #h2([D. Direct Marketing Part 6A])
    - s.35A：direct marketing / no objection 定义。
    - s.35C：use-before-notice。
    - s.35E：use-after-consent。
    - s.35F/G：first-use notice & cease-on-request。
    - s.35J/K/L：provide-to-third-party regime。
    - s.35H/M：deemed prescribed consent（合规前提下）。

    #h2([E. Enforcement, Offence, Compensation])
    - s.50：enforcement notice。
    - s.50A/50B：不遵从/阻挠相关罪。
    - s.64 series：doxxing offences。
    - s.66：compensation（含精神损害）。
    - s.66M/66O：cessation notice & offence for non-compliance。

    #h2([F. Part VIII Exemptions])
    - s.52 家居家务。
    - s.53 员工规划。
    - s.55 相关程序。
    - s.56 推荐信。
    - s.57 国家安全/防务/国际关系。
    - s.58 执法。
    - s.59 健康。
    - s.61 新闻。
    - s.62 统计研究。
  ],
  [
    #h1([21. Statute Quick Table - Patents (Cap.514)])
    #h2([A. Patentability])
    - s.9A：what is an invention + excluded subject matter。
    - s.9B：novelty。
    - s.9C：inventive step。
    - s.9D：industrial application。
    - s.9E：right to patent / first-to-file context。

    #h2([B. Procedures & Priority])
    - s.15：R 路径第一阶段（record request）时限。
    - s.23：R 路径第二阶段（registration and grant）时限。
    - s.37C：priority framework。
    - s.39：term of standard patent。

    #h2([C. Ownership])
    - s.54：co-ownership rules。
    - s.57：employee inventions。

    #h2([D. Infringement & Defences])
    - s.73：infringement acts。
    - s.75：exceptions（private non-commercial / experiment）。
    - s.88：infringement after publication / before grant 的时间效果。

    #h2([E. Validity Challenge])
    - s.91：revocation grounds。

    #h2([F. Patent Litigation Checklist])
    - Claim construction first。
    - Infringement second。
    - Validity counterattack in parallel。
    - Remedies/undertakings last。

    #h1([22. Case Law Flashcards])
    #h2([A. Copyright])
    - #k([Ladbroke v William Hill])：substantial part = qualitative。
    - #k([MS Associates v Power])：实质部分判断。
    - #k([Francis Day & Hunter v Bron])：copying causation inference。
    - #k([CBS Songs v Amstrad])：facilitation != authorisation automatically。
    - #k([Moorhouse])：control + knowledge + no reasonable steps。

    #h2([B. Privacy])
    - #k([Wu Kit Ping v AAB])：可删节时应部分披露。
    - AAB 系列：非条例规定的保密义务不当然构成拒绝依据。

    #h2([C. Patent])
    - #k([Improver])：历史变体分析。
    - #k([Actavis UK v Eli Lilly])：equivalents 三问。
    - #k([IBM's Application])：技术效果路径。

    #h2([D. How to cite cases in exam])
    - 不必长引事实，写“principle + one-line application”即可。
    - 例如："Applying Moorhouse, X had control over the platform and failed to take reasonable preventive steps."。

    #h2([E. Cross-Topic Confusion Guard])
    - 保密义务 breach != 自动等于 copyright infringement。
    - 侵害私隐 != 自动等于 doxxing offence（需满足主观/结果要件）。
    - 专利无效风险高 != 自动不侵权（程序上仍分开分析）。

    #h2([F. Scoring Strategy in 15-mark subquestion])
    - 2 分：问题重述 + 条文定位。
    - 6 分：要件逐项套事实。
    - 3 分：反方/抗辩。
    - 2 分：救济或程序路线。
    - 2 分：克制结论（likely/arguable）。

    #h2([G. Time Management])
    - 30 分题建议 35-38 分钟。
    - 每 10 分钟至少写完一个清晰小结论段。
    - 卡壳时先列 section numbers 再填事实。

    #h2([H. 常见失分点复盘])
    - 结论太绝对、无条件语。
    - 只背概念，不写具体法条号。
    - 不区分 civil liability 与 criminal liability。
    - 忘记对每个主体分别分析。
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([23. English Sentence Bank - Copyright])
    #h2([A. Issue Framing])
    - "The primary issue is whether the defendant performed one or more restricted acts without licence."
    - "A secondary issue is whether the defendant authorised infringement by users."

    #h2([B. Ownership])
    - "Authorship and ownership must be distinguished."
    - "As the work was created in the course of employment, first ownership likely vests in the employer under s.14(1)."

    #h2([C. Infringement])
    - "Uploading the file constitutes copying and making the work available to the public."
    - "The copied portion is substantial in a qualitative sense."
    - "Renaming variables does not negate substantial similarity."

    #h2([D. Authorisation])
    - "Applying Moorhouse, liability turns on control, knowledge, and failure to take reasonable preventive steps."
    - "Mere facilitation is insufficient absent sanction, approval, or countenance."

    #h2([E. Defences])
    - "The fair dealing defence is unlikely because the use is commercially substitutive."
    - "The dealing exceeds what is reasonably necessary for criticism/review."

    #h2([F. Civil/Criminal])
    - "Civil remedies include injunction, damages, and account of profits."
    - "Criminal liability may arise if business dealing and knowledge are proved."

    #h2([G. Conclusion Variants])
    - "On balance, the claimant has a strong prima facie case."
    - "Liability is arguable but depends on proof of substantiality and access."

    #h1([24. English Sentence Bank - Privacy])
    #h2([A. Issue Framing])
    - "The key question is whether the impugned use falls within the original purpose or a directly related purpose."
    - "If not, prescribed consent is required under DPP3."

    #h2([B. DPP Violations])
    - "Obtaining customer data from a hacked source is likely unfair and unlawful collection under DPP1."
    - "Retaining data beyond necessity may contravene DPP2 and section 26."
    - "Selling customer lists to another bank is a new purpose without prescribed consent."

    #h2([C. Direct Marketing])
    - "Silence does not amount to consent in direct marketing."
    - "The data user must comply with sections 35C and 35E before first use."
    - "Oral consent must be confirmed in writing within 14 days."

    #h2([D. DAR / Correction])
    - "The data user should provide access by redacting third-party identifiers where practicable."
    - "Refusal must fall within section 20 and be accompanied by reasons."

    #h2([E. Doxxing])
    - "Potential liability under section 64 depends on consent, intent, and specified harm."
    - "A statutory defence may apply if disclosure is authorised by law or court order."

    #h2([F. Remedies])
    - "The data subject may claim compensation under section 66, including emotional distress."
  ],
  [
    #h1([25. English Sentence Bank - Patent])
    #h2([A. Patentability])
    - "The contribution appears to lie in a computer program as such, which is prima facie excluded."
    - "The claimant may argue technical contribution by showing an improvement in computer operation itself."
    - "Pre-filing disclosure may destroy novelty unless a statutory safe harbour applies."

    #h2([B. Entitlement])
    - "The starting point is that the patent belongs to the inventor."
    - "The employer may nevertheless be entitled under the employee-invention rule if the invention arose from assigned duties."

    #h2([C. Infringement])
    - "Infringement analysis starts with purposive claim construction."
    - "Literal infringement is disputed because one essential integer is absent."
    - "Even so, infringement by equivalence remains arguable under Actavis."

    #h2([D. Invalidity])
    - "The defendant should counterclaim revocation on novelty and inventive-step grounds."
    - "If prior art discloses all essential features, the claim is vulnerable to revocation."

    #h2([E. Remedies])
    - "If infringement is established, the court may grant injunction and monetary remedies."

    #h2([F. Conclusion Variants])
    - "On the present facts, infringement is arguable but validity is vulnerable."
    - "The stronger strategy is to plead non-infringement and invalidity in the alternative."

    #h1([26. Rapid-Write Templates (Fill-in Style)])
    #h2([A. 版权 6 句模板])
    - 1) "The work in issue is [...], owned by [...] under s.[...]."
    - 2) "X performed [...] (s.[...]) by [...]."
    - 3) "The part taken is substantial because [...]."
    - 4) "Any defence under s.[...] is weak/strong because [...]."
    - 5) "Civil remedies likely include [...]."
    - 6) "Criminal liability is (not) likely because [...]."

    #h2([B. 私隐 6 句模板])
    - 1) "The data concerned is personal data because [...]."
    - 2) "X is a data user in relation to this data because [...]."
    - 3) "The use/disclosure is a new purpose under DPP3 because [...]."
    - 4) "Prescribed consent was/was not obtained because [...]."
    - 5) "Part 6A / s.64 may apply because [...]."
    - 6) "Accordingly, X is likely liable, subject to [...] exemption."

    #h2([C. 专利 6 句模板])
    - 1) "The claimed subject matter is (not) excluded under s.9A because [...]."
    - 2) "Novelty is affected/not affected because [...]."
    - 3) "Inventive step is (not) satisfied because [...]."
    - 4) "On entitlement, patent belongs to [...] because [...]."
    - 5) "On infringement, claim construction suggests [...]."
    - 6) "Defendant should also challenge validity under s.[...]."

    #h2([D. 最后 5 分钟应急方案])
    - 每小问最少写：Issue + 2 法条 + 1 抗辩 + 1 结论。
    - 来不及时优先写“主体分开 + section numbers + likely conclusion”。

    #align(center)[#text(size: 7pt, [Extended Version End.])]
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([27. 50 Micro Rules - Copyright])
    - 1) 未经许可复制即侵权，不要求商业目的。
    - 2) 复制可发生在 RAM/缓存层面。
    - 3) 量少也可能实质，关键看质量。
    - 4) access + 相似性可推定 copying。
    - 5) 变量名替换不等于独立创作。
    - 6) 先有权利归属，后谈侵权。
    - 7) 雇员代码通常归雇主。
    - 8) 委托创作先看合同。
    - 9) 发行权看首次投入流通。
    - 10) 出租权需商业利益。
    - 11) 公开播放看是否 public。
    - 12) 上网可得通常触发 s.28A。
    - 13) 改编程序可由语言转换构成。
    - 14) 对改编本的行为也可侵原作。
    - 15) 授权侵权不等于“提供便利”。
    - 16) Moorhouse 三要素常为核心。
    - 17) secondary infringement 常需 knowledge。
    - 18) constructive knowledge 也可满足。
    - 19) 平行进口先判境外合法性。
    - 20) 程序平行进口有 s.35A 特例。
    - 21) fair dealing 目的要先对上法条。
    - 22) 四因素只是最低框架。
    - 23) 市场替代效应是关键负面点。
    - 24) 教学例外条件细，别笼统写。
    - 25) 浏览瞬时复制有技术例外。
    - 26) 平台题要拆“平台/上传者/下载者”。
    - 27) 直播和点播都可能属 communication。
    - 28) “个人用途条款”超出即无授权。
    - 29) 字幕有独立版权不等于可用影片。
    - 30) 超链接通常非直接侵权。
    - 31) 明知引流盗版可升 authorisation 风险。
    - 32) 民事与刑事门槛要分开写。
    - 33) 刑责常看 business/trade context。
    - 34) 赔偿与利润返还通常择一。
    - 35) injunction 往往是原告首要目标。
    - 36) delivery up 常配合禁令请求。
    - 37) 先写 likely，再写 caveat。
    - 38) 不要把 breach of confidence 当版权侵权替代。
    - 39) 共同作者贡献须不可分离。
    - 40) computer-generated work 作者规则特殊。
    - 41) 保护期题先算死亡年份。
    - 42) 合著以最后死亡者计算。
    - 43) 程序作品可同时主张文本和结构复制。
    - 44) 将作品上传群组通常已完成传播行为。
    - 45) 下载刻盘再分发会放大责任链。
    - 46) 大规模复制更易推定主观过错。
    - 47) 不确定时写“arguable subject to evidence”。
    - 48) section number 写对比长篇道理更重要。
    - 49) 每被告主体单独结论。
    - 50) 每小问结尾写 civil + criminal 两句。

    #h1([28. 40 Micro Rules - Privacy])
    - 1) 先识别是否 personal data。
    - 2) data user 看控制目的与方式。
    - 3) data processor 不当然免责，视角色。
    - 4) DPP1 管收集，不是使用。
    - 5) DPP2 管准确与保留期限。
    - 6) DPP3 是新目的核心战场。
    - 7) DPP4 看 all practicable steps。
    - 8) DPP5 看政策透明。
    - 9) DPP6 管查阅更正权。
    - 10) 向第三方转移常触发 DPP3。
    - 11) 沉默通常不是 prescribed consent。
    - 12) direct marketing 同意标准更严。
    - 13) 口头同意常需后续书面确认。
    - 14) 首次直销须告知可随时停止。
    - 15) 收到停用要求必须停。
    - 16) 转移名单给他人直销需书面同意。
    - 17) for gain 转移名单刑责更重。
    - 18) DAR 是“个人资料”，非“全部文件”。
    - 19) 可删节就应部分披露。
    - 20) 第三者资料可构成 mandatory refusal。
    - 21) 非中英文请求可酌拒。
    - 22) 重复不合理请求可酌拒。
    - 23) 拒绝必须给理由。
    - 24) 更正请求与查阅请求分开写。
    - 25) 外包处理必须有合同控制。
    - 26) 安全事故常同时触发 DPP2/DPP4。
    - 27) 买来黑客数据常涉 DPP1 + DPP3。
    - 28) 新闻豁免有边界与时间点。
    - 29) 执法豁免不是全能牌。
    - 30) 健康豁免强调严重损害风险。
    - 31) doxxing 需满足意图或伤害要件。
    - 32) 域外披露也可能被 cessation notice 覆盖。
    - 33) 不遵从执行通知可成独立罪。
    - 34) 可求补偿含精神损害。
    - 35) 雇主可被 vicariously liable。
    - 36) 已尽 all practicable steps 是关键抗辩。
    - 37) 题目若给“保密条款”仍需回到法条。
    - 38) 先定 DPP 再定罪行条文。
    - 39) 每段写明主体是谁。
    - 40) 结论常用 likely/arguable，不写绝对。
  ],
  [
    #h1([29. 35 Micro Rules - Patent])
    - 1) 专利保护思想实施，不是表达。
    - 2) 地域性强，先确认法域。
    - 3) 可专利性先于侵权。
    - 4) s.9A 排除是软件题起点。
    - 5) “as such”是核心限定词。
    - 6) 技术贡献是破排除关键。
    - 7) 仅内容生成提升常不足。
    - 8) 改善计算机运行更有希望。
    - 9) 先申请再公开是黄金规则。
    - 10) demo/销售/论文可能毁 novelty。
    - 11) priority date 关系 prior art 截点。
    - 12) inventive step 需相对 closest prior art。
    - 13) obviousness 面向 skilled person。
    - 14) claim wording 决定保护边界。
    - 15) 先做 purposive construction。
    - 16) 再抽 essential integers。
    - 17) 缺一个必要要件常可抗 literal infringement。
    - 18) 仍需防 Actavis 等同打击。
    - 19) Actavis Q3 常为决胜点。
    - 20) 被告几乎总应考虑 revocation 反诉。
    - 21) novelty 攻击常最直接。
    - 22) inventive-step 攻击常最稳。
    - 23) 雇员发明看职责实质。
    - 24) 教授也可能因研究职责归雇主。
    - 25) co-owner 对处分受限。
    - 26) 私人非商业与实验例外要严格解释。
    - 27) 侵权与有效性可并行争。
    - 28) 专利公布后到授权前期间也有策略意义。
    - 29) remedies 通常以禁令为核心。
    - 30) 专家证据在专利案权重高。
    - 31) 程序+硬件结合不自动可专利。
    - 32) business method 包装成系统也可能被排除。
    - 33) Claim drafting 的 fallback 很重要。
    - 34) 先写主结论，再写替代结论。
    - 35) 不确定时把争点挂到 Q1/Q2/Q3 分析上。

    #h1([30. Mini Hypotheticals - One-line Outcomes])
    #h2([A. Copyright])
    - H1：前员工带走旧公司 UML 图并让新团队照着写 -> likely infringement + authorisation。
    - H2：老师在班内网短期放教材供课程使用 -> potentially within s.41A (fact-sensitive)。
    - H3：论坛只放盗版资源链接且置顶导流盈利 -> authorisation risk high。
    - H4：用户仅流媒体观看无下载 -> 看平台端 s.28A，更重于用户端。

    #h2([B. Privacy])
    - H5：公司用注册手机号推新产品但收集时未告知营销用途 -> DPP3 + Part6A risk。
    - H6：客户要求全部内部风控手册 -> 非个人资料部分可拒，个人资料部分需处理。
    - H7：医院紧急向家属披露必要病情避免重大伤害 -> health exemption arguable。
    - H8：社媒公开他人地址并引导骚扰 -> doxxing offence likely arguable。

    #h2([C. Patent])
    - H9：仅将数学模型写成代码用于写诗 -> exclusion likely。
    - H10：新缓存机制显著降低 CPU 占用 -> technical contribution arguable。
    - H11：被控芯片少一要件但等效实现同结果 -> Actavis analysis required。
    - H12：申请前已在公开展会完整演示 -> novelty vulnerable。

    #h2([D. Exam Ending Templates])
    - "Accordingly, liability is likely in civil law, with criminal liability depending on proof of commercial dealing and mens rea."
    - "Accordingly, the claim may fail on patentability/validity even if infringement arguments are arguable."
    - "Accordingly, the data user should cease the impugned use immediately and implement remedial compliance steps."

    #h2([E. Final Reminder])
    - 你的答案不是写“知识点”，而是写“要件如何被事实满足/不满足”。
    - 评分重点是结构化法律推理，不是措辞花哨。

    #align(center)[#text(size: 7pt, [Practice this sheet by answering one past paper with only this PDF.])]
  ]
)


#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([31. Mistake Log Template (Print & Fill)])
    #h2([A. Copyright Mistake Tracker])
    - 题号：[      ] 失分点：[      ]
    - 忘写法条：[      ]
    - 忘写主体区分：[      ]
    - 忘写抗辩：[      ]
    - 下次固定句："[      ]"

    #h2([B. Privacy Mistake Tracker])
    - 题号：[      ] 失分点：[      ]
    - DPP 选错（1/2/3/4/5/6）：[      ]
    - 同意标准写错：[      ]
    - DAR 拒绝依据写错：[      ]
    - 下次固定句："[      ]"

    #h2([C. Patent Mistake Tracker])
    - 题号：[      ] 失分点：[      ]
    - 排除客体分析漏写：[      ]
    - novelty/inventive step 漏写：[      ]
    - Actavis 三问漏写：[      ]
    - 下次固定句："[      ]"

    #h1([32. Last-day Memorization Cards])
    #h2([A. 版权 10 句])
    - 1) s.22 先定 restricted act。
    - 2) s.23 复制含电子存储。
    - 3) 实质部分看质量不看数量。
    - 4) 相似+接触可推定复制。
    - 5) Moorhouse 控制+知情+未限用。
    - 6) fair dealing 要先对法定目的。
    - 7) 市场替代效应常决定公平性。
    - 8) s.35/35A 先做复制品性质判断。
    - 9) s.107 民事救济写全。
    - 10) s.118 刑责看商业与主观要件。

    #h2([B. 私隐 10 句])
    - 1) DPP1 管收集，DPP3 管新用途。
    - 2) prescribed consent 要明确。
    - 3) 沉默不是直销同意。
    - 4) 口头同意需书面确认。
    - 5) first use 要提示可停用。
    - 6) 收到停用必须停。
    - 7) 名单转移需书面同意。
    - 8) DAR 能删节就删节。
    - 9) doxxing 看同意+意图/伤害。
    - 10) s.66 可赔精神损害。

    #h2([C. 专利 10 句])
    - 1) 先过 s.9A 排除。
    - 2) 再过 s.9B 新颖性。
    - 3) 再过 s.9C 创造性。
    - 4) 再过 s.9D 工业应用。
    - 5) 先申请后公开。
    - 6) 侵权前先解释权利要求。
    - 7) 缺要件先抗 literal。
    - 8) 仍需应对 Actavis 等同。
    - 9) 被告常要反诉撤销。
    - 10) entitlement 看职责实质。
  ],
  [
    #h1([33. 90-minute Exam Pacing Plan])
    #h2([A. 0-5 min])
    - 快速浏览三题，标注法域和高风险小问。
    - 在题干旁写 section anchors（每题至少 6-10 个）。

    #h2([B. 5-30 min - Q1])
    - 先写结论骨架。
    - 每段用“法条 -> 要件 -> 事实 -> 小结论”。
    - 留 2 分钟补反方点。

    #h2([C. 30-60 min - Q2])
    - 先分主体，再分行为。
    - 切记 ownership/entitlement 题先写归属。

    #h2([D. 60-85 min - Q3])
    - 快速套模板，避免展开过长。
    - 每小问确保有 civil/criminal 或 validity/infringement 双线。

    #h2([E. 85-90 min])
    - 扫描是否遗漏 section numbers。
    - 把绝对词改成 likely/arguable。
    - 检查每题是否有反方分析。

    #h1([34. Ultra-Compact One-page Fallback])
    - Copyright：s.22/23/28A + substantial part + Moorhouse + fair dealing + s.107/118。
    - Privacy：DPP1/3/4 + Part6A + s.20 DAR + s.64 doxxing + s.66。
    - Patent：s.9A/9B/9C/9D + s.57 + s.73 + Actavis + s.91。
    - 万能句："On balance, liability is likely/arguable, subject to statutory exceptions and evidential proof."

    #h2([35. Personal Final Notes])
    - Lecturer重点：[      ][      ][      ][...]
    - 我最弱模块：[      ][      ][      ][...]
    - 必背法条：[      ][      ][      ][...]
    - 最常错句型：[      ][      ][      ][...]
    - 考前 30 分钟复习顺序：[      ][      ]

  ]
)

#grid(
  columns: (1fr, 1fr),
  gutter: 4pt,
  [
    #h1([36. Ownership / Entitlement Edge Cases])
    #h2([A. Copyright])
    - 雇员在家完成作品，不当然排除 s.14；关键仍是 course of employment。
    - 头脑风暴中仅给 idea 的人通常不是作者；写出表达的人才更可能是 author。
    - 图表与正文可分属不同作者；先拆作品再拆作者。
    - joint authorship 要求贡献不可分离，不是“参与讨论”就算。
    - computer-generated work 不问“谁按下生成键”这么简单，而看谁作出 necessary arrangements。

    #h2([B. Privacy])
    - 资料处理商若实质决定用途与方式，可能不只是 processor，而是 data user。
    - 从第三方取得数据，对接收方而言仍可能构成自身 collection/use 问题。
    - relevant person 可代未成年人/精神上无行为能力者行权，但范围要对条文。

    #h2([C. Patent])
    - 教师/教授题不要只看职称，要看合同职责、研究任务、是否合理预期会产出发明。
    - co-owner 可自行利用专利，但处分份额/许可常受限制（见 s.54 逻辑）。

    #h1([37. Evidence / Proof Checklist])
    #h2([A. Copyright Proof])
    - 原告：原作品形成时间、版本记录、仓库记录、接触机会、专家比对。
    - 被告：独立开发记录、设计草稿、时间线、第三方来源证明。
    - 平台题：notice-and-takedown、过滤、warning、repeat infringer policy。

    #h2([B. Privacy Proof])
    - 收集通知文本、私隐政策版本、opt-in/opt-out 日志、营销名单来源、访问日志。
    - DAR 题：请求文本、识别资料、删节前后版本、拒绝理由书。

    #h2([C. Patent Proof])
    - 专利文本、claim chart、prior art、公开展示时间线、专家意见、产品逆向报告。
    - 侵权比对尽量按 integer-by-integer 展开。
  ],
  [
    #h1([38. High-Frequency Boundary Examples])
    #h2([A. Copyright])
    - 例：只复制 5 行代码但正好是关键算法实现 -> 仍可能属 substantial part。
    - 例：把影片加英文字幕再免费播放 -> 自身字幕有版权，但不解决底层影片授权。
    - 例：学校内部共享教材一年以上、对外可访问 -> s.41A 抗辩明显变弱。

    #h2([B. Privacy])
    - 例：招聘收到简历后转用于卖培训课程 -> 通常是 DPP3 新目的。
    - 例：客户留电话收验证码，后拿去推销贷款 -> DPP3 + Part 6A 风险。
    - 例：警方向媒体确认嫌疑人住址 -> 先看执法豁免是否真的覆盖披露行为。

    #h2([C. Patent])
    - 例：算法用于压缩数据并减少带宽/能耗 -> 技术贡献论证更强。
    - 例：同一识别方法换语言模型实现 -> 先看 claim 是否限于特定语言/元素。
    - 例：展会上完整演示后再申请 -> novelty/inventive step 都可能受冲击。

    #h1([39. Remedies / Procedure by Topic])
    #h2([A. Copyright])
    - 程序上常见诉求：禁令、损害赔偿、利润返还、交付侵权复制品、下架/停止传播。
    - 若涉及商业规模，可补写刑责风险但别写死。

    #h2([B. Privacy])
    - 行政线：投诉专员 -> 调查 -> enforcement notice。
    - 民事线：s.66 compensation（财务损失 + 精神损害）。
    - 刑事线：Part 6A / s.64 / 不遵从 notice 的独立罪行。

    #h2([C. Patent])
    - 原告：禁令 + damages/account + 成本压力。
    - 被告：答辩中并行主张 non-infringement 与 revocation。
    - 若 validity 很脆，和解杠杆会明显变化。

    #h1([40. Final Answer Calibration])
    - ownership/entitlement 题：先人后权，先作者/发明人，再所有权归属。
    - infringement 题：先权利范围，再行为，再抗辩。
    - privacy 题：先 DPP，再 offences；不要倒过来。
    - 不确定时写条件式结论：\"If the court accepts ..., X is likely ...; otherwise ...\"。
    - 每段尽量以 section number 起手，考官最容易给分。
  ]
)
