# installers

This directory ships the install, restore, doctor, and quick-proof entrypoints for `godex`.

## Product Direction

`godex` ships project-first installation before it attempts broad global mutation.

That keeps the safest real path at the center of the product.

## Shipped Scripts

- `install-project.sh`: install `godex` into one repository
- `project-doctor.py`: inspect an installed project and classify it as `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`, or `missing`
- `project-restore.py`: remove the managed project layer and restore the previous `AGENTS.md` state when possible
- `project-benchmark.sh`: run the quick post-install proof loop
- `godex-doctor.sh`: keep the current repo dogfood check and delegate to project doctor for target repos

## Deferred Script

- `install-global.sh`: install `godex` into a user's broader local Codex environment

## Safety Contract

- do not silently overwrite an existing `AGENTS.md` or local repo policy
- backup before mutation
- explain what changed
- print the next verification step after install

## Current Status

- project install beta is implemented
- backup, restore, doctor, and quick-proof surfaces are implemented
- global install is still deferred
