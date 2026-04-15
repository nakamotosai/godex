# Publish

This document tracks how `godex` moves from foundation to public release.

## Current Publish State

- public GitHub repository exists: `https://github.com/nakamotosai/godex`
- default branch: `main`
- foundation commit is already pushed
- repository is in product-foundation stage, not release stage

## Release Sequence

1. finish the product foundation and keep README aligned with reality
2. ship a real project-install path
3. ship doctor
4. ship benchmark tasks and scoring
5. run at least one dogfood loop
6. document current boundaries honestly
7. choose OSS license
8. tag the first public release

## Hard Release Blockers

- no working installer
- no doctor
- no benchmark
- no dogfood evidence
- no license decision from the maintainer

## Publish Rule

Do not market `godex` as a finished upgrade product while the repo still lacks install proof.

It is acceptable to present it publicly today as:

- an open-source product foundation
- a serious design and bootstrap draft
- an actively built Codex upgrade kit

It is not acceptable to present it today as:

- finished
- fully installable
- benchmark-proven
