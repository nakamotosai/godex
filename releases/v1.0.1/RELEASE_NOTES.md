# `godex` v1.0.1 Release Notes

## What Changes In `v1.0.1`

- global `--dry-run` no longer creates a missing target Codex-home directory
- global preflight now classifies a missing Codex-home target as `ready_create`
- install proof now covers the missing-target dry-run regression and the matching first install path

## Why This Patch Exists

`v1.0.0` claimed a non-mutating global preview path, but the actual installer created the target directory before preflight finished.

`v1.0.1` is the corrective patch release for that safety bug.

## Upgrade Notes

Before reinstalling or upgrading, run the relevant installer with `--dry-run`.

Then read:

- `docs/UPGRADE.md`
- `docs/TROUBLESHOOTING.md`
- `docs/MANUAL_MERGE.md`

## Known Boundary

- complex custom global policies still require manual merge
- support target is Codex CLI on Unix-like shells
- validation is broader than maintainer-only proof, but still not broad public-scale validation
