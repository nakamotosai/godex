# Compatibility

`godex` is designed for messy real-world Codex setups, not only perfect clean installs.

## First Support Target

For the first serious release, support should be honest and narrow:

- target first: Codex CLI with local repository access
- safest default: project-level install
- quick-paste mode works without file mutation
- global install should remain secondary until backup and drift handling are proven

## Expected User Setups

| User setup | Recommended mode | Mutation level | Main risk | Required behavior |
| --- | --- | --- | --- | --- |
| Mostly vanilla Codex | Project install | Low | Low | Install cleanly and explain what is active |
| Prompt-only user | Quick paste | None | Low | Improve behavior without claiming durable install |
| Existing custom `AGENTS.md` | Project install first | Low | Medium | Do not overwrite globals; detect and report custom rules |
| Existing third-party skills | Project install first | Low | Medium | Avoid conflicts and surface them in doctor |
| Shared team repository | Project install | Medium | Medium | Keep repo rules explicit and reviewable |
| Power user wanting full upgrade | Full install later | Higher | High | Backup before replacement and show drift clearly |

## Merge Rules

- Prefer adding project-scoped files before touching user-global files.
- Never silently delete or replace a user's existing Codex rules.
- If global install is chosen, create a dated backup before any replacement.
- If coexistence is unclear, stop at a safe partial state and explain the conflict.

## Doctor Expectations

Compatibility should be reported, not guessed.

Doctor should eventually flag:

- installed layers
- missing layers
- custom instructions detected
- likely conflicts
- unsupported environments

## Current Boundary

The compatibility policy is designed.

Automated merge and drift handling are not implemented yet.
