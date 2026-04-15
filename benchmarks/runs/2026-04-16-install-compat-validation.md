# 2026-04-16 Install Compatibility Validation

## 目标

验证 `godex` 安装预检不再把普通结构化 `AGENTS.md` 误判为 `manual_review`。

## 覆盖面

- project install:
  `clean` / `simple` / `structured` / `guarded` / `drift` / `partial` / `conflicted`
- global install:
  `clean-home` / `simple-home` / `structured-home` / `guarded-home` / `drift-home` / `partial-home` / `conflicted-home`

其中：

- `structured` / `structured-home`：
  有标题、编号列表和自由说明，但应允许 `ready_append`
- `guarded` / `guarded-home`：
  显式包含 `godex: manual_review` 或 `godex: no_auto_append`，应停在 `manual_review`

## 执行命令

```bash
bash benchmarks/scripts/verify_install_surfaces.sh
```

```bash
bash installers/godex-doctor.sh --repo-only
```

## 结果

- install proof: passed
- repo doctor: passed
- 结构化 `AGENTS.md` 现在默认走 additive install
- 显式 opt-out 标记仍会安全停在 `manual_review`

## 结论

这轮修复把 `manual_review` 从“排版复杂度误判”收缩成了“明确声明不要自动追加”的真实边界。
