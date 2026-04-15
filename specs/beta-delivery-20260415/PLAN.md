# Beta Delivery Plan

## Phase 1: Freeze The Beta Contract

- Update repo status to make beta-delivery the new mainline
- Write the project install footprint, doctor states, and proof-loop contract into the repo
- Keep `global install` explicitly deferred

## Phase 2: Build Project Install v1

- Create `installers/install-project.sh`
- Create backup / restore support entrypoints
- Define the generated root `AGENTS.md` block format and marker strategy
- Define `.godex/manifest.json`
- Verify on:
  - clean repo with no `AGENTS.md`
  - repo with a simple existing `AGENTS.md`
  - already-installed repo upgrade path

## Phase 3: Upgrade Doctor To Installer Grade

- Expand `installers/godex-doctor.sh`
- Teach it install-aware states:
  - `healthy`
  - `partial`
  - `drifted`
  - `conflicted`
  - `unsupported`
  - `missing`
- Add fixtures or scripted checks for each state where practical

## Phase 4: Add User-Facing Proof Surfaces

- Ship one quick benchmark command path from installed `.godex/bin/`
- Convert current benchmark rounds into at least one public before/after example pack
- Add one install walkthrough showing:
  - install
  - doctor
  - quick proof loop

## Phase 5: Public Packaging

- Select `MIT` and add `LICENSE`
- Sync README, installers docs, doctor docs, acceptance docs, and publish docs
- Keep current boundaries explicit, especially:
  - no global install yet
  - limited additive install support for complex pre-existing `AGENTS.md`
  - remaining review-output density gap

## Phase 6: Verification And Close

- Verify project install on at least two repo shapes
- Verify backup + restore
- Verify doctor state transitions
- Verify quick benchmark / example pack entrypoints
- Run repo-level doc and status checks
- Commit, push, and leave the repo clean
