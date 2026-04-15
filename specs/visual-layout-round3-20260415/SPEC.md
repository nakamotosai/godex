# Visual Layout + Benchmark Round 3 Spec

## Goal

Remove the next obvious shortboard after round 2:

1. closeouts still become ugly when many files, commands, or artifact paths must be mentioned

Then prove the new defaults with a third benchmark round that includes a visual-layout stress task.

## Scope

- tighten the current local Codex instruction layers against path walls, command walls, and artifact walls
- package the same rules into `godex` repo and bootstrap surfaces
- add a benchmark task that stresses visual layout under many file references and checks
- run benchmark round 3 against vanilla Codex and the current dogfood stack
- write the round-3 result into the repo and sync README truth

## Non-Goals

- inventing a new scoring dimension
- forcing one rigid template on every reply
- hiding changed files or verification entirely

## Constraints

- keep first-reply mirroring
- keep full-objective retention
- keep verification-before-done
- changed files must remain visible when the user needs them, but visually cleaner

## Acceptance

1. Local runtime rules explicitly ban path walls, command walls, and artifact walls in ordinary closeouts.
2. File-reference guidance now prefers short visible labels with absolute targets.
3. A round-3 benchmark task exists to stress visual layout under many changed files and checks.
4. Round 3 is run with actual captured evidence.
5. `godex` README reflects the new round and the repo closes cleanly.
