# Install Proof Run

## Context

- Date: 2026-04-15
- Scope: isolated clean-surface proof for project install and global install
- Script: `benchmarks/scripts/verify_install_surfaces.sh`
- Goal: prove install behavior beyond the maintainer's active `/home/ubuntu/codex` dogfood workspace

## Covered Surfaces

### Project Install

- clean repo with no `AGENTS.md`
- repo with a simple existing `AGENTS.md`
- reinstall path
- restore path
- doctor states: `missing`, `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`

### Global Install

- clean Codex-home target with no `AGENTS.md`
- Codex-home target with a simple existing `AGENTS.md`
- reinstall path
- restore path
- doctor states: `missing`, `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`

## Result

The current clean-surface proof passed for both install types.

What this proves:

- install works on isolated targets outside the maintainer workspace
- backup and restore are not just documented; they execute successfully
- doctor state classification works across expected failure modes
- the shipped benchmark entrypoints are present and runnable

## Boundary

This is broader than maintainer-only dogfood, but it is still maintainer-run proof on isolated local targets.

It is not the same as broad community validation.
