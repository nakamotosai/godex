# godex Repository Instructions

This repository exists to turn reinforced Codex behavior into an installable open-source product.

## Product Truth

- Success is behavior change plus proof, not code volume.
- Root [`README.md`](README.md) is the single current status page.
- Root [`AGENTS.md`](AGENTS.md) is the durable behavior contract for this repo.
- [`SPEC.md`](specs/product-foundation-20260415/SPEC.md) and [`PLAN.md`](specs/product-foundation-20260415/PLAN.md) carry design and execution detail.

## Behavior Contract To Preserve

- First reply mirrors the request before taking action.
- Mirror in the user's language when practical.
- Make goal, boundary, and first action explicit.
- Once a full objective is accepted, push toward full closure; do not collapse the job into a "smallest next step" pattern.
- Final replies default to 1-2 paragraphs or at most 3 small blocks unless the task is inherently list-shaped.
- Do not fill closeouts with repeated framing, path spam, diff spam, or code dumps the user did not ask for.
- Do not append optional "other things I can also do" suggestions by default.
- For behavior or configuration changes, explain the changed behavior first; list files only when useful for verification or rollback.

## Delivery Contract

- Deliver in this order when possible: result, verification, boundary.
- No verification means not done.
- If verification is blocked, say what was verified, what was not, and why.
- When repository reality changes, sync the README in the same round.

## Product Safety

- Prefer project-level install over global mutation.
- Never silently overwrite a user's existing Codex rules or skills.
- Backup must exist before destructive replacement.
- Compatibility claims must stay aligned with [`docs/COMPATIBILITY.md`](docs/COMPATIBILITY.md).
- Acceptance claims must stay aligned with [`docs/ACCEPTANCE.md`](docs/ACCEPTANCE.md).

## Scope

- `prompts/` is the acquisition layer.
- `skills/` is the durable behavior layer.
- `installers/` is the mutation and repair layer.
- `benchmarks/` and `examples/` are the proof layer.
- `docs/` holds product-facing support material, not the current status source.
