# godex Product Foundation Spec

> Current status truth lives in the repository root [`README.md`](../../README.md). This spec defines the product contract for the foundation round.

## Goal

Build `godex`, an open-source Codex upgrade kit that turns a mostly vanilla Codex setup into a more disciplined, better-structured, lower-noise engineering agent.

The product is hybrid by design:

- bootstrap prompt for immediate session lift
- durable local rules and skills for repeatable behavior change
- doctor and benchmark layers for proof

The foundation round is successful when the repository already feels like a real product, not a loose collection of ideas.

## Product Thesis

The quality gap between vanilla Codex and reinforced Codex is often not a pure model gap.

It is usually a workflow gap:

- weak task intake
- weak planning discipline
- weak verification discipline
- weak output shaping
- weak persistence of user preferences and prior mistakes

`godex` productizes the missing operating system around Codex.

## What `godex` Must Productize

The current reinforced Codex setup behind this project has several durable strengths worth turning into a public product:

1. task-first intake reflection
2. spec-driven execution
3. continuous closure toward the full objective
4. evidence-first completion
5. output shape that changes by scenario
6. low-noise final reporting
7. durable memory of preferences and anti-patterns
8. workflow routing
9. local-fact-first execution
10. self-upgrade after repeated user corrections

These are not side notes.

They are the product.

## Required Behavior Contract

Every serious `godex` install should move Codex toward these defaults:

### 1. First Reply Mirrors The Task

Before action, the agent briefly restates:

- the real goal
- the important scope or boundary
- the first action it will take

If ambiguity matters, it names the key interpretation branches instead of silently choosing one.

### 2. The Objective Stays Intact

If the user has already accepted a full objective, the agent keeps driving toward full closure.

It must not:

- collapse the work into partial staged slices unless the user explicitly wants staged execution
- stop after writing a plan unless the user explicitly asked for plan-only
- forget the earlier accepted scope mid-run

### 3. Verification Gates Completion

The agent does not claim success from confidence alone.

Completion requires verification appropriate to the change:

- code change: tests, build, lint, or runtime proof
- config change: parse and state checks
- doc/product change: file existence, linkage, and repo consistency checks

### 4. Output Changes By Scenario

Design, repair, review, validation, config change, and blockage should not all look the same.

`godex` must eventually ship scenario-specific output contracts for at least:

- implementation
- design / product planning
- code review
- validation / audit
- config or behavior change
- blocked / not-finished cases

### 5. The Final Reply Stays Low Noise

Default closeout should be easy to scan:

- 1-2 paragraphs by default
- or at most 3 small blocks when the task is naturally list-shaped

It should keep signal and remove:

- repeated framing
- verbose internal process narration
- code or diff dumps the user did not request
- generic "other things I can also do" add-ons

### 6. Repeated Corrections Become Durable

If a user repeats the same correction, `godex` should treat it as a missing default and strengthen the local operating rules instead of relearning it every session.

## Product Users

### Primary User

A mostly vanilla Codex user who wants:

- better execution quality
- less noise
- stronger verification
- a system they can install without becoming a prompt engineer

### Secondary User

A power user who wants:

- benchmarkable upgrades
- a cleaner workflow stack
- modular skills instead of one giant instruction blob

### Tertiary User

A creator or maintainer who wants:

- a public repo they can recommend
- a simple "paste this first" entry point
- credible proof that the upgrade is real

## Non-Goals For v1

`godex` v1 will not try to:

- replace the Codex binary
- depend on private hosted infrastructure
- support every AI coding tool equally
- impose one personality on every user
- solve all customization conflicts automatically

## Product Surfaces

### Surface A: Bootstrap Prompt

Purpose:

- fast acquisition
- low-friction first win
- social sharing surface

Deliverable for foundation round:

- first draft prompt at [`prompts/bootstrap/GODEX_BOOTSTRAP.md`](../../prompts/bootstrap/GODEX_BOOTSTRAP.md)

### Surface B: Repo-Level Behavior Contract

Purpose:

- make the product behavior legible
- define the durable rules the rest of the system should enforce

Deliverable for foundation round:

- root [`AGENTS.md`](../../AGENTS.md)

### Surface C: Skill Pack

Purpose:

- durable, reusable workflow modules
- keep long behavior logic out of one giant root instruction file

Foundation round output:

- skill taxonomy and boundaries documented in [`skills/README.md`](../../skills/README.md)

### Surface D: Install Layer

Purpose:

- safe installation
- backup before mutation
- project-level and global-level rollout

Foundation round output:

- install contract documented in [`installers/README.md`](../../installers/README.md)

### Surface E: Doctor

Purpose:

- inspect what is installed
- explain what is active, missing, or conflicting

