# V1 Closeout Plan

## Phase 1: Freeze The V1 Contract

- add a new `v1-closeout` task spec and plan
- define the supported runtime matrix for `v1`
- define what `v1` does not claim
- sync README to make `v1` closeout the current mainline

## Phase 2: Safe Conflict Handling Upgrade

- add preview or dry-run support to project and global install flows
- classify target states before mutation
- for complex custom global policies, stop safely and emit merge guidance
- keep doctor and restore aligned with the new preflight behavior

Primary files likely involved:

- `installers/install-project.sh`
- `installers/install-global.sh`
- `installers/project-doctor.py`
- `installers/global-doctor.py`
- new shared helper or docs if needed

## Phase 3: Support And Troubleshooting Surfaces

- add `docs/TROUBLESHOOTING.md`
- add `docs/UPGRADE.md`
- add lightweight contribution / bug-report guidance
- add GitHub issue templates for install failures and product bugs

Primary files likely involved:

- `docs/`
- `CONTRIBUTING.md`
- `.github/ISSUE_TEMPLATE/`

## Phase 4: GitHub Release Guard

- add a minimal GitHub Actions workflow that runs repo doctor and install proof
- ensure the workflow is the release gate for tag readiness
- keep the workflow lean and tied to real shipped behavior

Primary files likely involved:

- `.github/workflows/ci.yml`
- `benchmarks/scripts/verify_install_surfaces.sh`
- docs that explain the gate

## Phase 5: Broader Validation Matrix

- define the `v1` validation matrix
- record maintainer-run isolated proof plus additional environment or user validation
- keep a durable validation record in the repo

Primary files likely involved:

- `benchmarks/runs/`
- `docs/`
- release checklist and validation notes

## Phase 6: Release Packaging

- create `CHANGELOG.md`
- create a `releases/v1.0.0/` pack
- prepare GitHub release notes, upgrade notes, known boundaries, and announcement copy
- define the exact tag and post-tag smoke sequence

Primary files likely involved:

- `CHANGELOG.md`
- `releases/v1.0.0/`
- `docs/PUBLISH.md`
- `README.md`

## Phase 7: Release Execution And Close

- run final repo doctor and install proof
- confirm validation matrix and GitHub support surfaces are complete
- cut annotated tag `v1.0.0`
- publish the GitHub release from the prepared release pack
- run tagged-source smoke verification
- leave the repo clean and the README aligned
