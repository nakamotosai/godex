# godex

> 把普通 Codex 强化成更清晰、更稳、更少废话的工程代理。

English: [README.en.md](README.en.md)

`README.md` 是这个仓库唯一的当前状态真相源。

## 如果你只是想安装

不要先研究 `godex` 的产品结构，也不要先让 Codex 给你出“进化方案”。

先选一种安装方式，直接落地。

### 1. 只想立刻体验，不改本地文件

直接把这个文件内容贴进一个新 Codex 会话：

- [prompts/bootstrap/GODEX_BOOTSTRAP.md](prompts/bootstrap/GODEX_BOOTSTRAP.md)

### 2. 最推荐：项目级安装

适合绝大多数人。只影响一个仓库，风险最低。

```bash
bash installers/install-project.sh --dry-run /path/to/your/repo
```

```bash
bash installers/install-project.sh /path/to/your/repo
```

```bash
/path/to/your/repo/.godex/bin/godex-doctor /path/to/your/repo
```

安装说明：

- [docs/PROJECT_INSTALL.md](docs/PROJECT_INSTALL.md)

### 3. 想让本机 Codex 默认都带上 godex 行为

这是全局安装。范围更大，所以默认先 `dry-run`。

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

```bash
bash installers/install-global.sh ~/.codex
```

```bash
~/.codex/godex/bin/godex-doctor ~/.codex
```

安装说明：

- [docs/GLOBAL_INSTALL.md](docs/GLOBAL_INSTALL.md)

### 4. 如果你是让 Codex 替你安装

把下面这段和仓库链接一起发给它，不要只丢链接。

```text
请安装这个仓库里的 godex，用来强化我当前的 Codex。

默认走 project install，不要先做产品审视、借鉴分析、演化方案或发布包设计。

先读 README 和 docs/PROJECT_INSTALL.md，
然后执行：
1. dry-run
2. install
3. doctor

如果遇到 manual_review，就停止实际改动，并明确告诉我为什么不能自动安装。
```

### 5. 不要这样发给 Codex

下面这种说法很容易把 Codex 带偏：

- “审视并借鉴这个项目”
- “对我本地 Codex 进行改进、进化”
- “研究一下这个项目怎么设计的，再给我一个方案”

这种提示会让它优先把 `godex` 当成一个要分析的开源产品，而不是一个要直接安装的强化包。

## 安装后会得到什么

- 首条回复会先复述你的任务，再行动。
- 已接受的完整目标不会被悄悄缩成“最小下一步”。
- 没有验证，不算完成。
- 收尾会更短、更清晰，不再默认塞一大堆废话和代码墙。
- 反复强调过的偏好会更容易在会话里变成默认行为。

## 当前版本

`v1.0.1`

## 当前状态

- quick paste 可用
- project install 可用
- global install 可用
- project/global 都带 backup、restore、doctor、quick proof
- `--dry-run` 预检可用
- global `--dry-run` 对不存在路径保持零落盘
- 复杂现有 `AGENTS.md` 会安全停在 `manual_review`

## 当前验证

- repo doctor：
  `bash installers/godex-doctor.sh --repo-only`
- install proof：
  `bash benchmarks/scripts/verify_install_surfaces.sh`
- patch 验证记录：
  [benchmarks/runs/2026-04-16-v1.0.1-patch-validation.md](benchmarks/runs/2026-04-16-v1.0.1-patch-validation.md)
- 公开发布：
  https://github.com/nakamotosai/godex/releases/tag/v1.0.1

## 当前边界

- 复杂已有 project/global `AGENTS.md` 栈不会强行自动合并，只会停在 `manual_review`
- 一等支持目标是 Codex CLI 的 Unix shell 环境
- Windows 当前走 WSL / Unix-shell 路线，不是 PowerShell-first
- 这已经超出维护者自用验证，但还不是大规模社区验证

## 常用文档

- 项目安装：
  [docs/PROJECT_INSTALL.md](docs/PROJECT_INSTALL.md)
- 全局安装：
  [docs/GLOBAL_INSTALL.md](docs/GLOBAL_INSTALL.md)
- 手工合并：
  [docs/MANUAL_MERGE.md](docs/MANUAL_MERGE.md)
- 故障排查：
  [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- 升级说明：
  [docs/UPGRADE.md](docs/UPGRADE.md)
- 支持矩阵：
  [docs/SUPPORT_MATRIX.md](docs/SUPPORT_MATRIX.md)
- doctor 说明：
  [docs/DOCTOR.md](docs/DOCTOR.md)

## 给维护者或研究者

如果你不是来安装，而是来研究这个项目的结构，再看这些：

- 仓库行为约束：
  [AGENTS.md](AGENTS.md)
- 安装层设计：
  [installers/README.md](installers/README.md)
- proof 层设计：
  [benchmarks/README.md](benchmarks/README.md)
- 当前发布口径：
  [docs/PUBLISH.md](docs/PUBLISH.md)
- 当前规格：
  [specs/v1-closeout-20260415/SPEC.md](specs/v1-closeout-20260415/SPEC.md)
