# Acceptance

This document defines what counts as "real progress" for `godex`.

## Current Accepted State

`godex` is allowed to call itself `v1.0.1` when all of these are true:

1. quick paste, project install, and global install all exist and are documented
2. both durable install modes back up before mutation and can restore prior state
3. doctor and install proof both pass
4. global `--dry-run` leaves a missing Codex-home target untouched
5. complex custom `AGENTS.md` cases stop safely and route to `docs/MANUAL_MERGE.md`
6. broader validation evidence exists beyond the maintainer primary workspace
7. release assets, support docs, and GitHub support surfaces are aligned
8. the repo can be committed, pushed, tagged, and left clean

## Foundation Round Acceptance

The product foundation passes when all of these are true:

1. the root README reads like a public product page
2. current repository reality matches the root README
3. the repo-level behavior contract is explicit
4. compatibility and install safety are explicit
5. publish and release gates are explicit
6. the bootstrap prompt exists in draft form
7. prompt, skills, installers, benchmarks, and examples directories no longer read like empty shells
8. the repo can be committed, pushed, and kept clean

## Public Beta Acceptance

`godex` should not call itself a real public beta until:

1. project install works end to end
2. global install works end to end
3. both install types back up before mutation
4. both install types can restore the previous `AGENTS.md` state
5. doctor reports meaningful states for both install types
6. an isolated clean-surface install proof script exists and passes
7. at least one recorded install proof document exists
8. before/after example packs exist for shipped install surfaces
9. release assets are ready for a public beta packaging pass
10. the OSS license is selected

## Public `v1` Acceptance

`godex` should not call itself `v1` until:

1. the two install modes stay stable across repeated real use
2. doctor is real, not aspirational
3. benchmark can show reproducible improvement beyond maintainer-only comparisons
4. broader outside-user validation exists
5. known boundaries are documented honestly
6. complex custom-policy conflict handling is better than today's manual-review boundary
7. release and tagging flow is fully exercised in the wild

For `v1.0.1`, item 6 is satisfied by safe stop plus explicit manual-merge guidance, not by universal auto-merge.

## Verification For This Repository

Every closeout round should at least check:

- key docs exist
- key docs do not contain unresolved draft-marker language
- README status matches repo reality
- install proof script passes
- git remote exists
- working tree is clean after closeout
