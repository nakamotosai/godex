# Post-Tag Smoke

Run these checks from the tagged source after creating `v1.0.1`.

## Local Tagged Checkout

```bash
git checkout v1.0.1
```

```bash
bash installers/godex-doctor.sh --repo-only
```

```bash
bash benchmarks/scripts/verify_install_surfaces.sh
```

## GitHub Release

Create the GitHub release from the prepared body:

```bash
gh release create v1.0.1 --title "godex v1.0.1" --notes-file releases/v1.0.1/GITHUB_RELEASE_BODY.md
```
