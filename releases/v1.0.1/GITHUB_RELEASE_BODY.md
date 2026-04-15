# `godex` v1.0.1

`godex` v1.0.1 is the corrective patch release for the global dry-run safety regression that shipped in `v1.0.0`.

## What `v1.0.1` Fixes

- global `--dry-run` no longer creates a missing target Codex-home directory
- global preflight now reports `ready_create` for a missing Codex-home target instead of requiring a mutation first
- install proof now covers the missing-target global dry-run path

## Start Here

- quick paste: `prompts/bootstrap/GODEX_BOOTSTRAP.md`
- project install: `docs/PROJECT_INSTALL.md`
- global install: `docs/GLOBAL_INSTALL.md`
- troubleshooting: `docs/TROUBLESHOOTING.md`
- upgrade: `docs/UPGRADE.md`

## Known Boundary

- complex global policy stacks stop for manual merge instead of auto-merge
- support target is Codex CLI on Unix-like shells
- this is a patch release, not a claim of universal runtime support or broad community-scale validation
