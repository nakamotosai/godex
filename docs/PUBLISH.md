# Publish

This document tracks how `godex` moves from foundation to public release.

## Current Publish State

- public GitHub repository exists: `https://github.com/nakamotosai/godex`
- default branch: `main`
- foundation and dogfood commits are already pushed
- repository is now in project-first beta stage, not `v1`

## Release Sequence

1. keep the project-install beta path working and README-aligned
2. gather broader install proof beyond maintainer-only loops
3. tighten the remaining review-output density weakness
4. prepare release assets
5. decide whether `v1` needs global install or another second install surface
6. tag the first public release

## Hard `v1` Blockers

- no second install surface beyond project install beta
- no broader external install proof yet
- no release assets yet
- review-style long findings are still denser than the product target

## Publish Rule

Do not market `godex` as a finished upgrade product while the repo still lacks `v1` proof.

It is acceptable to present it publicly today as:

- a real project-first beta
- an open-source Codex upgrade kit with one working install mode
- an actively iterated product with honest boundaries

It is not acceptable to present it today as:

- finished `v1`
- universal install
- fully solved on every output-formatting edge case
