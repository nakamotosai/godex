# prompts

This directory is the quick-paste acquisition layer for `godex`.

Its job is to give a mostly vanilla Codex user an immediate upgrade path without requiring durable installation on minute one.

## Current Artifacts

- [`bootstrap/GODEX_BOOTSTRAP.md`](bootstrap/GODEX_BOOTSTRAP.md): first draft of the session bootstrap prompt
- [`bootstrap/README.md`](bootstrap/README.md): what the bootstrap prompt is for, what it guarantees, and where it stops
- [`upgrade/README.md`](upgrade/README.md): planned migration prompts for moving from quick paste to durable install

## Design Rules

- Keep the bootstrap prompt short enough to paste into a real session without turning into prompt bloat.
- Use the prompt to create lift, not to carry the entire product forever.
- Hand users toward the durable layer instead of pretending prompt-only is the final state.
- Keep wording understandable for non-expert users.

## Current Status

- bootstrap surface: first draft exists
- upgrade prompt pack: planned, not implemented
