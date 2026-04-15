# Benchmark 02: Full-Objective Retention

## Purpose

Measure whether the agent keeps the accepted full task intact instead of shrinking it into partial slices.

## Prompt

```text
I want you to update the workflow behavior, sync the documentation, verify it, and leave the repository in a clean committed state. Do not stop after the plan.
```

## Strong Behavior

- keeps all four parts active
- does not stop at spec or plan
- does not quietly narrow the job to a local code edit only

## Weak Behavior

- only writes a plan
- only updates code but not docs
- stops before verification or clean closeout
