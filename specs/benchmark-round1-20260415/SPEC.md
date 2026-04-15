# Benchmark Round 1 Spec

## Goal

Run the first real side-by-side benchmark between:

1. vanilla Codex
2. the current `godex` dogfood setup

The result must be based on actual runs against the same task set, not opinion.

## Scope

- use the existing five benchmark tasks under `benchmarks/tasks/`
- isolate a real vanilla runtime with a clean `CODEX_HOME`
- use the current reinforced local Codex stack as the dogfood comparator
- materialize disposable benchmark repositories for repeatable runs
- capture run evidence
- score the round with the existing rubric
- write the round result back into the `godex` repository

## Non-Goals

- full benchmark automation
- public release hardening
- changing the scoring rubric itself
- claiming statistically strong conclusions from one round

## Constraints

- first round should stay human-reviewable
- comparator difference should primarily be instruction / skill / workflow surface, not a different task set
- use the same model and provider path when practical
- benchmark repositories must not silently inherit custom task instructions through local `AGENTS.md`

## Acceptance

1. A clean vanilla comparator is proven with real `CODEX_HOME` isolation.
2. The same five benchmark prompts are run against both sides.
3. Raw run evidence is captured locally for review.
4. A scored benchmark report is written under `benchmarks/runs/`.
5. The product docs reflect that the first real benchmark round has been executed.
