# godex Product Foundation Spec

## Goal

Build `godex`, an open-source hybrid upgrade kit that helps ordinary Codex users systematically upgrade their Codex behavior through a combination of:

- prompt-first bootstrap
- durable local skills
- doctor and benchmark validation

The first milestone is not “ship a random prompt pack”.

It is to define a product foundation strong enough to become a serious GitHub open-source project.

## Product Thesis

Most Codex users do not fail because the base model is weak.

They fail because the operating system around the model is weak:

- unclear task intake
- inconsistent planning
- weak verification
- poor output shaping
- no durable memory of repeated user corrections
- no standard way to self-upgrade

`godex` turns those missing behaviors into an installable product.

## Why Hybrid, Not Prompt-Only

Prompt-only products spread fast, but they are fragile.

Skill packs are durable, but they spread slower.

Doctor and benchmark layers create trust, but they are rarely present in prompt repos.

The chosen product shape is therefore hybrid:

1. **Prompt** brings adoption.
2. **Skills** bring durable behavior change.
3. **Doctor + benchmark** bring proof.

This gives `godex` stronger product quality than:

- pure prompt libraries
- one-off personal configs
- “methodology only” repositories with no install surface

## Research Notes

### Official Codex Context

OpenAI’s official Codex guidance emphasizes that Codex works best with:

- clear repository guidance
- configured dev environments
- reliable testing setups
- AGENTS-style documentation

That validates the core thesis behind `godex`:

behavioral scaffolding matters.

### Similar Product Reference 1: `obra/superpowers`

What it proves:

- workflow upgrades can be shipped as composable skills
- users will install agent methodology if installation is simple enough
- product value increases when the behavior change is broad, not single-purpose

What `godex` should learn:

- strong workflow decomposition
- install story matters
- README must explain outcomes, not just internals

What `godex` should not copy blindly:

- optimize only for one agent ecosystem
- require heavy process everywhere

### Similar Product Reference 2: `cat9999aaa/dev-planner-skill`

What it proves:

- a mostly text-driven repo can still feel like a product
- novice-friendly install guidance dramatically increases usability
- prompt/skill packaging can act as a software layer even with minimal code

What `godex` should learn:

- installation instructions must be platform-aware
- product language should be accessible to non-expert users
- prompt-only surfaces can be real acquisition channels

What `godex` must do better:

- move beyond planning into full upgrade, verification, and self-improvement
- prove results through benchmark and doctor, not description alone

## Current Reinforced Codex Traits To Productize

The current high-performing Codex setup behind this project has a number of durable strengths worth productizing:

1. task-first intake reflection
2. spec-driven execution
3. continuous closure toward full objective
4. verification-first completion gate
5. output-by-scenario formatting
6. low-noise final reporting
7. durable memory and mistakebook retention
8. workflow routing and skill selection
9. repo-first / local-fact-first execution
10. self-upgrade via rule strengthening after repeated corrections

`godex` is the attempt to convert those strengths from a private reinforced setup into a reusable open product.

## Product Users

### Primary User

An ordinary Codex user who:

- uses mostly default Codex
- may have partial local tweaks
- wants stronger execution quality
- does not want to handcraft a complex personal workflow

### Secondary User

A power user who:

- already customizes Codex
- wants a benchmarkable upgrade framework
- wants composable skills instead of one giant prompt

### Tertiary User

A content creator / OSS maintainer who wants:

- a repo they can recommend publicly
- a low-friction “paste this to upgrade your Codex” path
- real proof that the install improves outcomes

## Non-Goals

`godex` v1 will not try to:

- replace the Codex binary
- depend on private hosted infrastructure
- become a full plugin marketplace
- support every AI coding tool equally on day one
- force one personality or one writing style on all users

## Product Principles

1. **Codex-native first**
   Design for Codex first; cross-tool portability is a later bonus.
2. **Behavioral upgrade over prompt bloat**
   Improvements should come from workflow structure, not giant always-on prompt mass.
3. **Proof over claims**
   Doctor and benchmark are core product surfaces, not optional afterthoughts.
4. **Durable defaults**
   Long workflows belong in skills; root instructions stay lean.
5. **Non-programmer friendly**
   README, install, and examples must be understandable by people who are not prompt engineers.
6. **Safe by default**
   The product must not silently destroy or overwrite a user’s existing Codex setup.

## Supported Product Surfaces

### Surface A: Bootstrap Prompt

Purpose:

- fast entry point
- easy sharing
- immediate first win

Responsibilities:

- detect if the session looks vanilla or partially customized
- explain the available install modes
- guide the user into the durable installation path
- run or recommend first validation

### Surface B: Core Skill Pack

Purpose:

