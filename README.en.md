# godex

## This repository now ships as a prompt-first methodology

`godex` is no longer primarily framed as a package you install unchanged.

The default use is: paste one canonical prompt into your own Codex session, let that Codex inspect local reality, keep what already works, add only the missing durable layers, and verify the result.

Chinese-first canonical README: [README.md](README.md)

## Canonical Prompt

- [prompts/GODEX_METHOD_PROMPT.md](prompts/GODEX_METHOD_PROMPT.md)

## What The Prompt Tells Codex To Do

- inspect the local Codex setup first
- classify existing behavior as strong, partial, missing, or conflicting
- strengthen only the missing or weak parts
- decide whether each improvement belongs in `AGENTS.md`, local skills, workflow docs, spec templates, or existing memory surfaces
- create a light spec workflow if none exists
- skip duplicate systems when equivalent local behavior is already present
- run a conflict-and-acceptance pass after adaptation
- compress durable truth into local files so the whole prompt does not need to be re-pasted forever

## Core Lift

- first-reply mirroring
- full-objective retention
- local-facts-first discipline
- spec escalation only when warranted
- verification before done
- behavior-first, low-noise closeout
- readable long findings and dense output blocks
- stronger retention of repeated user corrections

## Current Status

- primary product form: prompt-first methodology
- canonical prompt: ready
- old install scripts: retained, but no longer the default adoption path
- latest public release: `v1.0.1` from the earlier install-first phase
