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
- Read the current `v1` closeout spec: [`SPEC.md`](specs/v1-closeout-20260415/SPEC.md)
- Read the current `v1` closeout plan: [`PLAN.md`](specs/v1-closeout-20260415/PLAN.md)
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

- supported in `v1.0.0`
- lowest friction
- not durable by itself

### Project Install

Install `godex` into one repository as a local operating layer.

Status:

- supported in `v1.0.0`
- safest default for real users
- ships install, restore, doctor, quick proof, and example pack

### Global Install

Install `godex` into one Codex home as a broader default operating layer.

Status:

- supported in `v1.0.0`
- backup-first and restorable
- ships doctor, quick proof, prompt copy, and example pack

## Current Status

`README.md` is the single current status page for this repository.

### Version

`v1.0.0`

### What Is Real Now

- quick paste bootstrap
- project install and global install
- backup, restore, doctor, and quick-proof surfaces for both durable install modes
- `--dry-run` preflight before risky mutation
- safe `manual_review` stop plus `docs/MANUAL_MERGE.md` for complex existing `AGENTS.md`
- troubleshooting, upgrade, support matrix, contributing guide, issue templates, and CI release guard
- release pack under [`releases/v1.0.0/`](releases/v1.0.0/)

### Verification

- repo doctor: `bash installers/godex-doctor.sh --repo-only`
- install proof: `bash benchmarks/scripts/verify_install_surfaces.sh`
- broader validation record: [`benchmarks/runs/2026-04-16-v1-validation-matrix.md`](benchmarks/runs/2026-04-16-v1-validation-matrix.md)

### Current Boundary

- complex existing project or global `AGENTS.md` stacks may stop at `manual_review` instead of auto-merge
- support target is Codex CLI on Unix-like shells, including WSL-style Unix shells
- validation is broader than maintainer-only proof, but it is still not broad community-scale validation

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
- [`benchmarks/runs/2026-04-16-v1-validation-matrix.md`](benchmarks/runs/2026-04-16-v1-validation-matrix.md): broader `v1` validation record
- [`examples/`](examples): shipped project/global example packs
- [`docs/`](docs): compatibility, acceptance, publish, and research docs
- [`releases/project-first-beta-20260415/`](releases/project-first-beta-20260415): historical public-beta release pack
- [`releases/v1.0.0/`](releases/v1.0.0/): `v1.0.0` release pack
- [`specs/product-foundation-20260415/`](specs/product-foundation-20260415): foundation spec and execution plan
- [`specs/dogfood-rollout-20260415/`](specs/dogfood-rollout-20260415): current product and local rollout spec
- [`specs/noise-tightening-20260415/`](specs/noise-tightening-20260415): current closeout-noise tightening spec
- [`specs/paragraph-spacing-round2-20260415/`](specs/paragraph-spacing-round2-20260415): current paragraph-spacing + round-2 benchmark spec
- [`specs/visual-layout-round3-20260415/`](specs/visual-layout-round3-20260415): current visual-layout + round-3 benchmark spec
- [`specs/beta-delivery-20260415/`](specs/beta-delivery-20260415): earlier project-install beta-delivery spec and execution plan
- [`specs/release-closeout-20260415/`](specs/release-closeout-20260415): earlier public-beta release-closeout spec and execution plan
- [`specs/v1-closeout-20260415/`](specs/v1-closeout-20260415): current `v1` closeout spec and execution plan

## Historical Snapshots

The earlier beta packs and closeout specs are still kept in-tree for auditability, but they no longer define current project status.
