# Project Install

`godex v1` stays project-first.

The main install path is:

```bash
bash installers/install-project.sh /path/to/target-repo
```

Preview first:

```bash
bash installers/install-project.sh --dry-run /path/to/target-repo
```

## What It Adds

Project install writes:

- root `AGENTS.md` with a lean managed `godex` block
- `.godex/manifest.json`
- `.godex/bin/godex-doctor`
- `.godex/bin/godex-restore`
- `.godex/bin/godex-benchmark`
- `.godex/docs/PROJECT_INSTALL.md`
- `.godex/examples/project-install-beta/README.md`
- `.godex/examples/project-install-beta/intake-closeout-example.md`

## Safety Rules

- never silently overwrite an existing `AGENTS.md`
- backup before mutation
- create a fresh root `AGENTS.md` if the repo did not already have one
- replace an existing managed `godex` block in place
- append a new managed block if the repo has a simple pre-existing `AGENTS.md`
- stop with `manual_review` if the existing `AGENTS.md` is too complex for safe automatic append
- stop with conflict if markers are broken or duplicated

## Verify After Install

Run:

```bash
/path/to/target-repo/.godex/bin/godex-doctor /path/to/target-repo
```

Then:

```bash
/path/to/target-repo/.godex/bin/godex-benchmark /path/to/target-repo
```

## Restore

To remove the installed project layer and restore the previous `AGENTS.md` backup:

```bash
/path/to/target-repo/.godex/bin/godex-restore /path/to/target-repo
```

The restore path keeps backups under `.godex-backups/`.

## Installed Behavior

The managed project block is intentionally small.

It enforces the strongest `godex` defaults that matter to ordinary users:

- first reply mirrors the task before action
- accepted full objectives stay intact instead of shrinking into a "smallest next step" handoff
- done requires verification
- review-style long findings must be separated with real blank lines
- closeouts report behavior first and stay visually readable

## Current Boundary

Project install remains the safest default install mode.

Global install now exists as the broader Codex-home option.

If preflight returns `manual_review`, use `docs/MANUAL_MERGE.md`.
