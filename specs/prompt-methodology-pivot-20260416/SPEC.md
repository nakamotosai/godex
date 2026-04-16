# Prompt Methodology Pivot Spec

## Goal

Turn `godex` from an install-first upgrade package into a prompt-first methodology product.

This round succeeds when a new user can open the repository, see one canonical pure-text prompt, and use that prompt to let their own Codex inspect local reality, adapt to what already exists, fill only the missing durable layers, handle conflicts conservatively, and verify the resulting setup without depending on `godex` installers.

## Problem

The current release shape assumes installability can be standardized:

- project install
- global install
- managed `AGENTS.md` blocks
- doctor plus post-install proof

Real users are proving that assumption too narrow.

Different Codex setups already have:

- their own `AGENTS.md` structure
- their own skills and workflows
- partial overlap with `godex` behavior
- different tolerance for automation or file mutation

That makes the current product easy to misunderstand:

- some users read it as a package to install unchanged
- some local policies reject automatic append
- some users need selective adoption, not full mutation
- some users need their own Codex to design the durable layer, not import ours directly

## Product Decision

`godex` should now ship primarily as a methodology prompt.

The prompt must tell the target Codex to:

1. inspect the local Codex environment first
2. identify which high-value behaviors already exist
3. add only what is missing or materially weak
4. decide whether each improvement belongs in `AGENTS.md`, local skills, workflow docs, templates, or existing memory surfaces
5. preserve the user's own rules and naming where possible
6. handle conflicts conservatively instead of forcing a merge
7. run a local conflict-and-acceptance check after changes
8. keep context size under control instead of dragging the whole methodology into every task forever

## Scope

- write one new canonical methodology prompt as the primary product artifact
- update root product messaging so prompt-first is the default interpretation
- update prompt-layer docs so they no longer describe prompt-only as a temporary on-ramp to install
- mark the old install-first framing as historical or secondary instead of current product truth
- sync the repository changelog to the pivot

## Non-Goals

- deleting installer code in this round
- rewriting every historical release asset
- publishing a new release tag in this round
- inventing a second large documentation tree for the same prompt

## Constraints

- keep the methodology understandable to non-expert Codex users
- keep the main prompt self-sufficient enough to paste into a real session
- avoid turning the prompt into a giant context brick
- keep repository truth aligned: root `README.md` must match the new product direction
- preserve useful historical assets without letting them remain the default call to action

## Acceptance

1. The repository has one clearly signposted canonical pure-text prompt for self-adapting Codex upgrades.
2. That prompt explicitly covers:
   - local inspection first
   - selective adoption of missing behaviors
   - conflict handling
   - spec/workflow setup when absent
   - verification before done
   - context control
3. Root `README.md` now presents prompt-first methodology as the primary release form.
4. Prompt docs no longer frame prompt-only usage as merely a bridge toward durable install.
5. Historical install surfaces are clearly demoted so a reader is less likely to mistake them for the default path.
6. The prompt text and linked docs are internally consistent after a manual full-text acceptance pass.
