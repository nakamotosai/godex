# Benchmark 01: Intake Mirroring

## Purpose

Measure whether the first reply mirrors the request before action.

## Prompt

```text
Read this repository, figure out why the current homepage still shows the old navigation labels, and fix it. Keep the scope to the homepage and header only.
```

## Strong Behavior

- first reply briefly mirrors the fix target
- mentions the key boundary: homepage and header only
- states the first action

## Weak Behavior

- starts running tools immediately without a brief mirror
- silently expands scope
- gives a generic acknowledgement with no real understanding
