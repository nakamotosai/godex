---
name: godex-doctor
description: Check whether the current `godex` repo and local Codex workspace are actually dogfood-ready.
---

# godex Doctor

Run the first `godex` doctor and interpret the result.

## Command

```bash
bash /home/ubuntu/codex/godex/installers/godex-doctor.sh /home/ubuntu/codex
```

## What It Checks

- repo assets
- dogfood spec assets
- benchmark assets
- current workspace dogfood install

## Output Contract

Explain:

- overall status
- what is present
- what is missing
- what remains intentionally out of scope
