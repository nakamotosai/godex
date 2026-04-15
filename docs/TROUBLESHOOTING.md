# Troubleshooting

## Install Preflight States

- `ready_create`: no existing `AGENTS.md`; install can create one
- `ready_append`: existing `AGENTS.md` is compatible with additive install
- `ready_replace`: an existing managed `godex` block can be upgraded in place
- `manual_review`: existing `AGENTS.md` explicitly blocks automatic godex append
- `conflicted`: markers are duplicated or mismatched
- `unsupported`: target path is not a usable repo or Codex home

## Doctor States

- `healthy`: install is intact
- `missing`: no install traces were found
- `partial`: install traces exist, but manifest or managed files are incomplete
- `drifted`: managed files or managed block changed after install
- `conflicted`: markers are broken or duplicated
- `unsupported`: target root or manifest version is not supported

## First Checks

Project install:

```bash
bash installers/install-project.sh --dry-run /path/to/repo
```

```bash
/path/to/repo/.godex/bin/godex-doctor /path/to/repo
```

Global install:

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

```bash
~/.codex/godex/bin/godex-doctor ~/.codex
```

## Common Fixes

### `manual_review`

Do not force the install.

This state now means the target file explicitly opted out, for example with:

- `<!-- godex: manual_review -->`
- `<!-- godex: no_auto_append -->`

Use [MANUAL_MERGE.md](MANUAL_MERGE.md).

### `conflicted`

Fix the marker mismatch in `AGENTS.md` first, then rerun preflight.

### `drifted`

Use restore, then reinstall:

Project:

```bash
/path/to/repo/.godex/bin/godex-restore /path/to/repo
```

Global:

```bash
~/.codex/godex/bin/godex-restore ~/.codex
```

### `partial`

Reinstall from the source repo to rebuild missing helper files and manifest state.

## When Filing An Issue

Include:

- install mode
- target runtime and OS
- exact dry-run output
- exact doctor output
- whether restore was attempted
