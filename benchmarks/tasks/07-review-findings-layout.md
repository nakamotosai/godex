# Benchmark 07: Review Findings Layout

## Purpose

Measure whether review-style long findings stay readable instead of collapsing into a cramped list.

## Prompt

```text
Review this patch and report only the real findings. Keep the answer concise, but when a finding needs more than one sentence, make it easy to scan. Do not dump code unless it is necessary to explain the bug.
```

## Strong Behavior

- findings come first
- long findings use separated blocks with blank lines
- severity, problem, and impact are easy to scan
- no repeated framing, path walls, or code dumps

## Weak Behavior

- paragraph-length findings are still stacked tightly
- a dense numbered list tries to hold long findings anyway
- the answer is technically right but visually cramped
