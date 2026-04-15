# installers

This directory ships the install, restore, doctor, and quick-proof entrypoints for `godex`.

## Product Direction

`godex` now ships two real install surfaces:

- project install for one repository
- global install for one Codex home

Project install remains the safest default.

Global install exists for users who want a broader default layer and accept a slightly larger mutation surface.

## Shipped Scripts

- `install-project.sh`: install `godex` into one repository
- `agents_preflight.py`: classify install targets before mutation and stop only on explicit no-auto-append cases or marker conflicts
- `project-doctor.py`: inspect an installed project and classify it as `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`, or `missing`
- `project-restore.py`: remove the managed project layer and restore the previous `AGENTS.md` state when possible
- `project-benchmark.sh`: run the quick post-install proof loop
- `install-global.sh`: install `godex` into one Codex home
- `global-doctor.py`: inspect an installed global layer and classify it as `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`, or `missing`
- `global-restore.py`: remove the managed global layer and restore the previous `AGENTS.md` state when possible
- `global-benchmark.sh`: run the quick post-install proof loop for a Codex home
- `godex-doctor.sh`: keep the current repo dogfood check and delegate to project doctor for target repos

## Safety Contract

- do not silently overwrite an existing `AGENTS.md`
- backup before mutation
- preflight with `--dry-run` before risky mutation
- keep global dry-run non-mutating even when the target Codex-home path does not exist yet
- stop safely on explicit no-auto-append cases
- explain what changed
- print the next verification step after install

## Current Status

- project install is implemented for `v1.0.1`
- global install is implemented for `v1.0.1`
- project and global backup, restore, doctor, and quick-proof surfaces are implemented
