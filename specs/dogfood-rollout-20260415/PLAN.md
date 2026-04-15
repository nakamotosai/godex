# godex Dogfood-First Rollout Implementation Plan

> **For agentic workers:** In Codex, use `superpowers:executing-plans` by default. Use `superpowers:subagent-driven-development` only when independent lanes exist and the user explicitly allows delegation or parallel agent work. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `godex` into a dogfood-first product by adding an active rollout spec, first doctor and benchmark assets, and a real lightweight install into the current Codex workspace.

**Architecture:** Reuse what already works in the current Codex stack instead of layering duplicates. `godex` adds routing and trust surfaces, not a second spec system, not a second mistakebook, and not a heavy multi-agent wrapper. Public product docs and local dogfood rollout advance together.

**Tech Stack:** Markdown docs, shell doctor script, repo-backed skill files, benchmark task files, current workspace `AGENTS.md` integration.

---

### Task 1: Write The Active Dogfood Spec

**Files:**
- Create: `specs/dogfood-rollout-20260415/SPEC.md`
- Create: `specs/dogfood-rollout-20260415/PLAN.md`
- Modify: `README.md`

- [x] Write a new active spec that reflects the latest design decisions
- [x] Explicitly mark what `godex` should reuse versus what it should newly add
- [x] Rewrite README current state so the dogfood rollout becomes visible

**Verify**
- Run: `rg -n "dogfood|doctor|benchmark|spec escalation" README.md specs/dogfood-rollout-20260415`
- Expected: the active direction is visible in both README and the new spec

### Task 2: Add Dogfood Support Docs

**Files:**
- Create: `docs/DOGFOOD.md`
- Create: `docs/DOCTOR.md`

- [x] Document what the current local dogfood lane installs
- [x] Document what remains intentionally reused from the current Codex stack
- [x] Document how `godex doctor` should be used and interpreted

**Exit Gate**
- A maintainer can read the docs and know:
  - what changed
  - what did not change
  - how to verify the current local rollout

### Task 3: Add First Doctor Surface

**Files:**
- Create: `installers/godex-doctor.sh`
- Modify: `installers/README.md`

- [x] Implement a first doctor script for repo and local workspace checks
- [x] Keep the first doctor lightweight and honest
- [x] Verify it reports missing, partial, or healthy states without pretending to be a full installer

**Verify**
- Run: `bash installers/godex-doctor.sh /home/ubuntu/codex`
- Expected:
  - repo assets checked
  - workspace install checked
  - benchmark readiness checked
  - overall status emitted

### Task 4: Add First Benchmark Surface

**Files:**
- Create: `benchmarks/scoring-rubric.md`
- Create: `benchmarks/tasks/01-intake-mirroring.md`
- Create: `benchmarks/tasks/02-full-objective-retention.md`
- Create: `benchmarks/tasks/03-verification-discipline.md`
- Create: `benchmarks/tasks/04-low-noise-closeout.md`
- Create: `benchmarks/tasks/05-behavior-change-reporting.md`
- Create: `benchmarks/run-template.md`
- Modify: `benchmarks/README.md`

- [x] Write the first 5 benchmark tasks
- [x] Write the human-reviewable scoring rubric
- [x] Add a run template so before/after trials are easy to record

**Exit Gate**
- A human can run vanilla vs `godex` comparisons with no hidden private context

### Task 5: Package Repo-Backed Dogfood Skills

**Files:**
- Create: `skills/godex-dogfood-router/SKILL.md`
- Create: `skills/godex-doctor/SKILL.md`
- Create: `skills/godex-benchmark/SKILL.md`
- Modify: `skills/README.md`

- [x] Add a narrow dogfood router skill
- [x] Add a doctor skill that points at the repo-local doctor
- [x] Add a benchmark skill that points at the repo-local benchmark assets

**Exit Gate**
- The skill layer exposes dogfood utilities without duplicating the existing stack

### Task 6: Install Godex Into The Current Codex Workspace

**Files:**
- Modify: `/home/ubuntu/codex/AGENTS.md`

- [x] Add a thin `godex dogfood` policy block to the current workspace
- [x] Keep the install lightweight
- [x] Explicitly preserve:
  - current mistakebook system
  - current frontend acceptance gate
  - native multi-agent preference
  - spec escalation rather than blanket spec

**Verify**
- Run: `rg -n "Godex Dogfood|native multi-agent|spec escalation|frontend-acceptance-gate" /home/ubuntu/codex/AGENTS.md`
- Expected: the current workspace is visibly wired for dogfood

### Task 7: Register Repo-Backed Skills In Current Codex CLI

**Files:**
- Symlink or expose:
  - `/home/ubuntu/.codex/skills/godex-dogfood-router`
  - `/home/ubuntu/.codex/skills/godex-doctor`
  - `/home/ubuntu/.codex/skills/godex-benchmark`

- [x] Expose the new `godex` skills to future Codex sessions
- [x] Keep the source of truth in the `godex` repo rather than forking copies

**Verify**
- Run: `ls -ld /home/ubuntu/.codex/skills/godex-*`
- Expected: symlinks or installed directories point back to the `godex` repo

### Task 8: Verify, Commit, Push

**Files:**
- Modify: `README.md`
- Modify: any touched support docs

- [x] Run the first local doctor
- [x] Scan for unresolved draft markers in the newly touched `godex` files
- [x] Commit the `godex` repo changes
- [x] Push to `origin/main`

**Verify**
- Run:
  - `bash installers/godex-doctor.sh /home/ubuntu/codex`
  - `git status --short`
  - `git log --oneline --decorate -n 2`
- Expected:
  - doctor reports at least `healthy` or clearly scoped `partial`
  - repo clean after push

## Current Scope Decision

This plan intentionally does **not** include:

- universal global installer work
- a new memory engine
- browser QA platform work
- external multi-agent orchestration

If dogfood proves those are needed, they can be added in a later round.
