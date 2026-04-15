# Support Matrix

This document defines the honest `godex v1` support contract.

## First-Class Targets

| Surface | Status | Notes |
| --- | --- | --- |
| Codex CLI on Linux | Supported | Primary reference environment |
| Codex CLI on macOS | Supported | Same install flows as Linux |
| Codex CLI in WSL-style Unix shells | Supported | Treat as Unix-shell install target |

## Supported Install Modes

| Mode | Status | Recommended when | Safety model |
| --- | --- | --- | --- |
| Quick paste | Supported | User wants zero file mutation | No mutation |
| Project install | Supported | User wants the safest durable mode | Backup-first, repo-local |
| Global install | Supported | User wants a broader default layer in one Codex home | Backup-first, conservative preflight |

## Manual-Review Cases

These are real `v1` cases, but not auto-merge cases:

- project `AGENTS.md` explicitly contains an opt-out marker such as `godex: manual_review`
- global `AGENTS.md` explicitly contains an opt-out marker such as `godex: no_auto_append`
- user wants to preserve an explicit no-auto-append policy and continue by manual merge

Expected behavior:

- `--dry-run` classifies the target first
- the installer stops safely
- `docs/MANUAL_MERGE.md` explains how to continue without silent mutation

## Not Claimed In `v1`

- universal support for every non-CLI Codex runtime
- native PowerShell-first Windows install flow
- automatic merge with arbitrary custom instruction stacks
- broad community-scale validation beyond the recorded matrix in this repo
