# godex Product Foundation Implementation Plan

> **For agentic workers:** In Codex, use `superpowers:executing-plans` by default. Use `superpowers:subagent-driven-development` only when independent lanes exist and the user explicitly allows delegation or parallel agent work. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `godex` into a real open-source Codex upgrade product with a clear public story, a durable behavior contract, safe install direction, and a credible path to doctor and benchmark proof.

**Architecture:** Build `godex` in layers. First make the repository itself product-grade and internally consistent. Then ship the prompt-first surface, durable install layer, doctor, benchmark, and release assets in that order. Keep README as the single current status page and use supporting docs only for depth.

**Tech Stack:** Markdown docs, Codex-compatible prompt and skill files, shell/Python installer utilities, benchmark fixtures, GitHub releases.

---

### Task 1: Foundation Truth Layer

**Files:**
- Modify: `README.md`
- Create: `AGENTS.md`
- Modify: `specs/product-foundation-20260415/SPEC.md`
- Modify: `specs/product-foundation-20260415/PLAN.md`
- Create: `docs/COMPATIBILITY.md`
- Create: `docs/ACCEPTANCE.md`
- Create: `docs/PUBLISH.md`

- [x] Rewrite the root README as a real product landing page instead of a draft memo
- [x] Add a repo-level behavior contract that preserves the strongest reinforced Codex traits
- [x] Rewrite the product spec to make compatibility, safety, output, doctor, and benchmark requirements explicit
- [x] Rewrite the plan around product phases and exit gates instead of loose topic buckets
- [x] Add compatibility, acceptance, and publish support docs

**Verify**
- Run: `rg -n "TODO|TBD" README.md AGENTS.md docs specs/product-foundation-20260415`
- Expected: no unresolved draft markers

### Task 2: Prompt-First Surface

**Files:**
- Modify: `prompts/README.md`
- Create: `prompts/bootstrap/README.md`
- Create: `prompts/bootstrap/GODEX_BOOTSTRAP.md`
- Create: `prompts/upgrade/README.md`

- [x] Define the quick-paste acquisition layer
- [x] Write the first bootstrap prompt draft
- [x] Document what the bootstrap prompt can and cannot do
- [ ] Validate the bootstrap prompt on at least one clean Codex session

**Verify**
- Check that `prompts/bootstrap/GODEX_BOOTSTRAP.md` clearly states:
  - purpose
  - required behavior changes
  - limits
  - handoff to durable install

### Task 3: Durable Skill Layer

**Files:**
- Modify: `skills/README.md`
- Future Create: `skills/godex-intake/SKILL.md`
- Future Create: `skills/godex-spec-loop/SKILL.md`
- Future Create: `skills/godex-verification/SKILL.md`
- Future Create: `skills/godex-output/SKILL.md`
- Future Create: `skills/godex-memory/SKILL.md`
- Future Create: `skills/godex-doctor/SKILL.md`
- Future Create: `skills/godex-benchmark/SKILL.md`

- [x] Define the minimal skill taxonomy
- [x] Give each planned skill family one clear purpose
- [ ] Implement the first core skill
- [ ] Verify that the skill pack can coexist with a user's existing Codex setup

**Exit Gate**
- A first user can understand the skill boundaries in under 2 minutes
- No planned skill duplicates another

### Task 4: Install And Compatibility Layer

**Files:**
- Modify: `installers/README.md`
- Future Create: `installers/install-project.sh`
- Future Create: `installers/install-global.sh`
- Future Create: `installers/backup-existing-config.sh`

- [x] Define project-first install strategy
- [x] Define global install safety requirements
- [x] Define backup-before-mutation policy
- [ ] Implement project installer
- [ ] Implement global installer
- [ ] Prove install does not silently overwrite an existing setup

**Exit Gate**
- A clean repo can be upgraded with the project installer
- A user with existing config gets a backup before any replacement

### Task 5: Doctor Layer

**Files:**
- Future Create: `installers/godex-doctor.sh`
- Future Create: `docs/DOCTOR.md`

- [x] Define the doctor contract in product docs
- [ ] Implement a first doctor command
- [ ] Verify doctor reports installed, missing, and conflicting layers correctly

**Exit Gate**
- Doctor returns meaningful status classes instead of generic success/fail

### Task 6: Benchmark And Examples Layer

**Files:**
- Modify: `benchmarks/README.md`
- Modify: `examples/README.md`
- Future Create: `benchmarks/tasks/`
- Future Create: `benchmarks/scoring-rubric.md`
- Future Create: `examples/before-after/`

- [x] Define the benchmark categories
- [x] Define the example surfaces
- [ ] Write benchmark tasks
- [ ] Write the scoring rubric
- [ ] Add before/after demos

**Exit Gate**
- A maintainer can run a reproducible before/after evaluation with no private context

### Task 7: Dogfood And Release Readiness

**Files:**
- Modify: `README.md`
- Modify: `docs/ACCEPTANCE.md`
- Modify: `docs/PUBLISH.md`
- Future Create: release assets as needed

- [x] Define release gates and current product boundary
- [ ] Run at least one clean-ish dogfood loop
- [ ] Choose OSS license with maintainer confirmation
- [ ] Tag first beta or `v0.1.0` only after install, doctor, and benchmark are real

**Verify**
- Run:
  - `git remote -v`
  - `git branch --show-current`
  - `git status --short`
- Expected:
  - public origin exists
  - branch is `main`
  - working tree is clean after closeout

## Current Coverage

This plan already covers the full product shape:

- product story
- durable behavior contract
- compatibility and install safety
- prompt acquisition layer
- skill taxonomy
- doctor contract
- benchmark contract
- publish and release gates

The next major milestone is not "more docs".

It is a working project-install beta with a real doctor pass.
