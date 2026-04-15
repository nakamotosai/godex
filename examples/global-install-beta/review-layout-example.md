# Review Layout Example

## Bad Pattern

Three long findings are stacked in one tight numbered list with no blank lines, repeated framing, and too much file detail inline.

That shape is hard to scan even when the findings themselves are correct.

## Intended `godex` Pattern

Each real finding gets its own visible block.

Severity, problem, and impact should be easy to pick out without parsing a dense wall.

If the finding becomes paragraph-length, it should stop pretending to be a compact list item.

## Why This Matters

Review output should help the user find the real problems faster.

Compact does not mean cramped.