Foundation round output:

- minimum contract defined in this spec and supporting docs

### Surface F: Benchmark

Purpose:

- prove `godex` improves real Codex behavior
- give maintainers and users a before/after lens

Foundation round output:

- benchmark categories and scoring direction documented in [`benchmarks/README.md`](../../benchmarks/README.md)

## Installation Modes

### Mode 1: Quick Paste

User pastes the bootstrap prompt into Codex.

Properties:

- fastest adoption path
- almost no setup friction
- behavior improvement is temporary unless the user also installs durable layers

### Mode 2: Project Install

User installs `godex` into one repository.

Properties:

- safest durable path
- preferred v1 install target
- avoids mutating global user setup by default

### Mode 3: Full Install

User installs prompt, durable layer, doctor, and benchmark together.

Properties:

- best long-term experience
- highest trust
- not yet implemented end to end in the foundation round

## Compatibility And Safety Strategy

`godex` must assume real users will have different local realities:

- fully vanilla Codex
- partial custom `AGENTS.md`
- third-party skills
- mixed-quality old prompt glue
- project-only users
- global power users

The design must therefore enforce:

1. project-level install is the default safe recommendation
2. global install requires backup before replacement
3. no silent overwrite of existing user rules
4. compatibility is reported explicitly by doctor instead of guessed

For the first public release, compatibility support should be honest and narrow:

- target first: Codex CLI with local repository access
- safe default: project-level installation
- later expansion: richer global install and more conflict handling

## Doctor Contract

The doctor layer must eventually answer:

1. which `godex` layers are installed
2. which are active right now
3. what is missing
4. what conflicts with the current user setup
5. whether benchmark is ready to run

Minimum expected doctor result classes:

- `healthy`
- `partial`
- `drifted`
- `conflicted`
- `unsupported`

## Benchmark Contract

The benchmark layer must measure more than "did the model write code".

It should score at least these dimensions:

1. intake fidelity
2. scope retention and closure
3. verification discipline
4. output clarity and signal density
5. behavior/config change reporting

Benchmark tasks must be:

- reproducible
- understandable by humans
- runnable without hidden private context
- representative of real Codex work

## Output Contract By Scenario

`godex` should eventually ship explicit output rules for these common cases:

### Design / Product Planning

Expected emphasis:

- problem
- chosen product direction
- current scope
- release boundary

### Implementation / Repair

Expected emphasis:

- result
- verification
- current boundary

### Review

Expected emphasis:

- findings first
- severity ordering
- residual risk

### Validation / Audit

Expected emphasis:

- what was checked
- what passed
- what failed or remains uncovered

### Behavior Or Config Change

Expected emphasis:

- changed behavior
- relevant files only when needed
- verification
- boundary

## Repository Architecture

`godex` should be organized around product surfaces, not abstract philosophy.

Top-level contract:

- [`README.md`](../../README.md): product story and current status
- [`AGENTS.md`](../../AGENTS.md): behavior contract
- [`prompts/`](../../prompts): acquisition layer
- [`skills/`](../../skills): durable workflow layer
- [`installers/`](../../installers): install and repair layer
- [`benchmarks/`](../../benchmarks): proof layer
- [`examples/`](../../examples): before/after showcase layer
- [`docs/`](../../docs): support docs
- [`specs/`](..): versioned design and execution specs

## Foundation Deliverables

The foundation round should leave the repo with:

- a public GitHub repository
- a product-grade root README
- a durable repo-level behavior contract
- a rewritten spec and execution plan
- a first bootstrap prompt draft
- compatibility, acceptance, and publish docs
- upgraded directory-level docs for prompts, skills, installers, benchmarks, and examples

## Acceptance Standard

The foundation round is acceptable when:

1. the repository already reads like a coherent product
2. current status in the root README matches repository reality
3. the behavior contract is explicit
4. compatibility and install safety are explicit
5. publish and acceptance gates are explicit
6. no key document still reads like an empty shell
7. the repo is committed, pushed, and clean

`godex` should not claim `v1` until:

1. at least one install mode works end to end
2. doctor exists and reports meaningful states
3. benchmark exists and can show before/after improvement
4. at least one dogfood loop is recorded
5. current boundaries are documented honestly

## Known Boundaries After Foundation

- install scripts are not implemented yet
- doctor is designed but not implemented yet
- benchmark is designed but not implemented yet
- the skill pack taxonomy exists, but individual skills are not shipped yet
- OSS license is not selected yet because that requires maintainer choice

## Foundation Round Decision

For this round, `godex` is officially treated as:

- a public GitHub open-source product
- Codex-native first
- project-install-first for safety
- hybrid by design
- proof-driven rather than prompt-hype-driven
