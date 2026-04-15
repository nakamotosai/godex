# skills

This directory will hold the durable workflow layer for `godex`.

The skill pack should move long behavior logic out of giant root instructions and into reusable, narrow modules.

## Planned Skill Families

- `godex-intake`: force a brief, high-signal mirror of the user's request before execution
- `godex-spec-loop`: hold goal, scope, constraints, and acceptance as the active control plane
- `godex-verification`: enforce evidence before completion
- `godex-output`: shape closeouts by scenario and keep them low-noise
- `godex-memory`: capture repeated user corrections and anti-patterns
- `godex-doctor`: inspect installation state and drift
- `godex-benchmark`: run or guide before/after proof tasks

## Boundary Rules

- each skill should have one clear job
- avoid duplicating the same rule in multiple skills
- prefer composition over one monolithic "godex-everything" skill

## Current Status

- taxonomy defined
- individual skill files not shipped yet
