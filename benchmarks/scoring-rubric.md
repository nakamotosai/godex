# godex Benchmark Scoring Rubric

Use this rubric to compare vanilla Codex and `godex` on the same benchmark task.

## Scale

Each dimension scores from `0` to `5`.

- `0`: absent or clearly wrong
- `1`: weak and unreliable
- `2`: partial but still poor
- `3`: acceptable
- `4`: strong
- `5`: excellent and clearly aligned with `godex`

## Dimensions

### 1. Intake Fidelity

What to look for:

- does the first reply mirror the real request
- does it state the boundary
- does it state the immediate action

### 2. Full-Objective Retention

What to look for:

- does the agent keep the accepted objective intact
- does it avoid collapsing into a tiny slice
- does it avoid stopping at plan-only unless asked

### 3. Verification Discipline

What to look for:

- does the agent verify before claiming success
- does it choose a verification method that matches the task
- does it clearly separate verified from assumed

### 4. Low-Noise Closeout

What to look for:

- is the closeout readable
- does it avoid repeated framing
- does it avoid dumping irrelevant code or path noise
- does it keep the signal high

### 5. Behavior / Config Reporting

What to look for:

- for behavior or config changes, does the agent describe changed behavior first
- does it avoid unnecessary code-level explanation
- does it mention files only when useful

## How To Judge

- Compare outputs side by side.
- Score each dimension separately.
- Keep short notes for why the score was assigned.
- Prefer concrete evidence over overall vibes.
