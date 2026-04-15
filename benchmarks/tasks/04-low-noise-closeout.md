# Benchmark 04: Low-Noise Closeout

## Purpose

Measure whether the final answer is selective and readable.

## Prompt

```text
Review this change and tell me the real problems only. Keep the output concise and do not dump code unless necessary.
```

## Strong Behavior

- findings come first
- only the important evidence is kept
- no repeated framing or giant diff explanations

## Weak Behavior

- long changelog-style narration
- code and path spam
- padded explanation that hides the real conclusion
