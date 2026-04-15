# Dogfood

This document defines how `godex` should be used on the maintainer's own Codex stack before broader rollout.

## Dogfood Rule

`godex` should first prove itself in the maintainer's real daily Codex workflow.

Only after repeated real use should new default surfaces be promoted into the public product.

## What The Current Dogfood Install Adds

- a thin `godex dogfood` policy block in the current workspace
- a repo-local `godex doctor`
- a repo-local benchmark task set
- repo-backed `godex` utility skills for future Codex sessions

## What The Current Dogfood Install Intentionally Reuses

These existing systems are already good and should stay canonical:

- the current spec-driven workflow
- the current mistakebook
- Codex native multi-agent plus the existing lightweight guidance around it
- the current frontend acceptance gate

`godex` should package these better over time.

It should not fork them now.

## Dogfood Defaults

### 1. Light First

Simple tasks should stay in light mode:

- first-reply mirroring
- keep the full objective intact
- verify before claiming done
- keep the closeout low-noise
- leave real blank lines between dense output blocks
- long numbered findings also count as dense blocks and must be separated
- suppress irrelevant workflow narration
- keep behavior/config reporting behavior-first and file-light

### 2. Escalate Spec Only When Needed

Use explicit `SPEC.md + PLAN.md` when:

- complexity is medium or higher
- scope changed
- the task is ambiguous
- the user explicitly wants spec-driven execution

Do not escalate just because a clear local config/doc/rule change touches a few files.

### 3. Native Multi-Agent Only

When parallelism is needed, prefer Codex native multi-agent.

Do not add an external orchestration shell around it by default.

### 4. Frontend Acceptance Stays Canonical

For browser-facing work, the existing frontend acceptance workflow remains the truth source.

Browser automation may support it later, but does not replace it.

## How To Check Current Dogfood State

Run:

```bash
bash /home/ubuntu/codex/godex/installers/godex-doctor.sh /home/ubuntu/codex
```

Review:

- repo asset health
- benchmark asset health
- current workspace dogfood install health

## How To Use The Benchmark

Read:

- [`benchmarks/scoring-rubric.md`](../benchmarks/scoring-rubric.md)
- [`benchmarks/tasks/`](../benchmarks/tasks/)

Run the same benchmark tasks against:

1. vanilla or lightly customized Codex
2. the current `godex` dogfood setup

Record the result with:

- [`benchmarks/run-template.md`](../benchmarks/run-template.md)
- latest real result: [`benchmarks/runs/2026-04-15-round1.md`](../benchmarks/runs/2026-04-15-round1.md)

## Current Boundary

This is still a maintainer dogfood lane, not yet a general public install experience.

The first real benchmark round now exists, and it exposed the split clearly:

- `godex` is stronger on intake mirroring and full-objective retention
- round 1 showed too much closeout noise and too much behavior/config detail

The current tightening pass now updates three defaults:

- less user-visible workflow/process narration
- more compact behavior-first closeouts
- stricter spec escalation on medium-light tasks

The second benchmark round now exists.

It shows two things clearly:

- ordinary closeout noise and behavior/config reporting improved
- review-style long findings still stack too densely

So the remaining dogfood gap is no longer “general closeout noise”.

It is specifically review-output spacing under dense findings.
