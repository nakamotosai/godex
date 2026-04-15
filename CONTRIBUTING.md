# Contributing

`godex` is intentionally small and support-scope driven.

Contributions should strengthen install safety, proof quality, or user clarity.

## Before Opening A PR

Run:

```bash
bash installers/godex-doctor.sh --repo-only
```

```bash
bash benchmarks/scripts/verify_install_surfaces.sh
```

## Before Opening An Issue

Read:

- `docs/TROUBLESHOOTING.md`
- `docs/UPGRADE.md`
- `docs/MANUAL_MERGE.md`

If you still need to file an issue, include:

- install mode
- runtime and OS
- dry-run output
- doctor output
- whether restore was attempted

## Contribution Priorities

- safer install behavior
- clearer doctor and restore behavior
- stronger validation evidence
- docs that reduce maintainer-only knowledge
