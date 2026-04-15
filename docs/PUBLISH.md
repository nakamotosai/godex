# Publish

This document tracks how `godex` moves from foundation to public release.

## Current Publish State

- public GitHub repository exists: `https://github.com/nakamotosai/godex`
- default branch: `main`
- repository is now in public beta stage, not `v1`
- release assets now live under `releases/project-first-beta-20260415/`

## Current Beta Pack

- release pack: `releases/project-first-beta-20260415/`
- release notes: `releases/project-first-beta-20260415/RELEASE_NOTES.md`
- GitHub release body: `releases/project-first-beta-20260415/GITHUB_RELEASE_BODY.md`
- short public announcement: `releases/project-first-beta-20260415/X_ANNOUNCEMENT.md`
- checklist: `releases/project-first-beta-20260415/CHECKLIST.md`

## Release Sequence

1. keep project install and global install working
2. keep install proof current on isolated targets
3. keep README and release assets aligned with reality
4. gather broader outside-user validation
5. improve complex-policy conflict handling
6. tag the first public `v1` release

## Hard `v1` Blockers

- no broad outside-user validation yet
- complex existing global policies still require manual review
- the first public release tag flow has not been exercised yet

## Publish Rule

It is acceptable to present `godex` publicly today as:

- a real public beta
- an open-source Codex upgrade kit with project and global install
- a product with install proof, doctor, restore, and release assets

It is not acceptable to present it today as:

- finished `v1`
- universal merge with arbitrary existing global policies
- broadly community-validated
