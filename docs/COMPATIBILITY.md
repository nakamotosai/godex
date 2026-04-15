# Compatibility

`godex` is designed for messy real-world Codex setups, not only perfect clean installs.

## First Support Target

For the current public beta, support is still honest and narrow:

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
| Existing third-party skills or complex global policy | Project install first | Low | Higher | Avoid broad mutation and surface the manual-review boundary honestly |
| Shared team repository | Project install | Medium | Medium | Keep repo rules explicit and reviewable |

## Merge Rules

- Prefer adding project-scoped files before touching user-global files.
- Never silently delete or replace a user's existing Codex rules.
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

Automated merge for complex custom global policies is not implemented.

`v1` handles those cases with preflight classification plus `docs/MANUAL_MERGE.md`.
