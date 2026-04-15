# Install Compatibility Plan

## Phase 1

Add failing proof cases for:

- a structured but compatible `AGENTS.md`
- an explicit opt-out `AGENTS.md`

The first case should currently fail and prove the false-positive.

## Phase 2

Replace markdown-layout complexity scoring with compatibility gating:

- keep marker conflict handling
- keep managed-block replacement
- default ordinary existing `AGENTS.md` to `ready_append`
- reserve `manual_review` for explicit no-auto-append signals

## Phase 3

Sync product truth across:

- `README.md`
- `README.en.md`
- install docs
- troubleshooting
- manual merge guide
- compatibility and installer docs
- changelog

## Phase 4

Run:

- `bash benchmarks/scripts/verify_install_surfaces.sh`
- `bash installers/godex-doctor.sh --repo-only`

Then commit, push, and confirm the repo is clean.
