# benchmarks

This directory holds the proof layer for `godex`.

Its job is to make the upgrade measurable instead of purely rhetorical.

## Benchmark Dimensions

- intake fidelity: did the agent mirror the task before acting?
- scope retention: did it keep the accepted objective intact?
- verification discipline: did it prove completion?
- output clarity: did it keep the closeout readable, low-noise, and not visually cramped?
- behavior/config reporting: did it report changed behavior clearly?
- visual layout stress: can it stay readable when many files and checks must be mentioned?

## Current Proof Assets

- [`scoring-rubric.md`](scoring-rubric.md)
- [`run-template.md`](run-template.md)
- [`tasks/`](tasks)
- [`tasks/07-review-findings-layout.md`](tasks/07-review-findings-layout.md)
- [`runs/2026-04-15-round1.md`](runs/2026-04-15-round1.md)
- [`runs/2026-04-15-round2.md`](runs/2026-04-15-round2.md)
- [`runs/2026-04-15-round3.md`](runs/2026-04-15-round3.md)
- [`runs/2026-04-15-install-proof.md`](runs/2026-04-15-install-proof.md)
- [`runs/2026-04-16-v1-validation-matrix.md`](runs/2026-04-16-v1-validation-matrix.md)
- [`runs/2026-04-16-v1.0.1-patch-validation.md`](runs/2026-04-16-v1.0.1-patch-validation.md)
- [`scripts/verify_install_surfaces.sh`](scripts/verify_install_surfaces.sh)

## Benchmark Design Rules

- tasks must be reproducible
- tasks must be understandable without hidden private context
- scoring must reward behavior quality, not verbosity
- before/after comparison should be easy for maintainers to explain publicly
- install proof should run on isolated targets, not only the maintainer workspace

## Current Status

- first manual task set implemented
- scoring rubric implemented
- three baseline-vs-dogfood rounds recorded
- review-findings layout task added
- clean-surface install proof script implemented and recorded
