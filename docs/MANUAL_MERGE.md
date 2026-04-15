# Manual Merge Guide

Use this guide when `godex` install preflight reports `manual_review`.

That status means the existing `AGENTS.md` looks too complex for safe automatic append.

## Why `godex` Stops

`v1` prefers safe stop over risky mutation.

Typical signals:

- multiple headings
- numbered workflow sections
- code fences or tables
- a longer custom policy stack

## Safe Path

1. Run the installer with `--dry-run` first.

2. Keep your existing `AGENTS.md` as the source of truth.

3. Copy the relevant `godex` block into that file manually:

- project install block:
  `blocks/project-agents-block.md`

- global install block:
  `blocks/global-agents-block.md`

4. Place the block as its own section, preserving the start and end markers.

5. Avoid merging by paraphrase.

Keep the markers intact so doctor can recognize the managed block later.

6. After manual merge, rerun install if you want the helper files copied, or copy the helper surface manually from the repo docs and examples.

## Verify After Manual Merge

Project:

```bash
bash installers/install-project.sh --dry-run /path/to/repo
```

Global:

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

If the file now classifies as `ready_replace`, the managed block is in place and the regular installer can continue safely.
