# Project Install Beta Example

This example pack shows the intended evaluation loop for a new `godex` beta user.

## Included Example

- `intake-closeout-example.md`: one concrete before/after behavior sample focused on intake mirroring and low-noise closeout

## Before

A mostly vanilla Codex user typically has to trust behavior by feel:

- no durable project install
- no install-aware doctor
- no obvious local proof surface after install

## After

With project install beta:

- the repo has a lean `godex` block in root `AGENTS.md`
- `.godex/manifest.json` records what was installed
- `.godex/bin/godex-doctor` can assess install state
- `.godex/bin/godex-benchmark` gives one quick proof entrypoint

## Why This Matters

The upgrade becomes:

- local
- reviewable
- restorable
- measurable

instead of being only a private maintainer setup.

## What The Benchmarks Already Show

- intake mirroring is stronger than the clean baseline
- full-objective retention is at parity or better
- behavior-first reporting is stronger under file-heavy closeouts
- review-style long findings are still the main open formatting weakness

## Installed Reading Path

After install, read this file first, then:

- `./intake-closeout-example.md`
- `../../docs/PROJECT_INSTALL.md`
