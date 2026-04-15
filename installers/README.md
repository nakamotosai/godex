# installers

This directory will hold installation, backup, repair, and doctor entrypoints for `godex`.

## Product Direction

`godex` should ship with project-first installation before it attempts broad global mutation.

That keeps the safest real path at the center of the product.

## Planned Scripts

- `install-project.sh`: install `godex` into one repository
- `install-global.sh`: install `godex` into a user's broader local Codex environment
- `backup-existing-config.sh`: backup existing rules before replacement or merge
- `godex-doctor.sh`: inspect installed layers and report health

## Safety Contract

- do not silently overwrite an existing `AGENTS.md` or local skill setup
- backup before replacement
- explain what changed
- print the next verification step after install

## Current Status

- install strategy defined
- scripts not implemented yet
