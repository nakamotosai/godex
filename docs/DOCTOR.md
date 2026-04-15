# Doctor

`godex doctor` is the first product trust surface.

Its job is to answer a simple question:

**is the current `godex` surface actually installed and dogfood-ready?**

## First Doctor Scope

The first doctor is intentionally lightweight.

It checks:

- key repo assets exist
- dogfood spec exists
- benchmark assets exist
- the current workspace has the thin `godex dogfood` install

It does **not** yet:

- merge user configs
- repair drift automatically
- verify a universal global install

## Command

```bash
bash /home/ubuntu/codex/godex/installers/godex-doctor.sh /home/ubuntu/codex
```

If no workspace path is passed, the script defaults to `/home/ubuntu/codex`.

## Status Classes

- `healthy`: required repo and workspace surfaces are present
- `partial`: some but not all required surfaces are present
- `missing`: expected repo or workspace surfaces are absent

The broader product spec still reserves richer future states such as `drifted`, `conflicted`, and `unsupported`.

The first doctor only needs enough fidelity for real dogfood.

## Repo Checks

The first doctor checks for:

- root `README.md`
- root `AGENTS.md`
- dogfood rollout spec
- benchmark rubric
- benchmark tasks
- bootstrap prompt

## Workspace Checks

The first doctor checks the current workspace `AGENTS.md` for a visible `godex dogfood` block and the required dogfood routing points:

- spec escalation wording
- native multi-agent preference
- frontend acceptance reuse

## How To Interpret Results

- `healthy` means the current dogfood lane is ready to use
- `partial` means some assets exist, but the dogfood lane is incomplete
- `missing` means the current local rollout is not actually installed

## Current Boundary

This is the first doctor, not the final installer-grade doctor.
