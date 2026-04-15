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
- Read the earlier beta-delivery spec: [`SPEC.md`](specs/beta-delivery-20260415/SPEC.md)
- Read the earlier beta-delivery plan: [`PLAN.md`](specs/beta-delivery-20260415/PLAN.md)
- Read the current release-closeout spec: [`SPEC.md`](specs/release-closeout-20260415/SPEC.md)
- Read the current release-closeout plan: [`PLAN.md`](specs/release-closeout-20260415/PLAN.md)
- Read install safety and compatibility: [`docs/COMPATIBILITY.md`](docs/COMPATIBILITY.md)
- Read the project install walkthrough: [`docs/PROJECT_INSTALL.md`](docs/PROJECT_INSTALL.md)
- Read the global install walkthrough: [`docs/GLOBAL_INSTALL.md`](docs/GLOBAL_INSTALL.md)
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

- working beta install surface
- safest default for real users
- ships install, restore, doctor, quick proof, and example pack

### Global Install

Install `godex` into one Codex home as a broader default operating layer.

Status:

- working beta install surface
- backup-first and restorable
- ships doctor, quick proof, prompt copy, and example pack

## Current Status

`README.md` is the single current status page for this repository.

### Stage

`public beta`

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
- working project installer added
- project restore path added
- installer-grade project doctor added
- quick post-install proof command added
- first install-safe example pack added
- MIT license added
- working global installer added
- global restore path added
- installer-grade global doctor added
- clean-surface install proof script added
- recorded install proof added
- public beta release pack added
- review-layout tightening promoted into shipped behavior surfaces

### Not Done Yet

- broad outside-user validation
- automatic handling for complex custom global policies
- first public `v1` tag flow

## Repo Map

- [`README.md`](README.md): product story and current status
- [`AGENTS.md`](AGENTS.md): durable behavior contract for contributors and agentic workers
- [`prompts/`](prompts): quick-paste acquisition layer
- [`skills/`](skills): durable upgrade layer design
- [`installers/`](installers): shipped project/global install, restore, doctor, and quick-proof scripts
- [`benchmarks/`](benchmarks): proof layer design
- [`benchmarks/runs/2026-04-15-round1.md`](benchmarks/runs/2026-04-15-round1.md): first real benchmark result
- [`benchmarks/runs/2026-04-15-round2.md`](benchmarks/runs/2026-04-15-round2.md): second benchmark result after spacing tightening
- [`benchmarks/runs/2026-04-15-round3.md`](benchmarks/runs/2026-04-15-round3.md): third benchmark result with visual-layout stress
- [`benchmarks/runs/2026-04-15-install-proof.md`](benchmarks/runs/2026-04-15-install-proof.md): isolated install-proof record
- [`examples/`](examples): shipped project/global example packs
- [`docs/`](docs): compatibility, acceptance, publish, and research docs
- [`releases/project-first-beta-20260415/`](releases/project-first-beta-20260415): public beta release pack
- [`specs/product-foundation-20260415/`](specs/product-foundation-20260415): foundation spec and execution plan
- [`specs/dogfood-rollout-20260415/`](specs/dogfood-rollout-20260415): current product and local rollout spec
- [`specs/noise-tightening-20260415/`](specs/noise-tightening-20260415): current closeout-noise tightening spec
- [`specs/paragraph-spacing-round2-20260415/`](specs/paragraph-spacing-round2-20260415): current paragraph-spacing + round-2 benchmark spec
- [`specs/visual-layout-round3-20260415/`](specs/visual-layout-round3-20260415): current visual-layout + round-3 benchmark spec
- [`specs/beta-delivery-20260415/`](specs/beta-delivery-20260415): earlier project-install beta-delivery spec and execution plan
- [`specs/release-closeout-20260415/`](specs/release-closeout-20260415): current release-closeout spec and execution plan

## Beta Bar

`godex` should not be presented as a real public beta until all of these are true:

1. project install works end to end
2. global install works end to end
3. both installs are backup-first and restorable
4. doctor can inspect both install types
5. install proof exists outside the maintainer workspace itself
6. release assets are ready for a public beta pass
7. current boundaries are documented honestly

## Current Boundary

The repository is now strong enough to present as a real public beta with two working install surfaces.

It is still not `v1`.

What is now real:

- project install
- global install
- backup + restore for both
- doctor for both
- clean-surface install proof
- release assets for this beta
- stronger shipped guidance for review-style long findings layout

The benchmark rounds now show a stable pattern: `godex` is stronger than the clean baseline on intake mirroring and on behavior/config reporting when many files must stay visible.

The remaining `v1` gaps are narrower: broad outside-user validation, better handling for complex custom global policies, and a real public release/tagging cycle beyond maintainer-run proof.
