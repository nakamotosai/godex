# godex

> Turn vanilla Codex into a more structured, self-checking, self-improving engineering agent.

`godex` is an open-source upgrade kit for ordinary Codex users.

It is not just a long prompt.

It is a hybrid product:

- a bootstrap prompt that can wake up a plain Codex session
- a skill pack that installs durable workflows
- a doctor and benchmark layer that proves the upgrade actually worked

The product goal is simple:

after installing `godex`, a normal Codex user should get much closer to the behavior of a heavily reinforced, high-discipline Codex without having to manually invent that system from scratch.

## Why This Exists

Most Codex users are still on a mostly raw setup:

- default behavior
- partial custom instructions
- scattered prompt tweaks
- no stable verification loop
- no reusable upgrade method

That leads to the same problems over and over:

- jumps into action without clarifying the task
- writes code before shaping the plan
- says “fixed” without strong verification
- gives noisy or badly structured closeouts
- forgets stable user preferences and repeated mistakes

`godex` packages a better default operating model as a product.

## What `godex` Productizes

`godex` is based on the strongest traits of a highly reinforced Codex workflow.

These are the capabilities we want to make installable:

1. **Task intake that mirrors the request first**
   The agent briefly restates the real goal, boundary, and first action before execution.
2. **Spec-driven execution**
   The agent uses goal, scope, constraints, and acceptance as the true control plane instead of ad-hoc hacking.
3. **Continuous closure**
   Once a full objective is accepted, the agent keeps pushing toward full closure instead of shrinking the task into scattered partial steps.
4. **Evidence-first verification**
   “Done” requires verification, not confidence.
5. **Output by scenario**
   Different tasks should produce different response shapes:
   repair, review, design, configuration change, validation, and blockage should not all look the same.
6. **Low-noise reporting**
   Keep the important information, remove repeated framing, path spam, diff spam, and process noise.
7. **Durable memory and anti-pattern retention**
   Stable preferences, repeated mistakes, and reusable patterns should survive across sessions.
8. **Workflow routing**
   The agent should know when to brainstorm, when to spec, when to plan, when to execute, and when to verify.
9. **Self-upgrade behavior**
   The agent should be able to strengthen its own local operating rules when repeated user corrections expose missing defaults.
10. **Benchmarkable improvement**
   The upgrade should be provable through before/after tasks, not just described in README prose.

## Product Shape

`godex` will ship in three layers.

### Layer 1: Bootstrap Prompt

A prompt-only install surface for fast adoption.

This is the viral entry point:

- easy to copy
- easy to tweet
- easy to paste into a fresh Codex session

Its job is not to carry the whole system forever.

Its job is to:

- detect environment
- explain the upgrade path
- install or activate the durable layer
- run a first doctor pass

### Layer 2: Godex Skills

A composable skill pack that installs the durable behavior model.

This is the real product core.

It will contain workflows for:

- intake shaping
- spec-driven delivery
- verification gating
- output shaping by scenario
- memory and mistake capture
- self-doctor and self-upgrade
- benchmark and acceptance

### Layer 3: Doctor + Benchmark

This is the trust layer.

It answers:

- Did `godex` install correctly?
- Which parts are active?
- What changed versus vanilla Codex?
- Is the upgraded Codex actually better on representative tasks?

Without this layer, the product is just philosophy.

With it, `godex` becomes measurable.

## Install Modes

`godex` is designed to support three install modes.

### 1. Prompt-Only Mode

For users who want instant behavior improvement with near-zero setup.

### 2. Skill-Pack Mode

For users who want durable local upgrades without changing the Codex binary.

### 3. Full Mode

For users who want:

- bootstrap prompt
- skills
- doctor
- benchmark
- repo-level or global rollout

This is the recommended mode.

## Differentiation

`godex` is not trying to be:

- just another “awesome prompt”
- a one-off personal config dump
- a Claude-only workflow port
- an abstract methodology with no install path

It aims to be:

- **portable**
- **installable**
- **benchmarkable**
- **self-improving**
- **Codex-native first**

## Current Status

This README is the single current status page for the project.

### Stage

`product foundation`

### Completed

- project name selected: `godex`
- local git repository initialized
- product direction selected: hybrid upgrade kit
- market and reference scan started
- first product README written
- first full product spec and implementation plan being drafted

### In Progress

- defining the exact repository architecture
- defining the bootstrap prompt architecture
- defining the install surfaces
- defining benchmark and acceptance criteria

### Not Started

- first installable prompt pack
- first skill pack
- doctor command
- benchmark suite
- example before/after demos
- release assets

## Planned Repository Structure

```text
godex/
├── README.md
├── specs/
│   └── product-foundation-20260415/
│       ├── SPEC.md
│       └── PLAN.md
├── prompts/
│   ├── bootstrap/
│   └── upgrade/
├── skills/
│   ├── godex-intake/
│   ├── godex-spec-loop/
│   ├── godex-output/
│   ├── godex-doctor/
│   └── godex-benchmark/
├── installers/
├── benchmarks/
├── examples/
└── docs/
```

## Release Standard

`godex` should not be published as a serious product until all of these are true:

1. a fresh Codex user can install it in a low-friction way
2. the upgraded behavior is visible on real tasks
3. the doctor can verify what is active
4. the benchmark can show meaningful before/after improvement
5. the README makes the value obvious to non-expert users

## Roadmap

### Phase 1

Product foundation:

- product positioning
- architecture
- README
- spec
- plan

### Phase 2

Prompt-first experience:

- bootstrap prompt
- upgrade prompt pack
- quickstart examples

### Phase 3

Durable Codex upgrade layer:

- core skills
- install flows
- compatibility rules

### Phase 4

Trust layer:

- doctor
- benchmark
- acceptance suite

### Phase 5

Open-source release:

- public GitHub repo
- release notes
- example tasks
- demo media

## Design Constraint

`godex` must improve Codex without turning it into a bloated, fragile meta-system.

That means:

- keep root instructions lean
- push long workflows into skills
- avoid giant always-on prompts
- verify improvements on real tasks
- preserve compatibility with different Codex setups

## Next Repository Milestone

A complete product foundation spec that defines:

- users
- product surfaces
- repo structure
- install modes
- benchmark design
- release and acceptance rules
