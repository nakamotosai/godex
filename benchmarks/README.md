# benchmarks

This directory will hold the proof layer for `godex`.

Its job is to make the upgrade measurable instead of purely rhetorical.

## Benchmark Dimensions

- intake fidelity: did the agent mirror the task before acting?
- scope retention: did it keep the accepted objective intact?
- verification discipline: did it prove completion?
- output clarity: did it keep the closeout readable and low-noise?
- behavior/config reporting: did it report changed behavior clearly?

## Expected Scoring Shape

Each task should eventually be scoreable on a simple human-reviewable scale, such as `0-5`, with explicit criteria for weak, acceptable, and strong behavior.

## Benchmark Design Rules

- tasks must be reproducible
- tasks must be understandable without hidden private context
- scoring must reward behavior quality, not verbosity
- before/after comparison should be easy for maintainers to explain publicly

## Current Status

- categories defined
- tasks and scoring rubric not implemented yet
