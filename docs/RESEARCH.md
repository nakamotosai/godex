# godex Research Notes

This file records the foundation-round external references that shaped the first product design.

## Official Context

### OpenAI Codex

High-level product signal from official Codex guidance:

- repository guidance matters
- environment setup matters
- testing matters
- agent performance improves when local operating context is explicit

This supports the core `godex` thesis:

the quality gap between vanilla Codex and reinforced Codex is often a workflow gap, not just a model gap.

## Similar Product Signals

### `obra/superpowers`

Observed strengths:

- composable skill architecture
- strong workflow framing
- clear install value proposition
- serious documentation and distribution mindset

Implications for `godex`:

- `godex` should be modular, not monolithic
- installation and activation must be a product surface
- users need to feel the upgrade as workflow change, not just read about it

### `cat9999aaa/dev-planner-skill`

Observed strengths:

- prompt/skill-first packaging
- novice-friendly wording
- low-code distribution style
- strong emphasis on “AI as process layer”

Implications for `godex`:

- prompt-only entry is a valid acquisition surface
- product language should be understandable to non-experts
- documentation can itself be a powerful product component

## Product Decision Taken

Based on these inputs, `godex` is intentionally designed as:

- hybrid, not prompt-only
- Codex-native first
- benchmark-driven
- installable and verifiable

That is the main product bet for the foundation round.
