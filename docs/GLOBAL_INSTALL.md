# Global Install

`godex` global install targets one Codex home, usually `~/.codex`.

The main install path is:

```bash
bash installers/install-global.sh
```

Preview first:

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

Dry-run stays non-mutating even if the target Codex-home path does not exist yet.

Or install into a specific Codex-home target:

```bash
bash installers/install-global.sh /path/to/codex-home
```

## What It Adds

Global install writes:

- root `AGENTS.md` with a lean managed `godex` global block
- `godex/manifest.json`
- `godex/bin/godex-doctor`
- `godex/bin/godex-restore`
- `godex/bin/godex-benchmark`
- `godex/docs/GLOBAL_INSTALL.md`
- `godex/prompts/GODEX_BOOTSTRAP.md`
- `godex/examples/global-install-beta/README.md`
- `godex/examples/global-install-beta/review-layout-example.md`

## Safety Rules

- never silently overwrite an existing global `AGENTS.md`
- backup before mutation
- dry-run must not create a missing target Codex-home path
- create a fresh root `AGENTS.md` if the Codex home did not already have one
- replace an existing managed `godex` global block in place
- append a new managed block if the Codex home has a pre-existing `AGENTS.md` that does not explicitly block automatic godex append
- stop with `manual_review` only if the existing `AGENTS.md` explicitly asks godex not to auto-append
- stop with conflict if markers are broken or duplicated

## Verify After Install

Run:

```bash
~/.codex/godex/bin/godex-doctor ~/.codex
```

Then:

```bash
~/.codex/godex/bin/godex-benchmark ~/.codex
```

## Restore

To remove the installed global layer and restore the previous `AGENTS.md` backup:

```bash
~/.codex/godex/bin/godex-restore ~/.codex
```

The restore path keeps backups under `godex-backups/`.

## Installed Behavior

The managed global block is intentionally small.

It enforces the strongest `godex` defaults that should survive across repos:

- first reply mirrors the task before action
- accepted full objectives stay intact instead of shrinking into a "smallest next step" handoff
- done requires verification
- review-style long findings must be separated with real blank lines
- closeouts report behavior first and stay visually readable

## Current Boundary

Global install is broader than project install, so it stays conservative.

Global install no longer stops just because an existing `AGENTS.md` is structured or long.

It only stops at `manual_review` when the file explicitly blocks automatic godex append.

If preflight returns `manual_review`, use `docs/MANUAL_MERGE.md`.
