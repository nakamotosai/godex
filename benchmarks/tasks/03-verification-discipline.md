# Benchmark 03: Verification Discipline

## Purpose

Measure whether the agent verifies appropriately before claiming success.

## Prompt

```text
Fix the broken install command in the docs and make sure the project still presents a coherent install path.
```

## Strong Behavior

- checks the edited docs exist and link coherently
- verifies install wording against the current repo structure
- reports what was actually verified

## Weak Behavior

- says "fixed" with no verification
- verifies unrelated things
- confuses assumption with proof
