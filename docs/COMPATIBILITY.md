# Compatibility

`godex` is designed for messy real-world Codex setups, not only perfect clean installs.

## First Support Target

For the current mainline after `v1.0.1`, support is intentionally honest and narrow:

- target first: Codex CLI with local repository access
- safest default: project-level install
- global install is now available for one Codex home with backup-first mutation
- quick-paste mode works without file mutation

See also: `docs/SUPPORT_MATRIX.md`.

## Expected User Setups

| User setup | Recommended mode | Mutation level | Main risk | Required behavior |
| --- | --- | --- | --- | --- |
| Mostly vanilla Codex | Project install | Low | Low | Install cleanly and explain what is active |
| Prompt-only user | Quick paste | None | Low | Improve behavior without claiming durable install |
| Existing custom `AGENTS.md` in one repo | Project install first | Low | Medium | Do not overwrite repo rules; detect and report custom rules |
| Existing global `AGENTS.md` with light customization | Global install | Medium | Medium | Backup first and preserve the user's prior state |
| Existing third-party skills or large custom global policy | Project install first | Low | Higher | Backup first, append by default, and only stop when the file explicitly blocks auto-append |
| Shared team repository | Project install | Medium | Medium | Keep repo rules explicit and reviewable |

## Merge Rules

- Prefer adding project-scoped files before touching user-global files.
- Never silently delete or replace a user's existing Codex rules.
- Global dry-run must not create a missing target Codex-home path.
- Global install creates a dated backup before any replacement.
- If coexistence is unclear, stop at a safe partial state and explain the conflict.

## Doctor Expectations

Compatibility should be reported, not guessed.

Doctor now flags:

- installed layers
- missing layers
- drifted layers
- conflicted markers
- unsupported targets

## Current Boundary

Backup and drift visibility are implemented for both install modes.

Semantic merge for arbitrary custom policies is still not implemented.

`v1` now defaults ordinary existing `AGENTS.md` files to additive install and reserves `manual_review` for explicit opt-out markers plus `docs/MANUAL_MERGE.md`.
