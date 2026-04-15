# godex

> Upgrade vanilla Codex into a clearer, more disciplined, lower-noise engineering agent.

`godex` is an open-source upgrade kit for Codex.

It packages the strongest parts of a reinforced Codex workflow into a product that ordinary users can install instead of handcrafting a private maze of prompts, notes, and habits.

`godex` is intentionally hybrid:

- a bootstrap prompt for instant session improvement
- durable local rules and skills for repeatable behavior change
- doctor and benchmark layers for proving the upgrade actually worked

## What Changes After Install

- The first reply mirrors the request before execution begins.
- Accepted full objectives stay full; the agent does not quietly shrink the job into scattered partial steps.
- "Done" requires verification.
- Closeouts change by scenario instead of using one noisy template for everything.
- Final replies stay short, readable, and focused on signal.
- Repeated user corrections become durable operating defaults instead of getting forgotten next session.

## Who This Is For

- vanilla Codex users who want a better default operating model
- power users who want a cleaner, benchmarkable upgrade framework
- creators and maintainers who want a public repo they can recommend with confidence

## What `godex` Is Not

- not a giant always-on prompt
- not a personal config dump pretending to be a product
- not methodology-only prose with no install path
- not a Codex binary replacement

## Product Layers

### 1. Bootstrap Prompt

Fastest way to make a fresh Codex session behave better.

Current artifact:

- [`prompts/bootstrap/GODEX_BOOTSTRAP.md`](prompts/bootstrap/GODEX_BOOTSTRAP.md)

### 2. Durable Upgrade Layer

Repo rules, install surfaces, and skill boundaries that make the change stick.

Current design anchors:

- [`AGENTS.md`](AGENTS.md)
- [`docs/COMPATIBILITY.md`](docs/COMPATIBILITY.md)
- [`installers/README.md`](installers/README.md)
- [`skills/README.md`](skills/README.md)

### 3. Trust Layer

Doctor, benchmarks, and examples that prove `godex` is better than vanilla Codex on real work.

Current design anchors:

- [`benchmarks/README.md`](benchmarks/README.md)
- [`examples/README.md`](examples/README.md)
- [`docs/ACCEPTANCE.md`](docs/ACCEPTANCE.md)

## Start Here

- Read the public product truth: [`README.md`](README.md)
- Read the repo behavior contract: [`AGENTS.md`](AGENTS.md)
- Read the current dogfood spec: [`SPEC.md`](specs/dogfood-rollout-20260415/SPEC.md)
- Read the current dogfood plan: [`PLAN.md`](specs/dogfood-rollout-20260415/PLAN.md)
- Read install safety and compatibility: [`docs/COMPATIBILITY.md`](docs/COMPATIBILITY.md)
- Read current dogfood rollout notes: [`docs/DOGFOOD.md`](docs/DOGFOOD.md)
- Read current doctor contract: [`docs/DOCTOR.md`](docs/DOCTOR.md)
- Read publish and release gates: [`docs/PUBLISH.md`](docs/PUBLISH.md)

## Install Modes

### Quick Paste

Paste the bootstrap prompt into a fresh Codex session.

Status:

- first draft exists
- lowest friction
- not durable by itself

### Project Install

Install `godex` into one repository as a local operating layer.

Status:

- target v1 install surface
- safest default for real users
- install contract designed, scripts not shipped yet

### Full Install

Install prompt, durable layer, doctor, and benchmark together.

Status:

- product direction chosen
- not yet end-to-end implemented

## Current Status

`README.md` is the single current status page for this repository.

### Stage

`beta delivery planning`

### Done

- local git repo created
- public GitHub repo created and pushed: `https://github.com/nakamotosai/godex`
- root product README rewritten as a real landing page
- repo-level `AGENTS.md` added as the durable behavior contract
- product foundation `SPEC.md` and `PLAN.md` rewritten
- first bootstrap prompt draft written
- compatibility, acceptance, and publish docs added
- prompt / skills / installers / benchmarks / examples directories promoted from empty shells to product contracts
- new dogfood-first rollout spec and plan added
- first usable `godex doctor` script added
- first benchmark task set and scoring rubric added
- first real baseline-vs-dogfood benchmark round executed
- dogfood noise-tightening pass added for closeout and behavior-reporting weak spots
- second benchmark round executed after paragraph-spacing tightening
- third benchmark round executed with visual-layout stress coverage
- next-phase beta delivery spec and plan added
- current Codex workspace wired for `godex` dogfood

### Not Done Yet

- working project installer
- working global installer
- before/after demo set
- release assets
- OSS license selection

## Repo Map

- [`README.md`](README.md): product story and current status
- [`AGENTS.md`](AGENTS.md): durable behavior contract for contributors and agentic workers
- [`prompts/`](prompts): quick-paste acquisition layer
- [`skills/`](skills): durable upgrade layer design
- [`installers/`](installers): safe install contract and future scripts
- [`benchmarks/`](benchmarks): proof layer design
- [`benchmarks/runs/2026-04-15-round1.md`](benchmarks/runs/2026-04-15-round1.md): first real benchmark result
- [`benchmarks/runs/2026-04-15-round2.md`](benchmarks/runs/2026-04-15-round2.md): second benchmark result after spacing tightening
- [`benchmarks/runs/2026-04-15-round3.md`](benchmarks/runs/2026-04-15-round3.md): third benchmark result with visual-layout stress
- [`examples/`](examples): before/after showcase plan
- [`docs/`](docs): compatibility, acceptance, publish, and research docs
- [`specs/product-foundation-20260415/`](specs/product-foundation-20260415): foundation spec and execution plan
- [`specs/dogfood-rollout-20260415/`](specs/dogfood-rollout-20260415): current product and local rollout spec
- [`specs/noise-tightening-20260415/`](specs/noise-tightening-20260415): current closeout-noise tightening spec
- [`specs/paragraph-spacing-round2-20260415/`](specs/paragraph-spacing-round2-20260415): current paragraph-spacing + round-2 benchmark spec
- [`specs/visual-layout-round3-20260415/`](specs/visual-layout-round3-20260415): current visual-layout + round-3 benchmark spec
- [`specs/beta-delivery-20260415/`](specs/beta-delivery-20260415): next mainline beta-delivery spec and execution plan

## Release Bar

`godex` should not be presented as a finished product until all of these are true:

1. at least one install mode works end to end
2. install is non-destructive and backed up by default
3. doctor can verify what is active and what is missing
4. benchmark can show meaningful before/after differences
5. the repo survives a real dogfood loop
6. current boundaries are documented honestly

## Current Boundary

The repository is now strong enough to present as a serious product foundation with a real dogfood lane.

It is not yet an install-complete `v1`, but the next mainline is now explicit: project-first beta delivery rather than more general prompt polishing.

The third benchmark round now exists, and it sharpens the picture further. `godex` is now clearly stronger than the clean baseline on intake mirroring and on behavior/config reporting when many files must stay visible. Baseline caught up on full-objective retention, and the remaining stubborn weakness is now narrower still: review-style long findings are still denser than they should be.

The biggest remaining product gaps are a real project installer, installer-grade doctor states, user-facing proof after install, broader dogfood evidence, a stronger fix for review-output spacing, and license choice.
