# Release Closeout Spec

## Goal

Close the four remaining `godex` beta gaps in one continuous release-closeout round:

1. ship a real global install
2. ship reusable release assets
3. add broader install proof beyond the maintainer workspace loop
4. tighten the remaining review-output layout weakness

This phase succeeds when `godex` is no longer a project-install-only beta with internal proof, but a stronger public beta with two install surfaces, install evidence on isolated targets, and a clearer answer for review-style output formatting.

## Scope

### 1. Global Install v1

Ship a real global installer aimed at a Codex home directory such as `~/.codex`.

It must support:

- clean install when no root `AGENTS.md` exists
- additive install when a simple root `AGENTS.md` already exists
- reinstall or upgrade of an existing managed `godex` global block
- restore back to the original `AGENTS.md`

The install must stay non-destructive and must not depend on the maintainer repo after installation.

### 2. Release Assets

Ship a release-asset pack that is ready to publish to GitHub without improvising at release time.

Minimum surfaces:

- release notes
- GitHub release body
- short public announcement copy
- a release checklist tied to the actual beta contract

### 3. Broader Install Proof

Add proof beyond the maintainer's own active Codex workspace.

This phase does not require external human beta testers, but it does require isolated clean-surface evidence:

- temp repo targets for project install
- temp Codex-home targets for global install
- clean install, reinstall, doctor, benchmark, and restore coverage where applicable

The proof must be scripted and the current result must be written down in the repo.

### 4. Review Output Layout Tightening

Strengthen the remaining weak spot from earlier benchmark rounds:

- long review findings still stack too tightly

The fix must be applied across the real behavior surfaces that `godex` ships:

- bootstrap prompt
- repo behavior contract
- project install block
- global install block
- examples and benchmark tasks where needed

The target is not “more compact at all costs”.

The target is readable findings with visible breathing room and behavior-first signal.

## Non-Goals

This phase does not include:

- building a full external skill marketplace
- automatic conflict merge for arbitrary complex user `AGENTS.md`
- claiming community-wide validation
- turning benchmark work into a large automation harness

## Constraints

- keep the global install lean and reversible
- never silently overwrite user-global rules
- stay honest about what is proven versus what is only designed
- keep README as the single current status page

## Acceptance

1. `install-global` works end to end on a clean Codex-home target.
2. `install-global` safely augments a Codex-home target with a simple existing `AGENTS.md`.
3. global backup and restore are real and verified.
4. global doctor reports meaningful states at least including `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`, and `missing`.
5. release assets exist and match the actual beta stage.
6. an install-proof script verifies isolated project-install and global-install targets.
7. one recorded proof document exists for the current clean-surface run.
8. review-output layout rules are strengthened across shipped behavior surfaces.
9. README, install docs, doctor docs, publish docs, examples, and release assets all match shipped reality.
10. the repo is committed, pushed, and clean.

## Expected Stage After This Phase

If this phase succeeds, `godex` should be able to say:

- it has two real install surfaces: project and global
- both installs are backup-first and restorable
- doctor can inspect both install types
- release assets are ready for public beta packaging
- install proof exists beyond the maintainer workspace itself
- review-style layout guidance is materially stronger than in earlier benchmark rounds

It still should not claim:

- universal merge with arbitrary custom global policies
- broad community validation
- perfect formatting in every possible client UI
