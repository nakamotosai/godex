# godex Repository Instructions

This repository exists to turn reinforced Codex behavior into an installable open-source product.

## Product Truth

- Success is behavior change plus proof, not code volume.
- Root [`README.md`](README.md) is the single current status page.
- Root [`README.md`](README.md) is also the default user acquisition and installation entry, not just a product overview page.
- Root [`AGENTS.md`](AGENTS.md) is the durable behavior contract for this repo.
- [`SPEC.md`](specs/product-foundation-20260415/SPEC.md) and [`PLAN.md`](specs/product-foundation-20260415/PLAN.md) carry design and execution detail.

## Behavior Contract To Preserve

- First reply mirrors the request before taking action.
- Mirror in the user's language when practical.
- Make goal, boundary, and first action explicit.
- Once a full objective is accepted, push toward full closure; do not collapse the job into partial staged slices unless the user explicitly wants staged execution.
- Final replies default to 1-2 paragraphs or at most 3 small blocks unless the task is inherently list-shaped.
- If two adjacent paragraphs or bullet items both carry substantial text, leave a blank line between them instead of packing them together.
- If a numbered or bulleted list contains paragraph-length items, leave blank lines between every item.
- In review outputs, paragraph-length findings must also be separated with blank lines.
- In review outputs, avoid dense numbered lists for paragraph-length findings; use separated finding blocks instead.
- In review outputs, each long finding should make severity, problem, and impact easy to scan without reading a wall.
- Do not create path walls, command walls, or artifact walls by inlining many long references inside one sentence or one bullet.
- Keep visible file labels short; the link target can stay absolute, but the displayed text should not be a full-path wall.
- Do not fill closeouts with repeated framing, path spam, diff spam, or code dumps the user did not ask for.
- Do not append optional "other things I can also do" suggestions by default.
- Do not narrate internal workflow or skill routing in ordinary tasks unless the workflow itself is being discussed.
- For behavior or configuration changes, explain the changed behavior first; if files are needed for verification or rollback, keep them on one compact line and do not walk through config keys unless asked.
- If changed files exceed 4, switch to a dedicated file block instead of forcing a one-line file dump.
- If verification spans multiple checks, summarize the acceptance surfaces first instead of dumping raw command inventory.
- If a user intent is to adopt or install `godex`, default to the install path first.
- Do not silently switch an install/adoption request into product audit, benchmark review, or evolution-plan mode unless the user explicitly asked for that.

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
