# Release Closeout Plan

## Phase 1: Freeze The New Closeout Contract

- add a new release-closeout task spec and plan
- treat the four remaining beta gaps as one linked execution round
- keep README as the only live status page

## Phase 2: Ship Global Install v1

- create `installers/install-global.sh`
- create `installers/global-doctor.py`
- create `installers/global-restore.py`
- create `installers/global-benchmark.sh`
- define the managed global block markers and manifest contract
- verify clean install, additive install, reinstall, doctor, benchmark, and restore on temp Codex-home targets

## Phase 3: Ship Release Assets

- create a release-assets pack for the current beta
- include release notes, GitHub release body, short announcement copy, and a release checklist
- sync publish docs to the shipped assets

## Phase 4: Add Broader Install Proof

- create a scripted clean-surface install-proof runner
- cover project install and global install on isolated temp targets
- record one current proof result in the repo

## Phase 5: Tighten Review Output Layout

- strengthen bootstrap and repo-level output rules for review findings
- update project and global managed install blocks to carry the same rule
- add or update examples and benchmark tasks so the layout rule is visible and testable

## Phase 6: Sync Status And Close

- update README and support docs to the new beta reality
- run minimal repo checks plus install-proof verification
- commit, push, and leave the repo clean