- durable local behavior change
- reusable workflows

Planned skill families:

- `godex-intake`
- `godex-spec-loop`
- `godex-verification`
- `godex-output`
- `godex-memory`
- `godex-doctor`
- `godex-benchmark`

### Surface C: Doctor

Purpose:

- inspect installation state
- detect missing pieces
- verify activation

Doctor should answer:

- Which godex layers are installed?
- Which are active?
- Which are missing or drifted?
- Is the current Codex environment compatible?

### Surface D: Benchmark

Purpose:

- prove actual quality upgrade
- give users a before/after experience

The benchmark should test representative tasks such as:

- task understanding
- scoped implementation
- verification discipline
- output shaping
- configuration-change reporting

## Installation Modes

### Mode 1: Quick Paste

User pastes the bootstrap prompt into Codex.

Best for:

- social sharing
- first contact
- low-commitment experimentation

### Mode 2: Local Skill Install

User installs the `godex` skill pack into local Codex.

Best for:

- durable upgrade
- repeated usage
- users who already work locally

### Mode 3: Full Product Install

User installs:

- bootstrap prompt
- core skills
- doctor
- benchmark

Best for:

- serious users
- creators
- dogfooding and public demos

## Compatibility Strategy

`godex` must assume real users will have different local realities:

- totally vanilla Codex
- Codex with partial AGENTS tweaks
- Codex with third-party skills
- Codex with messy local instructions
- users who only want project-level install
- users who want global install

Therefore the design must support:

1. **non-destructive install**
2. **backup before replacement**
3. **project-level and global-level guidance**
4. **doctor-driven compatibility reporting**

## Repository Architecture

The repository should be organized around product surfaces, not abstract theory.

### Top Level

- `README.md`
- `specs/`
- `prompts/`
- `skills/`
- `installers/`
- `benchmarks/`
- `examples/`
- `docs/`

### Prompt Layer

- bootstrap prompt
- upgrade prompt pack
- migration prompt
- example prompts for before/after demo

### Skill Layer

Each skill should be narrow and composable.

Avoid one giant monolith skill.

### Installer Layer

Installers should support:

- project-level setup
- global-level setup
- safe backup
- drift-aware re-run

### Benchmark Layer

Benchmarks should ship with:

- representative tasks
- expected strong behaviors
- scoring rubric
- before/after runner or checklist

## Testing Strategy

Testing for `godex` is not only code testing.

It has four layers:

1. **Static integrity**
   Files exist, structure is correct, references resolve.
2. **Install integrity**
   A clean user can follow the install path successfully.
3. **Behavior integrity**
   The upgraded Codex behaves differently on representative tasks.
4. **Regression integrity**
   Updating `godex` should not silently break prior install surfaces.

## Acceptance Standard

`godex` foundation is acceptable when:

1. README clearly explains what the product is, why it exists, and how it differs from ordinary prompt repos.
2. The spec covers product, install, compatibility, benchmark, release, and acceptance.
3. The plan is detailed enough to execute as a real open-source project.
4. The local git repo is initialized cleanly.
5. A GitHub repo is created and connected, or the blocking point is made explicit.

`godex` v1 release is acceptable when:

1. at least one install mode is fully working end to end
2. doctor can verify installation state
3. benchmark can show before/after differences
4. README contains reproducible installation and verification instructions
5. the product survives at least one full dogfood loop

## Release Design

Release should not be “push docs and hope”.

It should follow a predictable pipeline:

1. write / refine product docs
2. implement install surface
3. implement doctor
4. implement benchmark
5. dogfood on clean Codex environment
6. document known boundaries
7. publish GitHub repo
8. tag release

## Risks

1. **Prompt bloat**
   If the bootstrap layer grows too large, it will hurt context quality.
2. **Install fragility**
   If install logic is not careful, users will fear breaking their setup.
3. **Weak benchmark**
   If benchmark tasks are vague, product claims will feel fake.
4. **Overfitting to one private setup**
   `godex` must generalize beyond this current Codex environment.
5. **Too much methodology, not enough product**
   If the repo reads like philosophy, it will not convert users.

## Open Questions To Resolve During Implementation

1. Should `godex` ship one main install script or separate project/global installers?
2. Should benchmark be fully automated, semi-automated, or checklist-based in v1?
3. Which parts should remain prompt-only versus become skill-native?
4. What is the minimum viable doctor surface for v1?
5. How should `godex` handle merging with an existing user `AGENTS.md`?

## Decision For This Foundation Round

For the first foundation round, `godex` will be treated as:

- a public GitHub open-source product
- Codex-native first
- hybrid by design
- benchmark-driven by default
- documentation-heavy now, implementation-heavy next
