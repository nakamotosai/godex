# V1 Closeout Spec

## Goal

Move `godex` from a real public beta into an honest, supportable `v1.0.0` release that can be published on GitHub without hand-waving.

This phase succeeds when an ordinary user can:

1. understand what `godex v1` supports and what it does not
2. choose a safe install mode
3. install, verify, and restore it without maintainer-only context
4. understand how to report problems and what evidence to attach
5. find a real tagged GitHub release with accurate notes and known boundaries

## Product Decision

`v1` should stay lean.

It does **not** need to solve universal automatic merge for arbitrary custom global policies.

Instead, `v1` should explicitly choose:

- safe install over clever install
- conflict detection over silent mutation
- dry-run and guided manual merge over fake "auto support"
- honest support scope over broad but fragile claims

## V1 Product Contract

For `v1`, `godex` should formally support:

- quick paste bootstrap
- project install
- global install

First-class runtime target:

- Codex CLI on Linux, macOS, and WSL-style Unix shells

Allowed but not first-class:

- other Codex surfaces that still read local `AGENTS.md`

Not claimed in `v1`:

- universal support for every non-CLI runtime
- native Windows PowerShell-first install experience
- automatic merge with arbitrary existing global policy stacks

## Scope

### 1. V1 Support Matrix And User Contract

Make the `v1` support surface explicit and tight.

This includes:

- supported runtime matrix
- supported install modes
- known unsupported or manual-review cases
- what doctor and restore do and do not guarantee

### 2. Safe Conflict Handling For Existing Policies

The remaining hard product gap is not "no global install".

It is "what happens when a real user already has complex global rules".

`v1` should solve this by shipping a safe preflight and conflict-handling contract:

- install preview or dry-run before mutation
- classification of target state
- safe stop on complex custom policy
- generated manual-merge guidance instead of destructive mutation

Required outcome:

- simple cases install cleanly
- already-managed cases upgrade cleanly
- complex custom cases stop safely and truthfully

### 3. Trust, Troubleshooting, And GitHub Support Surfaces

`v1` needs to be usable by strangers on GitHub, not only by the maintainer.

That requires:

- troubleshooting guide
- upgrade / rollback guide
- contributing or bug-report guidance
- GitHub issue templates for install problems and product bugs
- repo-level CI or release guard that checks the shipped install surfaces

These should stay lightweight and directly tied to the real install and proof chain.

### 4. Broader Validation Beyond Maintainer Dogfood

Public beta already proved that the install surfaces work on isolated local targets.

`v1` needs a broader validation contract.

That does not require a giant formal beta program, but it does require more than one maintainer-run proof.

`v1` should require a validation matrix such as:

- isolated clean repo targets
- isolated clean Codex-home targets
- at least two additional real environments or users beyond the maintainer's primary workspace
- explicit recording of conflicts, successful installs, and restoration outcomes

The validation record must live in the repo.

### 5. Release Packaging And GitHub Release

`v1` must include a real GitHub release path, not only a release pack directory.

This includes:

- versioning policy for `v1.0.0`
- release notes
- changelog entry
- GitHub release body
- upgrade notes
- known-boundary section
- annotated tag creation
- post-tag smoke verification from the tagged source

### 6. Post-Release Support Floor

`v1` should not ship without a minimum support loop.

That means:

- users know where to file issues
- install failures have a template with expected evidence
- release notes link to install, doctor, restore, and troubleshooting docs
- first patch release path is already defined if `v1.0.0` reveals issues

## Non-Goals

This phase does not include:

- broad plugin ecosystem work
- Codex Desktop-specific bespoke install logic
- a large automated benchmark lab
- universal auto-merge for arbitrary custom global configs
- pretending community validation exists before it does

## Constraints

- keep runtime context lean
- keep install surfaces reversible
- do not silently mutate complex custom global policies
- keep README as the single current status page
- keep GitHub release messaging aligned with actual support scope

## Acceptance

1. `v1` support matrix is explicit in repo docs and README.
2. project install and global install both support a preview or dry-run style preflight before risky mutation.
3. complex custom global policy cases stop safely and emit manual-merge guidance instead of mutating silently.
4. doctor, restore, install docs, troubleshooting docs, and upgrade docs are aligned.
5. GitHub support surfaces exist:
   `CONTRIBUTING` or equivalent guidance, issue templates, and a minimal CI/release guard.
6. broader validation evidence exists beyond the maintainer primary workspace and is recorded in the repo.
7. a real `v1.0.0` release pack exists, including changelog and GitHub release body.
8. a tagged-source smoke path is defined and verified before release.
9. README, publish docs, acceptance docs, compatibility docs, and release assets all match the `v1` contract.
10. the repo is committed, pushed, tagged, and clean at release time.

## Expected Outcome

If this phase succeeds, `godex` should be able to say:

- it is an honest `v1.0.0`
- project and global install are real, safe, and supportable
- complex global policy cases are handled safely even when not auto-merged
- GitHub release, docs, and support surfaces are ready for strangers

It still should not claim:

- universal support for every Codex runtime
- broad community-scale validation
- zero-friction merge with arbitrary custom global instruction stacks
