---
name: godex-benchmark
description: Run or guide the first manual `godex` benchmark using fixed task prompts and the scoring rubric.
---

# godex Benchmark

Use this skill when comparing vanilla Codex and the current `godex` dogfood setup.

## Inputs

- benchmark task files under `/home/ubuntu/codex/godex/benchmarks/tasks/`
- scoring rubric at `/home/ubuntu/codex/godex/benchmarks/scoring-rubric.md`
- run template at `/home/ubuntu/codex/godex/benchmarks/run-template.md`

## Method

1. pick one or more benchmark tasks
2. run them against the comparison target
3. run them against the current `godex` dogfood setup
4. score each dimension
5. summarize what should be kept or changed

## Constraint

Do not over-automate the first benchmark round.

Human-readable evidence is preferred over fragile fake precision.
