# Global Install Beta Example

This example pack shows what the global `godex` layer is supposed to change across ordinary Codex sessions.

## Before

Without a durable global layer, a user often gets:

- a first reply that jumps into action without mirroring the task
- closeouts that drift back toward path walls or command walls
- review findings that still feel cramped when they become paragraph-length

## After

With global install beta:

- the Codex home has a managed `godex` global block in `AGENTS.md`
- `godex/manifest.json` records the installed layer
- `godex/bin/godex-doctor` can assess the global install state
- `godex/bin/godex-benchmark` points to the quick proof loop

## Why This Matters

The user gets a stronger default before any repo-local install exists.

That means cleaner intake, stronger closure, and better review readability even in plain sessions.

## Included Example

- `review-layout-example.md`: shows the intended treatment of long review findings
