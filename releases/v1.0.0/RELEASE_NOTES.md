# `godex` v1.0.0 Release Notes

## What Ships In `v1.0.0`

- quick paste bootstrap
- project install
- global install
- backup, restore, doctor, and quick-proof surfaces for both durable install modes
- dry-run preflight before risky mutation
- safe stop plus manual-merge guidance for complex existing `AGENTS.md` policies
- troubleshooting, upgrade, contributing, and GitHub issue templates
- CI release guard and broader validation record surfaces

## Why This Is `v1`

`v1.0.0` is not trying to be universally clever.

It is trying to be honest, lean, and safe:

- clear support scope
- real install surfaces
- real restore paths
- real doctor paths
- real release artifacts

## Upgrade Notes

Before upgrading, run the relevant installer with `--dry-run`.

Then read:

- `docs/UPGRADE.md`
- `docs/TROUBLESHOOTING.md`
- `docs/MANUAL_MERGE.md`

## Known Boundary

- complex custom global policies still require manual merge
- support target is Codex CLI on Unix-like shells
- validation is broader than maintainer-only proof, but still not broad public-scale validation
