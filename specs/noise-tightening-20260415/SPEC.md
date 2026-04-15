# Noise Tightening Spec

## Goal

Remove the remaining obvious behavior weaknesses exposed by benchmark round 1:

1. closeouts still feel too process-heavy
2. behavior/config change reporting still drifts into implementation detail
3. spec escalation still triggers too aggressively on medium-light tasks

This round should strengthen the current maintainer dogfood stack first, then package the same tightening into `godex`.

## Scope

- tighten the current local Codex instruction layers that shape these behaviors
- tighten the local `spec-driven-delivery` skill so it escalates less often
- update the `godex` public behavior contract and bootstrap prompt to reflect the new defaults
- sync `godex` docs/README if product truth changes

## Non-Goals

- changing the benchmark rubric
- inventing a new workflow system
- removing verification discipline
- removing the user's ability to inspect changed files when behavior rules are changed

## Constraints

- do not weaken first-reply mirroring
- do not weaken full-objective retention
- do not weaken verification-before-done
- reduce noise by removing low-value reporting, not by hiding real boundaries or proof

## Acceptance

1. Local instruction layers explicitly suppress unnecessary workflow/skill narration in ordinary tasks.
2. Behavior/config change closeouts now default to:
   - changed behavior
   - one compact file list when verification/audit needs it
   - verification
   - boundary
3. Local spec escalation guidance clearly exempts medium-light config/doc/rule changes with clear acceptance.
4. `godex` repo behavior contract and bootstrap prompt match the tightened defaults.
5. `godex` repo docs remain truthful and committed cleanly.
