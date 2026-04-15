# Acceptance

This document defines what counts as "real progress" for `godex`.

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

## Beta Acceptance

`godex` should not call itself a usable beta until:

1. project install works end to end
2. install backs up before mutation
3. restore can remove the project layer and recover the prior repo state
4. doctor reports meaningful states
5. at least three benchmark tasks exist
6. at least one before/after example pack exists
7. the OSS license is selected

## Public `v1` Acceptance

`godex` should not call itself `v1` until:

1. at least one install mode is fully working and documented
2. doctor is real, not aspirational
3. benchmark can show reproducible improvement
4. the repo survives a real dogfood loop
5. known boundaries are documented honestly
6. global install or an equally strong second install surface exists
7. release assets are ready for a public tag

## Verification For This Repository

Every closeout round should at least check:

- key docs exist
- key docs do not contain unresolved draft-marker language
- README status matches repo reality
- git remote exists
- working tree is clean after closeout
