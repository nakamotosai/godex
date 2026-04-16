# installers

This directory now contains historical and supporting utilities from the earlier install-first phase of `godex`.

It is no longer the primary product entry.

## Current Role

These scripts remain useful for:

- maintainer dogfood and comparison work
- historical inspection of the install-first phase
- backup, restore, doctor, or benchmark experiments in controlled environments

If a new user is simply trying to adopt `godex`, the default path is now the canonical methodology prompt in [`../prompts/GODEX_METHOD_PROMPT.md`](../prompts/GODEX_METHOD_PROMPT.md), not these scripts.

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

## Historical Safety Contract

- do not silently overwrite an existing `AGENTS.md`
- backup before mutation
- preflight with `--dry-run` before risky mutation
- keep global dry-run non-mutating even when the target Codex-home path does not exist yet
- stop safely on explicit no-auto-append cases
- explain what changed
- print the next verification step after install

## Current Status

- install-first utilities remain available
- they are no longer the default public adoption surface
