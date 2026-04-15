# Doctor

`godex doctor` is the main trust surface for this repo and for both shipped install types.

It answers three questions:

1. is the maintainer dogfood repo intact
2. is an installed project-layer `godex` surface intact
3. is an installed global-layer `godex` surface intact

## Doctor Surfaces

### Repo Dogfood Doctor

Use the repo entrypoint with no argument, or point it at the current dogfood workspace:

```bash
bash installers/godex-doctor.sh
```

```bash
bash installers/godex-doctor.sh /home/ubuntu/codex
```

This mode keeps the lightweight checks for the `godex` repository plus the current local dogfood workspace.

### Installed Project Doctor

After running project install, use the copied doctor inside the target repo:

```bash
/path/to/target-repo/.godex/bin/godex-doctor /path/to/target-repo
```

You can also use the repo-local source entrypoint directly:

```bash
python3 installers/project-doctor.py /path/to/target-repo
```

### Installed Global Doctor

After running global install, use the copied doctor inside the Codex home:

```bash
~/.codex/godex/bin/godex-doctor ~/.codex
```

You can also use the repo-local source entrypoint directly:

```bash
python3 installers/global-doctor.py ~/.codex
```

## Repo Dogfood Scope

The repo doctor remains intentionally lightweight.

It checks:

- key repo assets exist
- dogfood spec exists
- current release-closeout spec exists
- benchmark assets exist
- install-proof and release-pack assets exist
- support docs and GitHub support surfaces exist
- the current workspace has the thin `godex dogfood` install

## Project Install Scope

The installed project doctor checks:

- root `AGENTS.md` for the managed `godex` block
- `.godex/manifest.json`
- installed helper scripts
- installed docs and example surfaces
- drift between the manifest and the current installed files

## Global Install Scope

The installed global doctor checks:

- Codex-home `AGENTS.md` for the managed `godex` global block
- `godex/manifest.json`
- installed helper scripts
- installed docs, prompts, and example surfaces
- drift between the manifest and the current installed files

## Status Classes

- `healthy`: install is intact and matches the manifest
- `partial`: some install traces exist, but the install is incomplete
- `drifted`: the install exists, but managed files or the managed block changed or disappeared
- `conflicted`: `AGENTS.md` markers are broken, duplicated, or mismatched
- `unsupported`: the target root or manifest version is not supported by this doctor
- `missing`: no install traces were found

Repo dogfood mode only needs `healthy` and `partial`.

Project and global install modes use the full installer-grade state set.

## Current Boundary

There is still no automatic drift repair.

Complex existing custom global policies may still require manual review before reinstalling.
