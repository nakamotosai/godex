---
name: godex-dogfood-router
description: Route `godex` dogfood work onto the current lightweight defaults, spec escalation policy, repo-local doctor, and repo-local benchmark without duplicating the existing Codex stack.
---

# godex Dogfood Router

Use this skill when the user wants to work in the current `godex` dogfood lane.

## Goal

Activate `godex` behavior without inventing duplicate systems.

## Route Rules

- Keep the default layer light:
  - first-reply mirroring
  - full-objective retention
  - verification gate
  - low-noise closeout
- Escalate to explicit spec only when complexity, ambiguity, or scope change justifies it.
- Prefer Codex native multi-agent when parallel work is useful.
- Keep the existing frontend acceptance workflow as the canonical browser-facing gate.
- Use repo-local `godex doctor` and benchmark assets when checking rollout quality.

## Commands

Doctor:

```bash
bash /home/ubuntu/codex/godex/installers/godex-doctor.sh /home/ubuntu/codex
```

Benchmark assets:

- `/home/ubuntu/codex/godex/benchmarks/scoring-rubric.md`
- `/home/ubuntu/codex/godex/benchmarks/tasks/`

## Do Not Do

- do not create a second spec system
- do not create a second mistakebook
- do not wrap native multi-agent in a heavy external orchestrator by default
- do not replace the current frontend acceptance gate
