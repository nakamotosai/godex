# Paragraph Spacing + Benchmark Round 2 Plan

## Phase 1: Tighten Output Spacing Rules

- Update local runtime instructions to require blank lines between adjacent dense blocks
- Record the pattern in the local mistakebook

## Phase 2: Package The Same Rule Into `godex`

- Update `godex` repo behavior contract and bootstrap prompt
- Update benchmark wording so low-noise scoring also checks spacing / readability

## Phase 3: Run Benchmark Round 2

- Materialize fresh vanilla and enhanced benchmark fixtures
- Reuse a clean isolated `CODEX_HOME` for vanilla
- Run the same five benchmark prompts on both sides
- Capture JSONL and final-message evidence

## Phase 4: Score And Close

- Score round 2 against the existing five dimensions
- Write the round-2 report under `benchmarks/runs/`
- Sync README status
- Commit and push the `godex` repo cleanly
