# Changelog

All notable changes to `godex` are recorded here.

## v1.0.1 - 2026-04-16

### Fixed

- global `--dry-run` no longer creates a missing target Codex-home directory before preflight finishes
- global preflight now classifies a missing Codex-home target as `ready_create` instead of forcing a mutation first
- install proof now covers the missing-target global dry-run regression and the matching first install path

### Release Notes

- `v1.0.0` has been superseded by `v1.0.1` because the original global dry-run path left behind a real target directory

## v1.0.0 - 2026-04-16

### Added

- project install with backup, restore, doctor, benchmark, and example pack
- global install with backup, restore, doctor, benchmark, prompt copy, and example pack
- install preflight with `--dry-run` for project and global install
- safe `manual_review` stop for complex existing `AGENTS.md` policies
- manual merge guidance
- troubleshooting, upgrade, support matrix, and contributing docs
- GitHub issue templates and CI release guard
- isolated install proof plus broader validation record surfaces
- `v1.0.0` release pack and tagged-release smoke guidance

### Changed

- review-style long findings now have explicit layout rules across bootstrap, repo contract, and installed policy blocks
- repo doctor now supports `--repo-only` for CI and release gating
- README is now aligned to the `v1.0.0` closeout path rather than the earlier public beta path

### Known Boundaries

- complex existing global policies stop for manual review instead of auto-merge
- support target is Codex CLI on Unix-like shells; Windows is supported through Unix-shell style usage, not native PowerShell-first install flow
- broader validation exists beyond the maintainer primary workspace, but this is still not broad community-scale validation
