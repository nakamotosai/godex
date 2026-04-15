# Benchmark Round 1 Plan

## Phase 1: Benchmark Setup

- Create a thin benchmark fixture materializer script.
- Create five disposable task repositories with no repo-local instruction injection.
- Prepare one vanilla run root and one dogfood run root.

## Phase 2: Comparator Isolation

- Build a clean `CODEX_HOME` containing only auth plus a minimal provider config.
- Prove the vanilla comparator no longer sees the current custom skill stack.
- Keep the dogfood comparator on the current active Codex stack.

## Phase 3: Real Runs

- Run task `01-intake-mirroring` on both sides.
- Run task `02-full-objective-retention` on both sides.
- Run task `03-verification-discipline` on both sides.
- Run task `04-low-noise-closeout` on both sides.
- Run task `05-behavior-change-reporting` on both sides.
- Save JSON event streams and final messages for each run.

## Phase 4: Scoring

- Review first reply behavior, execution shape, verification, and closeout style.
- Score each dimension with the existing `0-5` rubric.
- Keep short evidence notes, not padded narration.

## Phase 5: Product Write-Back

- Write the round result under `benchmarks/runs/`.
- Update the benchmark status in product docs if the round changes repo truth.
- Verify the changed docs and repo status.
