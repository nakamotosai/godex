# Paragraph Spacing + Benchmark Round 2 Spec

## Goal

Remove one remaining obvious readability shortboard:

1. dense paragraphs and long bullet items still get stacked without breathing room

Then prove the current tightening pass with a real second benchmark round against the same five tasks.

## Scope

- tighten the current local Codex instruction layers so dense blocks require blank lines
- package the same spacing rule into `godex` product surfaces
- update benchmark wording so readability scoring includes spacing, not just shorter wording
- run benchmark round 2 against vanilla Codex and the current dogfood stack
- write the round-2 result into the repo and sync README truth

## Non-Goals

- inventing a new benchmark dimension
- changing the five benchmark tasks
- turning `godex` into a rigid formatting bot

## Constraints

- keep first-reply mirroring
- keep full-objective retention
- keep verification-before-done
- blank-line spacing should improve readability without expanding into padded filler

## Acceptance

1. Local runtime rules explicitly require blank lines between adjacent dense paragraphs or long bullet items.
2. `godex` bootstrap, repo contract, and benchmark wording all reflect the same spacing rule.
3. Benchmark round 2 is run against the same five tasks with actual captured evidence.
4. A scored round-2 report is written under `benchmarks/runs/`.
5. `godex` README reflects the new round and repo state stays committed and clean.
