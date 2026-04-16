# prompts

This directory is now the primary product layer for `godex`.

The main artifact is a pure-text methodology prompt that tells another Codex how to inspect its own local setup, adapt selectively, and leave behind durable local rules instead of depending on a fixed package install.

## Canonical Artifact

- [`GODEX_METHOD_PROMPT.md`](GODEX_METHOD_PROMPT.md): the prompt-first product entry

## Supporting Artifacts

- [`bootstrap/GODEX_BOOTSTRAP.md`](bootstrap/GODEX_BOOTSTRAP.md): compatibility alias from the old naming
- [`bootstrap/README.md`](bootstrap/README.md): why that alias still exists
- [`upgrade/README.md`](upgrade/README.md): planned follow-on prompts after the first local adaptation

## Design Rules

- The prompt must start from local reality, not generic package-install assumptions.
- The prompt must help the target Codex keep existing strengths and fill only real gaps.
- The prompt must tell the target Codex where durable behavior should live: `AGENTS.md`, skills, workflow docs, templates, or memory surfaces.
- The prompt must not force a duplicate spec system, duplicate skills, or giant context baggage.
- The prompt must end with local conflict acceptance and real verification.

## Current Status

- canonical methodology prompt: ready
- compatibility alias: retained
- follow-on upgrade prompt pack: not written yet
