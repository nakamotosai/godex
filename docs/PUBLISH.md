# Publish

This document tracks how `godex` moves from foundation to public release.

## Current Publish State

- public GitHub repository exists: `https://github.com/nakamotosai/godex`
- default branch: `main`
- current release target: `v1.0.0`
- current release assets live under `releases/v1.0.0/`

## Current Release Pack

- release pack: `releases/v1.0.0/`
- release notes: `releases/v1.0.0/RELEASE_NOTES.md`
- GitHub release body: `releases/v1.0.0/GITHUB_RELEASE_BODY.md`
- short public announcement: `releases/v1.0.0/X_ANNOUNCEMENT.md`
- checklist: `releases/v1.0.0/CHECKLIST.md`

## Release Sequence

1. keep project install and global install working
2. keep repo doctor and install proof passing
3. keep README and release assets aligned with reality
4. keep broader validation record current
5. create annotated tag `v1.0.0`
6. publish the GitHub release from `releases/v1.0.0/GITHUB_RELEASE_BODY.md`

## Release Contract

- `v1.0.0` is allowed to be honest and lean
- safe install is more important than clever auto-merge
- complex existing `AGENTS.md` stacks may stop at `manual_review`
- support target stays Codex CLI on Unix-like shells

## Historical Snapshot

The earlier public-beta pack at `releases/project-first-beta-20260415/` remains in the repo as history only.
