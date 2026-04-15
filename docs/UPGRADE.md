# Upgrade Guide

## From Public Beta To `v1`

Before upgrading, always run preflight first.

Project:

```bash
bash installers/install-project.sh --dry-run /path/to/repo
```

Global:

```bash
bash installers/install-global.sh --dry-run ~/.codex
```

## Expected Upgrade Paths

- `ready_replace`: safe managed upgrade
- `ready_append`: safe additive upgrade
- `ready_create`: first install, not an upgrade
- `manual_review`: stop and use `docs/MANUAL_MERGE.md`

## Upgrade Then Verify

Project:

```bash
bash installers/install-project.sh /path/to/repo
/path/to/repo/.godex/bin/godex-doctor /path/to/repo
```

Global:

```bash
bash installers/install-global.sh ~/.codex
~/.codex/godex/bin/godex-doctor ~/.codex
```

## Roll Back

Project:

```bash
/path/to/repo/.godex/bin/godex-restore /path/to/repo
```

Global:

```bash
~/.codex/godex/bin/godex-restore ~/.codex
```

## Release Upgrade Notes

When upgrading across tagged releases, also read:

- `CHANGELOG.md`
- `releases/v1.0.0/RELEASE_NOTES.md`
- `docs/TROUBLESHOOTING.md`
