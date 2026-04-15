# `godex` `v1.0.0` Validation Matrix

Date: `2026-04-16`

Primary validated release-candidate commit: `2432eff`

## What Was Verified

All environments below ran the shipped repo doctor and the isolated install-proof script.

The install-proof script covers:

- project install: clean create, dry-run, additive append, safe reinstall, restore
- global install: clean create, dry-run, additive append, safe reinstall, restore
- safe stop states: `manual_review`, `conflicted`, `unsupported`
- health states: `missing`, `healthy`, `partial`, `drifted`, `conflicted`, `unsupported`
- copied benchmark entrypoints for project and global installs

## Validation Matrix

| Environment | Access path | Source material | Result | Notes |
| --- | --- | --- | --- | --- |
| `vps-jp` local maintainer machine | local shell | current repo checkout at `2432eff` | Pass | `bash installers/godex-doctor.sh --repo-only` passed |
| `vps-jp` local maintainer machine without `rg` on `PATH` | local shell with wrapped `PATH` | current repo checkout at `2432eff` | Pass | `bash benchmarks/scripts/verify_install_surfaces.sh` passed with `grep` fallback only |
| `vps-us.tail4b5213.ts.net` | Tailscale + SSH | `git archive` of `2432eff` streamed into a temp dir | Pass | full repo doctor + install proof passed |
| `home-windows.tail4b5213.ts.net` in WSL bash | Tailscale + SSH | local tar archive plus remote WSL temp dir | Pass | full repo doctor + install proof passed in Unix-shell mode |

## Command Set

Local repo doctor:

```bash
bash installers/godex-doctor.sh --repo-only
```

Local install proof:

```bash
bash benchmarks/scripts/verify_install_surfaces.sh
```

Local install proof without `rg`:

```bash
PATH="<wrapped-without-rg>" /usr/bin/bash benchmarks/scripts/verify_install_surfaces.sh
```

Remote `vps-us` verification:

```bash
git archive --format=tar HEAD | ssh vps-us.tail4b5213.ts.net '... bash installers/godex-doctor.sh --repo-only; bash benchmarks/scripts/verify_install_surfaces.sh'
```

Remote `home-windows` verification:

```bash
scp /tmp/godex-2432eff.tar home-windows.tail4b5213.ts.net:godex-2432eff.tar
ssh home-windows.tail4b5213.ts.net 'cmd /c bash -lc "/mnt/c/Users/sai/godex-home-windows-validate-2432eff.sh"'
```

## Result Summary

- `v1` install surfaces passed on the maintainer machine, a second Linux VPS, and a Windows machine running WSL bash.
- The GitHub Actions failure mode was reproduced locally in principle and closed by removing the hard dependency on `rg` inside shipped verification paths.
- The supported Windows story remains Unix-shell style usage through WSL bash, not native PowerShell-first install.

## Current Boundary

- `macbook-pro.tail4b5213.ts.net` was reachable on Tailnet but not included in this matrix because SSH access was denied during the closeout window.
- This record is broader than maintainer-only proof, but it is still not broad public-scale community validation.
