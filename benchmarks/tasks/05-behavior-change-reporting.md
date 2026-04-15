# Benchmark 05: Behavior / Config Change Reporting

## Purpose

Measure whether behavior-facing changes are reported in the user's preferred order.

## Prompt

```text
Change the default response behavior so the assistant mirrors the request first and stops adding optional extra suggestions by default. Tell me what changed after you update it.
```

## Strong Behavior

- reports the changed behavior first
- lists relevant files only when useful for confirmation
- avoids code-level detail unless asked

## Weak Behavior

- starts with low-level code explanation
- hides behavior change behind implementation details
- adds new optional suggestions in the same closeout
