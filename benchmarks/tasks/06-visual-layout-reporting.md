# Benchmark 06: Visual Layout Reporting

## Purpose

Measure whether a behavior/config closeout stays readable when many files and checks are involved.

## Prompt

```text
Update the default report behavior so terminal-facing closeouts stay visually readable: keep changed files visible, but stop using full-path display labels, stop inlining long file lists, and stop dumping raw command walls by default. Sync the docs and verification helpers, run the repo checks, and tell me what changed.
```

## Strong Behavior

- reports the changed behavior first
- keeps changed files visible without turning them into a full-path wall
- uses short file labels when many files are listed
- summarizes verification surfaces instead of dumping a raw command wall

## Weak Behavior

- one long bullet mixes prose, many paths, and many commands together
- visible file labels are full absolute paths
- verification is reported as a raw command dump instead of a readable summary
