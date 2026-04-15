# godex Product Foundation Implementation Plan

> **For agentic workers:** In Codex, use `superpowers:executing-plans` by default. Use `superpowers:subagent-driven-development` only when independent lanes exist and the user explicitly allows delegation or parallel agent work. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Turn `godex` from a product thesis into a real open-source Codex upgrade kit with a durable install surface, benchmark proof, and publishable GitHub repository.

**Architecture:** Build `godex` in layers: product docs first, then bootstrap prompt, then durable skill pack, then doctor and benchmark, then packaging and release. Treat README as the single current status page and keep long design detail in task-scoped specs.

**Tech Stack:** Markdown docs, Codex-compatible skills, shell/Python installer utilities, benchmark fixtures, GitHub releases, local verification commands.

---

### Task 1: Product Foundation Docs

**Files:**
- Create: `README.md`
- Create: `specs/product-foundation-20260415/SPEC.md`
- Create: `specs/product-foundation-20260415/PLAN.md`

- [ ] Define the public product story in `README.md`
- [ ] Write the product foundation spec covering:
  - product thesis
  - user personas
  - install modes
  - compatibility strategy
  - testing and acceptance
  - release design
- [ ] Write the implementation plan that turns the spec into execution phases
- [ ] Review the docs for:
  - duplicated claims
  - unclear scope
  - missing acceptance
  - product/story mismatch

**Verify**
- Run: `rg -n "TODO|TBD|placeholder" README.md specs/product-foundation-20260415`
- Expected: no unresolved placeholders

### Task 2: Repository Baseline

**Files:**
- Create: `.gitignore`
- Optional Create: `LICENSE`
- Optional Create: `docs/`
- Optional Create: `prompts/`
- Optional Create: `skills/`
- Optional Create: `installers/`
- Optional Create: `benchmarks/`
- Optional Create: `examples/`

- [ ] Create the top-level repository skeleton required by the spec
- [ ] Add a pragmatic `.gitignore` for docs + future script/tool output
- [ ] Decide whether to include `LICENSE` in the first public push or defer with explicit note
- [ ] Ensure the repo shape matches the README and spec

**Verify**
- Run: `find . -maxdepth 2 | sort`
- Expected: repository structure matches the documented architecture

### Task 3: Bootstrap Prompt Surface

**Files:**
- Create: `prompts/bootstrap/README.md`
- Create: `prompts/bootstrap/GODEX_BOOTSTRAP.md`
- Create: `prompts/upgrade/README.md`

- [ ] Define what the bootstrap prompt is allowed to do and what it must hand off to skills
- [ ] Write the first bootstrap prompt in a portable Markdown form
- [ ] Document how users invoke it in Codex
- [ ] Define the “quick paste” install experience

**Verify**
- Check that bootstrap prompt clearly states:
  - purpose
  - supported environments
  - limits
  - durable install recommendation

### Task 4: Core Skill Pack Design

**Files:**
- Create: `skills/README.md`
- Create: `skills/godex-intake/SKILL.md`
- Create: `skills/godex-spec-loop/SKILL.md`
- Create: `skills/godex-verification/SKILL.md`
- Create: `skills/godex-output/SKILL.md`
- Create: `skills/godex-doctor/SKILL.md`
- Create: `skills/godex-benchmark/SKILL.md`

- [ ] Define the minimal skill taxonomy
- [ ] Ensure each skill has one clear purpose
- [ ] Keep root rules lean and push long workflows into skills
- [ ] Document which skills are core versus optional

**Verify**
- Run a manual boundary review:
  - Can each skill be explained in one sentence?
  - Does any skill duplicate another?
  - Is any skill too broad?

### Task 5: Install and Compatibility Layer

**Files:**
- Create: `installers/README.md`
- Create: `installers/install-project.sh`
- Create: `installers/install-global.sh`
- Create: `installers/backup-existing-config.sh`
- Create: `docs/COMPATIBILITY.md`

- [ ] Design project-level install flow
- [ ] Design global-level install flow
- [ ] Add backup logic before touching user config
- [ ] Document compatibility assumptions and failure modes
- [ ] Explicitly define how `godex` coexists with existing `AGENTS.md` and local skills

**Verify**
- On a clean test directory, confirm installer can:
  - create backup
  - place files in expected locations
  - print next verification step

### Task 6: Doctor Surface

**Files:**
- Create: `docs/DOCTOR.md`
- Create: `installers/godex-doctor.sh`
- Create: `benchmarks/doctor-fixtures/`

- [ ] Define the minimum doctor contract:
  - what it checks
  - what success means
  - what failure classes exist
- [ ] Implement the first doctor script
- [ ] Document common failure cases and suggested fixes

**Verify**
- Doctor should report at least:
  - installed layers
  - missing layers
  - conflicting setup
  - benchmark readiness

### Task 7: Benchmark Suite

**Files:**
- Create: `benchmarks/README.md`
- Create: `benchmarks/tasks/`
- Create: `benchmarks/scoring-rubric.md`
- Create: `examples/before-after/README.md`

- [ ] Design representative benchmark tasks
- [ ] Define scoring rubric for:
  - intake quality
  - closure quality
  - verification quality
  - output clarity
  - config-change visibility
- [ ] Add before/after examples
- [ ] Make benchmark useful for both maintainers and end users

**Verify**
- Benchmark tasks should be:
  - representative
  - reproducible
  - human-reviewable
  - not dependent on hidden private context

### Task 8: Dogfood and Acceptance

**Files:**
- Create: `docs/DOGFOOD.md`
- Create: `docs/ACCEPTANCE.md`
- Create: `docs/RELEASE_CHECKLIST.md`

- [ ] Run `godex` against real Codex tasks in a clean-ish environment
- [ ] Record what improved and what still drifted
- [ ] Convert findings into acceptance gates
- [ ] Define hard release blockers

**Verify**
- Acceptance must explicitly cover:
  - install success
  - doctor success
  - benchmark usability
  - README clarity
  - no destructive overwrite behavior

### Task 9: GitHub Publish Pipeline

**Files:**
- Create: `.github/`
- Create: `.github/workflows/` when automation is justified
- Create: `docs/PUBLISH.md`

- [ ] Create the GitHub repo
- [ ] Configure origin
- [ ] Push foundation branch or `main`
- [ ] Document release steps
- [ ] Add workflow automation only where it reduces real friction

**Verify**
- Run:
  - `git remote -v`
  - `git status --short`
  - `git branch --show-current`
- Expected:
  - origin configured
  - clean working tree after baseline commit
  - `main` branch active

### Task 10: Public Product Polish

**Files:**
- Modify: `README.md`
- Modify: `docs/*`
- Modify: `examples/*`

- [ ] Rewrite README after implementation reality exists
- [ ] Add screenshots or terminal demos if they materially improve conversion
- [ ] Ensure README explains:
  - what `godex` is
  - who it is for
  - how to install
  - how to verify
  - how it differs from prompt-only repos
- [ ] Make the repo legible to both power users and non-expert Codex users

**Verify**
- README review checklist:
  - Can a first-time visitor understand the product in under 60 seconds?
  - Can a serious user find install and verification in under 2 minutes?
  - Is the current project stage obvious?

## Spec Coverage Check

This plan covers:

- product thesis
- install modes
- compatibility
- doctor
- benchmark
- testing
- release
- acceptance

Remaining implementation detail will live in future task-scoped specs once Phase 1 foundation is accepted.
