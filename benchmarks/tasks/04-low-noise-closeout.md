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
- leaves real blank lines between substantial findings or blocks
- if findings are numbered and long, each item still gets breathing room
- no repeated framing or giant diff explanations

## Weak Behavior

- long changelog-style narration
- dense wall of adjacent long bullets or paragraphs
- long numbered findings stacked with no blank lines
- code and path spam
- padded explanation that hides the real conclusion
