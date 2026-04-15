# godex

## This is an installable upgrade for your current Codex

> The primary purpose is simple: install it to strengthen the Codex you already use.
>
> It is not mainly a research repo, a design essay, or a release-package template.
>
> When someone opens this repository, the default thought should be "how do I install this into my Codex?" rather than "how is this product designed?"

> Upgrade vanilla Codex into a clearer, steadier, lower-noise engineering agent.

Chinese-first default README: [README.md](README.md)

`README.md` remains the canonical current-status page for this repository.

## If You Just Want To Install

Do not start by auditing the product structure.

Pick an install mode and execute it directly.

### Quick Paste

Paste this into a fresh Codex session when you want immediate behavior lift without local file changes:

- [prompts/bootstrap/GODEX_BOOTSTRAP.md](prompts/bootstrap/GODEX_BOOTSTRAP.md)

### Recommended: Project Install

Safest default for most users.

```bash
bash installers/install-project.sh --dry-run /path/to/your/repo
```

```bash
bash installers/install-project.sh /path/to/your/repo
```

```bash
/path/to/your/repo/.godex/bin/godex-doctor /path/to/your/repo
```

Guide:

- [docs/PROJECT_INSTALL.md](docs/PROJECT_INSTALL.md)

### Global Install

Broader scope, so preview first.

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

```bash
bash installers/install-global.sh ~/.codex
```

```bash
~/.codex/godex/bin/godex-doctor ~/.codex
```

Guide:

- [docs/GLOBAL_INSTALL.md](docs/GLOBAL_INSTALL.md)

## If You Want Codex To Install It For You

Send the repo link together with a direct install instruction such as:

```text
Install godex from this repository to strengthen my current Codex.

Default to project install. Do not switch into product audit, benchmark review, or evolution-plan mode first.

Read README and docs/PROJECT_INSTALL.md, then run:
1. dry-run
2. install
3. doctor

If preflight returns manual_review, stop and explain that the target AGENTS.md explicitly blocks automatic append, not that it merely "looks complex."
```

## What You Get After Install

- first reply mirrors the task before action
- accepted full objectives stay intact
- verification-before-done
- shorter, clearer closeouts
- stronger retention of repeated user corrections inside the session

## Current Version

- main branch: `v1.0.2-dev`
- latest public release: `v1.0.1`

## Current Boundary

- ordinary structured `AGENTS.md` files now default to additive install
- `manual_review` is reserved for targets that explicitly block automatic godex append
- first-class support target is Codex CLI on Unix-like shells
- Windows currently means WSL / Unix-shell style usage, not PowerShell-first install

## Key Docs

- [docs/PROJECT_INSTALL.md](docs/PROJECT_INSTALL.md)
- [docs/GLOBAL_INSTALL.md](docs/GLOBAL_INSTALL.md)
- [docs/MANUAL_MERGE.md](docs/MANUAL_MERGE.md)
- [docs/TROUBLESHOOTING.md](docs/TROUBLESHOOTING.md)
- [docs/UPGRADE.md](docs/UPGRADE.md)
- [docs/SUPPORT_MATRIX.md](docs/SUPPORT_MATRIX.md)
- [docs/DOCTOR.md](docs/DOCTOR.md)
