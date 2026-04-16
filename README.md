# godex

## 这是一套给当前 Codex 用的纯方法论提示词

> 用途很简单：把一段方法论提示词交给你自己的 Codex，让它先看清你本地已经有什么，再自己补齐缺的那部分。
>
> 它不再默认把自己当成要原样安装的包，也不假设每个人都适合同一套 `AGENTS.md` 追加方式。
>
> 你打开这个仓库，默认应该想到的是“把哪段提示词贴给我的 Codex，让它自己做本地适配”，不是“先跑哪个安装脚本”。

> 目标不是复制维护者的文件结构。
>
> 目标是让你的 Codex 在你自己的环境里，变得更清晰、更稳、更少废话。

English: [README.en.md](README.en.md)

`README.md` 是这个仓库唯一的当前状态真相源。

## 现在怎么用

直接打开这份主提示词，整段贴进一个新 Codex 会话：

- [prompts/GODEX_METHOD_PROMPT.md](prompts/GODEX_METHOD_PROMPT.md)

它会要求对方 Codex 先做本地审视，而不是先套模板：

- 读取它当前环境里的 `AGENTS.md`、skills、workflow、memory、mistakebook、README 和相邻规则文件
- 把现有能力分成：已具备、部分具备、缺失、冲突
- 只补真正缺的 durable layer，而不是整包覆盖
- 自行判断该把规则放进 `AGENTS.md`、skill、workflow 文档、`SPEC.md` / `PLAN.md` 模板，还是既有记忆面
- 如果本地没有 spec 流程，就先搭一个轻量但能落地的 spec 工作法
- 如果本地已经有等价能力，就跳过，不重复造系统
- 做完后再跑一遍冲突验收和最小必要验证
- 把长期规则沉到本地文件，避免以后每轮都重新灌整段大提示词

## 这套方法真正保留的核心增强

- 首条回复先回显任务：目标、关键边界、第一步动作要说清楚
- 不把完整目标偷偷缩成“最小下一步”，也不把 spec / plan 当默认暂停点
- 先读本地事实，再区分事实、推断和待验证假设
- 该有 spec 时就补 spec，不该流程化的小任务不要硬上流程戏
- 没有验证，不算完成
- 收尾先讲结果和行为变化，再讲验证和真实边界
- 长 finding、长段落、长列表项保持可扫读，不堆成一堵墙
- 反复出现的用户纠正要沉淀成后续默认，而不是每次重新提醒

## 当前状态

- 主产品形态：prompt-first methodology
- 主提示词：已可直接粘贴使用
- 安装脚本：保留在仓库里，但不再是默认主路径
- 旧的 install / doctor / benchmark 资产：视为历史阶段产物或维护者自用辅助面

## 当前边界

- 这套提示词不会替用户做价值判断；遇到真正破坏性、高风险或强风格冲突，仍应由对方 Codex 按本地规则谨慎决策
- 它能指导“如何本地适配”，但适配质量仍取决于对方 Codex 是否真的先读本地事实
- 仓库里仍保留 install-first 时代的脚本和文档，主要用于历史追溯、对照或维护者内部验证，不再代表默认采纳方式

## 历史资产

如果你是来研究旧方案而不是采用新方案，再看这些：

- [prompts/README.md](prompts/README.md)
- [installers/README.md](installers/README.md)
- [docs/PUBLISH.md](docs/PUBLISH.md)

当前公开发布仍停留在旧的 install-first 版本：

- 最新公开发布：`v1.0.1`
- 当前 `main` 分支方向：prompt-first pivot
