# Doctor

`godex doctor` is the main trust surface for this repo and for installed project layers.

It answers two questions:

1. is the maintainer dogfood repo intact
2. is an installed project-layer `godex` surface intact

## Doctor Surfaces

### Repo Dogfood Doctor

Use the repo entrypoint with no argument, or point it at the current dogfood workspace:

```bash
bash installers/godex-doctor.sh
```

```bash
bash installers/godex-doctor.sh /home/ubuntu/codex
```

This mode keeps the original lightweight checks for the `godex` repository plus the current local dogfood workspace.

### Installed Project Doctor

After running project install, use the copied doctor inside the target repo:

```bash
/path/to/target-repo/.godex/bin/godex-doctor /path/to/target-repo
```

The repo entrypoint also delegates to the project doctor when you pass another target repo path:

```bash
bash installers/godex-doctor.sh /path/to/target-repo
```

## Repo Dogfood Scope

The repo doctor remains intentionally lightweight.

It checks:

- key repo assets exist
- dogfood spec exists
- benchmark assets exist
- the current workspace has the thin `godex dogfood` install

## Project Install Scope

The installed project doctor checks:

- root `AGENTS.md` for the managed `godex` block
- `.godex/manifest.json`
- installed helper scripts
- installed docs and example surfaces
- drift between the manifest and the current installed files

## Status Classes

- `healthy`: install is intact and matches the manifest
- `partial`: some install traces exist, but the install is incomplete
- `drifted`: the install exists, but managed files or the managed block changed or disappeared
- `conflicted`: `AGENTS.md` markers are broken, duplicated, or mismatched
- `unsupported`: the target root or manifest version is not supported by this doctor
- `missing`: no project-install traces were found

Repo dogfood mode only needs `healthy` and `partial`.

Project install mode uses the full installer-grade state set.

## Repo Checks

The repo doctor checks for:

- root `README.md`
- root `AGENTS.md`
- dogfood rollout spec
- benchmark rubric
- benchmark tasks
- bootstrap prompt

## Workspace Checks

The repo doctor checks the current workspace `AGENTS.md` for a visible `godex dogfood` block and the required dogfood routing points:

- spec escalation wording
- native multi-agent preference
- frontend acceptance reuse

## How To Interpret Results

- repo `healthy` means the current dogfood lane is ready to use
- repo `partial` means some assets exist, but the dogfood lane is incomplete
- project `healthy` means the installed project layer is intact
- project `missing`, `partial`, `drifted`, `conflicted`, and `unsupported` each point to the smallest truthful recovery path

## Current Boundary

There is still no automatic drift repair.

Global install is still out of scope for doctor.
