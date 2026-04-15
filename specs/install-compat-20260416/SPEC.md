# Install Compatibility Spec

## Goal

Fix the false-positive `manual_review` path in `godex` install preflight so ordinary existing `AGENTS.md` files can be installed into directly.

This round succeeds when a stranger with a normal, structured `AGENTS.md` can run:

1. `--dry-run`
2. install
3. doctor

without being blocked just because the file has headings, numbering, or explanatory prose.

## Problem

Current preflight uses a layout-based "complexity" heuristic.

That heuristic treats normal structured markdown as unsafe:

- more than 12 non-empty lines
- multiple headings
- numbered lists
- multiple prose lines

As a result, `godex` often stops at `manual_review` even when the existing file is perfectly suitable for safe additive install.

## Product Decision

`manual_review` should no longer mean "this file is written clearly".

For this patch, `manual_review` should mean one of two things only:

1. the target `AGENTS.md` explicitly blocks automatic append
2. the existing `godex` markers are conflicted or unusable

Normal structured markdown is compatible by default.

## Scope

- redesign `agents_preflight.py` classification logic
- keep install behavior additive and backup-first
- update install proof to cover the new compatibility rule
- update user-facing docs and README wording to match the new install truth

## Non-Goals

- semantic conflict resolution between arbitrary rule stacks
- automatic merging of user text into the `godex` block
- changing the installed `godex` policy block itself

## Constraints

- no silent overwrite of existing `AGENTS.md`
- backup before mutation
- existing managed `godex` block replacement must still work
- dry-run remains non-mutating
- project and global install must stay aligned

## Acceptance

1. A structured existing `AGENTS.md` with headings, numbered lists, and prose now classifies as `ready_append`.
2. An existing `AGENTS.md` that explicitly opts out of automatic append still classifies as `manual_review`.
3. Project install proof covers both cases.
4. Global install proof covers both cases.
5. README and install docs no longer claim that generic "complex" markdown automatically requires manual review.
6. Repo doctor and install proof pass after the change.
