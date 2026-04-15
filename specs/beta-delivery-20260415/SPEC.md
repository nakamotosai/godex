# Beta Delivery Spec

## Goal

Move `godex` from a strong dogfood foundation into a real public beta centered on one install mode that ordinary Codex users can actually use:

1. install into one project safely
2. verify the install with doctor
3. run a small proof loop that shows the upgrade is real
4. understand the product boundary without reading private maintainer context

This phase is successful when `godex` is no longer just a promising repo with internal proof, but a project-first beta that another user can install and evaluate with confidence.

## Product Decision

This phase explicitly chooses:

- `project install` as the beta-defining install mode
- `global install` as deferred work, not part of beta exit
- a project-local install footprint built around:
  - root `AGENTS.md`
  - project-local `.godex/`
  - repo-local doctor / benchmark / example surfaces

This keeps mutation local, rollback understandable, and the product honest.

## Target User Story

A mostly vanilla Codex user with one repository should be able to:

1. run one project installer command
2. keep their previous repo state backed up
3. open the repo in Codex and get `godex` behavior through the installed project layer
4. run doctor and see whether the install is healthy, partial, drifted, conflicted, unsupported, or missing
5. run one quick benchmark/example loop and understand what improved

without needing the maintainer's private workspace, private skills, or private path layout.

## Scope

### 1. Project Install v1

Ship a real project installer that supports:

- clean install into a repo without an existing root `AGENTS.md`
- additive install into a repo with a simple existing root `AGENTS.md`
- upgrade of an already-installed `godex` project layer

The install should write a project-local footprint under `.godex/` and keep the root `AGENTS.md` readable and intentionally small.

### 2. Backup + Restore Contract

Project install must be non-destructive.

That means:

- backup before mutation
- install manifest recording what was added or changed
- a documented restore path
- clear stop behavior when the existing repo state is unsupported or conflicted

### 3. Installer-Grade Doctor

Upgrade doctor from dogfood health-check to install-aware doctor.

It must understand project install state and return meaningful classes:

- `healthy`
- `partial`
- `drifted`
- `conflicted`
- `unsupported`
- `missing`

### 4. Proof Loop For New Users

The beta must include at least one fast trust loop after install:

- one quick benchmark path or equivalent proof task
- one before/after example pack
- one install walkthrough showing what the user should expect

This does not need full benchmark automation yet, but it must feel like a usable evaluation surface, not a maintainer-only lab note.

### 5. Public Packaging Truth

The beta must close the public-product gaps that still block credible release:

- select an OSS license
- sync README and support docs to the beta contract
- document known boundaries honestly
- keep install and doctor docs aligned with the real shipped scripts

## Install Footprint Contract

The project install v1 footprint should be:

```text
<target-repo>/
  AGENTS.md
  .godex/
    manifest.json
    backups/
    bin/
      godex-doctor
      godex-benchmark
      godex-restore
    docs/
    examples/
```

Rules:

- visible project behavior should come primarily from root `AGENTS.md`
- `.godex/` should hold mutable support assets, manifests, backups, and helper entrypoints
- the installer must not depend on `/home/ubuntu/codex/godex` or any maintainer-only absolute path after install

## Root `AGENTS.md` Contract

Project install v1 should not dump a giant wall of instructions into the target repo.

Instead it should install a lean project policy block that preserves the strongest `godex` defaults:

- first-reply mirroring
- full-objective retention
- verification-before-done
- scenario-shaped low-noise closeout
- behavior-first reporting

If the target repo already has an `AGENTS.md`, the installer must do one of three things:

- cleanly add a delimited `godex` block and preserve the original content
- upgrade an existing `godex` block in place
- stop with `conflicted` if safe additive install is not possible

Silent overwrite is forbidden.

## Doctor Contract

Doctor v2 must answer:

1. is `godex` installed here
2. is the install intact
3. if not intact, is the problem missing, partial, drifted, conflicted, or unsupported
4. what is the smallest truthful next recovery action

Minimum checks:

- root `AGENTS.md` has the expected `godex` block or markers
- `.godex/manifest.json` exists and parses
- installed helper scripts exist
- expected doc/example surfaces exist
- installed files still match manifest expectations where applicable

## Benchmark + Example Contract

Beta should expose two proof surfaces:

### Quick Benchmark

A small user-facing command path that proves the install is active and measurable.

It does not need to compare against vanilla automatically, but it must be runnable and documented from the installed project surface.

### Before/After Example Pack

At least one curated example pack showing:

- baseline behavior
- `godex` behavior
- why the difference matters

The current benchmark rounds should feed this pack instead of staying only as internal scoring notes.

## License Decision

This phase should select `MIT` unless implementation discovers a concrete blocker.

Reason:

- lowest friction for a prompt / rules / scripts product
- matches the product goal of wide reuse
- avoids blocking beta on prolonged legal indecision

## Non-Goals

This phase explicitly does not include:

- universal `global install`
- automatic merge for every possible pre-existing `AGENTS.md`
- a public install of the entire private maintainer skill stack
- solving every remaining output-aesthetic edge case before beta
- a fully automated benchmark lab

## Constraints

- keep context injection lean
- do not silently overwrite user project state
- do not ship installer behavior that only works in the maintainer workspace
- keep Codex CLI as the first-class target
- preserve honest README status throughout the phase

## Acceptance

1. `install-project` works end to end on a clean sample repo.
2. `install-project` either safely augments or truthfully rejects a repo with an existing simple `AGENTS.md`.
3. backup + restore are real and documented, not aspirational.
4. doctor reports meaningful project-install states including `drifted`, `conflicted`, and `unsupported`.
5. at least one quick proof loop exists after install.
6. at least one before/after example pack exists.
7. `LICENSE` is present.
8. README, installer docs, doctor docs, and acceptance docs all match shipped reality.
9. the repo is committed, pushed, and clean.

## Beta Boundary After This Phase

If this phase succeeds, `godex` should be able to say:

- it has one real install mode
- that install mode is project-first and non-destructive
- doctor can assess the installed state
- proof of upgrade exists for ordinary users

It should still not claim:

- universal global install
- perfect merge with arbitrary custom repo policies
- every output-formatting edge case fully solved
