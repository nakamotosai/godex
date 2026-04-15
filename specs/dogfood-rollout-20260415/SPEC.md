# godex Dogfood-First Rollout Spec

> Current status truth lives in the repository root [`README.md`](../../README.md). This spec is the active product and local rollout contract after the foundation round.

## Goal

Turn `godex` from a product foundation into a dogfood-first system with two linked outcomes:

1. `godex` becomes a clearer open-source product with a real near-term rollout path.
2. the current Codex CLI workspace at `/home/ubuntu/codex` gets the minimum `godex` capabilities needed for daily real use.

The point is not to invent a second system.

The point is to productize the strongest parts of the current one, install the missing pieces locally, and learn from real use before broad public rollout.

## Product Direction

`godex` should now be built around a simple rule:

**Dogfood before expansion.**

Anything not worth installing into the maintainer's own Codex flow should not become a default `godex` surface.

## What Already Exists And Must Be Reused

The current Codex setup already has strong working assets:

- spec-driven execution
- mistakebook / durable anti-pattern memory
- native or skill-guided multi-agent execution
- frontend acceptance workflow
- low-noise output shaping

`godex` must not duplicate these into parallel systems.

It should wrap, route, and package them more cleanly.

## What `godex` Should Add Now

After the latest design review, only four additions are justified in this round:

### 1. Dogfood-Ready Product Spec

`godex` needs a new active spec that reflects real decisions already made:

- spec should be escalation-based, not always-on
- mistakebook should stay one system, not two
- native multi-agent should be preferred over external orchestration
- frontend acceptance should stay the canonical browser-facing gate
- doctor and benchmark should be the new product-defining trust surfaces

### 2. Spec Escalation Policy

`godex` should not force every task into the full spec workflow.

It should define two levels:

- **light default mode**
  - first-reply mirroring
  - full-objective retention
  - verification gate
  - low-noise closeout
- **escalated spec mode**
  - task-scoped `SPEC.md` + `PLAN.md`
  - used for medium-or-higher complexity, scope change, ambiguity, or explicit user request

This is not a new spec system.

It is a cleaner product packaging of the current spec system.

### 3. Product Doctor

`godex` now needs a product-level doctor distinct from the existing local Codex CLI doctor.

`godex doctor` should answer:

1. is the repo surface complete enough for dogfood
2. is the current local dogfood target installed
3. are benchmark assets present
4. is the local workspace configured according to current dogfood policy
5. what is missing or drifted

This round only needs a first doctor surface, not a final universal installer.

### 4. Product Benchmark

`godex` now needs a benchmark that proves behavioral change rather than just describing it.

The first benchmark should be manual or semi-manual, not over-automated.

It should score at least:

1. first-reply mirroring
2. full-objective retention
3. verification discipline
4. low-noise closeout
5. behavior/config change reporting

## What `godex` Should Explicitly Not Add Now

The latest design discussion ruled out several tempting but unnecessary expansions.

### No Second Spec System

`godex` should not add a second spec workflow beside the current one.

It should only add a clearer escalation policy for when spec becomes necessary.

### No Second Mistakebook

The current `MISTAKEBOOK.md` already exists and works.

`godex` should later productize the mechanism, but not create a duplicate memory substrate now.

### No External Multi-Agent Orchestrator

`godex` should not wrap Codex native multi-agent in a heavy external coordination layer by default.

It should define a **native multi-agent policy**:

- when to use it
- default roles
- how to package context
- when not to use it

### No Separate Browser QA Workflow

The existing frontend acceptance system is already stronger than a generic "browser QA" layer.

`godex` should keep that as the canonical browser-facing acceptance gate.

If a browser automation helper is later added, it should remain an execution support surface, not a separate truth source.

## Dual-Track Architecture

This round should run on two tracks at once.

### Track A: Public Product Track

Deliverables:

- active dogfood rollout spec and plan
- dogfood documentation
- doctor contract and first script
- benchmark task set and scoring rubric
- README synced to current reality

### Track B: Maintainer Dogfood Track

Deliverables:

- the current Codex workspace at `/home/ubuntu/codex` gets a thin `godex` dogfood install
- that install should be as light as possible
- it should reuse existing local strengths instead of replacing them

The local install should add:

- a `godex dogfood` policy block in the current workspace instructions
- access to repo-local `godex doctor`
- access to repo-local `godex benchmark`
- optional repo-backed skills for future Codex sessions

## Dogfood Install Contract

For the current workspace, the install must obey these rules:

1. non-destructive
2. thin by default
3. reuse existing spec, memory, multi-agent, and frontend acceptance assets
4. only add the missing trust surfaces and routing language

The current workspace should behave as follows after install:

- simple tasks stay lightweight
- medium or changing tasks escalate into explicit spec
- Codex native multi-agent remains the preferred parallel path
- frontend acceptance remains the browser-facing truth source
- doctor and benchmark are available as explicit dogfood tools

## Repository Deliverables For This Round

This round should add:

- [`specs/dogfood-rollout-20260415/SPEC.md`](SPEC.md)
- [`specs/dogfood-rollout-20260415/PLAN.md`](PLAN.md)
- [`docs/DOGFOOD.md`](../../docs/DOGFOOD.md)
- [`docs/DOCTOR.md`](../../docs/DOCTOR.md)
- benchmark task files and scoring rubric
- first `godex doctor` script
- current workspace dogfood install changes

Optionally, this round may also add repo-backed dogfood skills if they stay narrow and useful.

## Acceptance

This round is acceptable when:

1. `godex` has a new active dogfood rollout spec and plan
2. README current status matches the new direction
3. the repo has a first usable doctor
4. the repo has a first usable benchmark task set
5. the current Codex workspace is actually wired for dogfood use
6. the local dogfood install does not duplicate existing systems
7. the repo is committed and pushed cleanly

## Current Boundary

This round does not need:

- a universal global installer
- a production-grade benchmark runner
- a full browser automation platform
- a second memory system
- an external multi-agent scheduler

Those can be judged later, after real dogfood evidence exists.
