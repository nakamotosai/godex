# Publish

This document tracks how `godex` moves from the old install-first shape toward the new prompt-first public shape.

## Current Publish State

- public GitHub repository exists: `https://github.com/nakamotosai/godex`
- default branch: `main`
- latest public release: `v1.0.1`
- `v1.0.1` reflects the earlier install-first phase
- current `main` direction is the prompt-first methodology pivot

## Current Public Pack Direction

The default public artifact should now be:

- one canonical methodology prompt
- one README that explains prompt-first adoption clearly
- prompt docs that explain local adaptation, not package installation first

Installers remain in-repo as historical or supporting assets, not the default public call to action.

## Release Sequence For The Pivot

1. keep the canonical prompt self-sufficient and understandable
2. keep `README.md` aligned with the prompt-first truth
3. keep prompt-layer docs aligned with the same adoption story
4. keep historical installer docs clearly demoted instead of silently pretending they are still primary
5. decide later whether the prompt-first pivot becomes a new public release tag

## Release Contract

- the prompt must tell target Codex instances to inspect local reality first
- the prompt must support selective adoption instead of fixed-package assumptions
- the prompt must leave durable local structure behind
- the prompt must include conflict handling and post-change acceptance
- public wording must not mislead readers into thinking install scripts are still the default path

## Historical Snapshot

The earlier public-beta pack at `releases/project-first-beta-20260415/` remains in the repo as history only.
The earlier `v1.0.0` and `v1.0.1` releases also remain as install-first historical snapshots.
