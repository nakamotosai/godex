# Intake And Closeout Example

## Prompt

`把登录页按钮改成蓝色，改完直接验证，并告诉我现在的行为。`

## Typical Vanilla Pattern

- the first reply may jump straight into tools without restating the task boundary
- the closeout may spend too much space on code churn, paths, or optional follow-up ideas
- the task can drift toward a partial handoff instead of a fully closed change

## Intended `godex` Pattern

- the first reply mirrors the accepted task before any action
- the full objective stays intact instead of collapsing into a "smallest next step" closeout
- the final reply says what now works, what was verified, and what boundary still remains
- changed files stay visible only when they matter for checking or rollback

## Why The Difference Matters

This makes the upgrade easier to trust.

The user can quickly see:

- whether Codex understood the job
- whether the whole job was actually finished
- whether the answer reports behavior instead of burying signal under implementation detail
