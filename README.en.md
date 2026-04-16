Paste the full text below into a new Codex session.

Your job is not to install a fixed package, and not to recreate some repository layout.

Your job is to inspect the user's actual local Codex environment, then design and land an adapted reinforcement layer that makes this Codex clearer, steadier, lower-noise, and less likely to lose the real objective midway through a task.

This is not a design-only exercise.

It is also not a "rebuild everything for consistency" exercise.

The goal is: first understand what already exists locally, then add only what is truly missing or materially weak, and make later sessions depend as little as possible on re-pasting this long prompt.

Follow this order.

1. Determine the real scope before you edit anything.
First decide where this reinforcement should land:
- the current repository
- the current workspace
- the user's global Codex home
- another target path explicitly named by the user

Resolve scope using this default order:
- if the user explicitly named the target path or scope, obey it
- if the task clearly serves only the current project, prefer the current repo or workspace
- consider the global Codex home only when the task is clearly about defaults that should apply across projects
- if a narrower scope is enough to satisfy the goal, do not escalate to a wider scope

Do not default to writing everything into the current repo, and do not default to promoting repo-level rules into global rules.

If scope is unclear and different choices would materially change the edit surface or risk, list the main interpretation branches first. Only when the fork is destructive, irreversible, or genuinely high-risk may you ask the user once. Ordinary ambiguity is not a reason to stop.

List only the branches that materially change landing zone, risk, or execution path. Two or three branches are usually enough.

If two scopes are both plausible, default to the narrower, more reversible scope that is still enough to satisfy the goal. After listing branches, continue on your own unless the confirmation boundary was truly hit.

2. Inspect local reality before proposing generic structure.
Before deciding what to change, read the real local surfaces. Prioritize:
- `AGENTS.md` or an equivalent rules layer
- existing skills, prompt packs, or workflow docs
- existing `SPEC.md` / `PLAN.md` patterns
- memory, mistakebook, ledger, or equivalent long-term memory layers
- README files or other current-truth sources
- any local entrypoint that already carries default behavior

If the current Codex environment does not actually read a certain type of surface, do not create it just for completeness.

If multiple rule layers exist, determine their load order, override behavior, and real default entrypoint. At minimum, answer:
- which entrypoint the current environment reads first
- which entrypoints are supplemental versus overriding
- which files are human docs only and not real execution layers

Do not write critical reinforcement into a weak entrypoint that will be completely overridden by a stronger layer.

If you cannot fully prove the load chain yet, make the highest-confidence judgment from local evidence and prefer the entrypoint that is closest to the current usage path, narrowest in scope, and easiest to roll back. Do not copy the same rule into multiple layers "just to be safe."

If whether an entrypoint actually works will materially affect the rest of the work, run a minimal reversible probe first. The probe must be small, easy to revert, and observable by a minimal follow-up task. If the probe does not take effect, revert it and move to the next most likely entrypoint.

If there is almost no durable layer locally, create the smallest compatible layout and make explicit which file or entrypoint is intended to become the default source read first later.

3. Build a capability map before you modify anything.
For each candidate capability, do not just ask whether it "looks similar." Classify it as:
- already strong
- partially equivalent
- similar in name only
- clearly missing
- conflicting

For every item, you must be able to explain why you preserved it, strengthened it, merged it, or skipped it.

When deciding whether something is "equivalent or stronger," check all three of these:
- is it actually read or executed by the current environment
- does it truly constrain the same class of behavior rather than merely using similar language
- does it already achieve the same or stronger result on the target acceptance surface

If any one of those clearly fails, do not count it as already equivalent.

Treat something as "materially weak" only if at least one of these is true:
- there is no corresponding local mechanism at all
- a corresponding file or rule exists, but the current environment does not read it
- it uses similar slogans, but does not truly constrain the same behavior
- it is clearly failing on the target acceptance surface, or only works because the user keeps re-teaching it

Check whether these capabilities really exist and are strong enough:
- the first reply mirrors the request before taking action
- the mirror makes the goal, key boundary, and first action explicit
- when ambiguity would change the work, the agent lists the main interpretation branches instead of silently choosing one
- accepted full objectives do not collapse into a "smallest next step" handoff
- if the user asked for execution, the agent does not stop at analysis or planning
- local facts are read before claims are made
- facts, inferences, and unverified assumptions are kept distinct
- simple tasks are not drowned in process theater, but medium-complexity work still has a spec workflow available
- `SPEC.md` / `PLAN.md` are execution aids, not default stopping points
- without verification, the work is not considered done
- final reporting explains changed behavior first, then verification and real boundary
- long findings, long paragraphs, and long list items remain scannable rather than becoming a wall
- repeated user corrections can become durable defaults later
- internal workflow choice, skill names, and mode switching are not treated as the main outward-facing report

4. Fill gaps only. Do not rebuild systems just because they are different.
If the user already has an equivalent or stronger mechanism, do not recreate it just because the naming differs.

The goal is not to unify directory layout, filenames, or terminology.

The goal is to strengthen real behavior.

If a local rule is stronger, narrower, or better adapted to the project or user habit, preserve it first and fill only what it still lacks.

If your audit shows there is no meaningful local gap, do not manufacture edits just to appear productive. A zero-change closeout is allowed, but you must clearly state your reasoning and what you verified.

5. Choose the right landing zone for each improvement, but do not create every layer just for completeness.
Use this default split:
- cross-task default behavior goes into `AGENTS.md` or an equivalent rules layer
- long procedures, specialized knowledge, and recurring operating guidance go into skills or workflow docs
- reusable task scaffolds go into `SPEC.md` / `PLAN.md` templates or adjacent execution docs
- recurring durable lessons go into memory, mistakebook, ledger, or the user's existing long-term memory surface

Do not dump everything into one huge file, and do not create `AGENTS.md`, skills, workflow docs, spec templates, and memory files all at once just to look complete.

Create a landing zone only if the local environment will actually read, reuse, and maintain it.

6. If there is no spec workflow locally, add one yourself.
But add the lightest, steadiest version that does not disrupt normal work. At minimum, the local Codex should learn:
- when a light spec is enough
- when task-level `SPEC.md` / `PLAN.md` are needed
- that spec must at least capture goal, scope, constraints, and acceptance
- that `SPEC.md` / `PLAN.md` exist to help execution, not to create a default stop point

You should count the local setup as truly lacking a spec workflow only when there is no real durable entrypoint that currently says:
- when to stay light versus escalate to task-level spec
- the minimum required fields are goal, scope, constraints, and acceptance
- spec is not a default stopping point

If those facts already live in a real durable layer that the environment reads, do not create a second dedicated spec system.

Treat a task as needing task-level spec only if at least one of these is true:
- the change spans two or more durable layers or entrypoints
- there is real ambiguity that would materially change landing zone, risk, or acceptance
- proving stable behavior will require multi-step acceptance

Unless the user explicitly asked to review the plan first, spec, plan, and skill docs are execution aids only and must not block real delivery.

7. Resolve conflicts locally first. Do not stop every time you see a difference.
If you hit rule conflicts, overlapping skills, duplicated workflows, or mismatched wording, classify the situation first:
- different names, but behavior is equivalent
- partial overlap that can be merged or skipped
- a stronger, more specific local rule that should remain
- a real value conflict, destructive risk, or high-cost consequence that must be surfaced to the user

Only destructive, irreversible, or high-risk conflicts may be escalated to the user.

Ordinary rule differences, landing-zone choices, and merge decisions must be resolved locally by you rather than pushed back to the user.

8. If the user asked you to change things, then actually change them.
Inventory, diagnosis, plans, and suggestion lists are intermediate steps, not the default finish line.

But if the user explicitly asked for review only, discussion only, brainstorming only, spec only, or explicitly said not to change files in this round, then obey that scope and do not silently land edits.

If the user wants real adaptation, and no true confirmation boundary has been hit, you should land the adapted durable layer in local files rather than stopping at analysis.

If the environment does not currently allow writes, or the target path is not writable, provide file-precise edits, patches, or replacement text rather than retreating into vague advice.

9. Keep changes minimal, traceable, and reversible.
Do not rewrite large local rule files just to make them look cleaner.

Prefer the smallest change that is explainable and easy to locate.

If you are going to replace, delete, reorder, or heavily rewrite an existing durable file, create a rollback path first. Use existing git history, backups, branches, or local copies when available.

Do not opportunistically edit unrelated local content.

10. After changes, run a real conflict-and-quality acceptance pass yourself.
At minimum, confirm:
- you did not introduce duplicate or contradictory durable rule layers
- the new rules can be discovered from the local entrypoints the user actually reads
- later sessions will not need to keep re-pasting this whole prompt because the key defaults now live locally
- there is a minimal real verification path and you actually executed it
- docs, rules, skills, workflows, and the current local reality do not contradict each other in obvious ways

If you changed behavior, rules, config, prompts, or workflow, acceptance must prioritize real behavior rather than mere file existence.

At minimum, cover these acceptance surfaces:
- one direct execution task, verifying first-reply mirroring, objective retention, and no empty analysis loop
- one ambiguous task, verifying that the agent lists the main branches instead of silently choosing one
- one task that requires longer output or review-style output, verifying that the result stays scannable, not wall-like, and not excessively noisy

If there is no existing test harness locally, create a minimal behavior probe yourself: open a minimal isolated session, sub-session, or equivalent test surface, feed those three short tasks, and record expected versus actual behavior.

For the claim that later sessions no longer need to re-paste the whole prompt, do not bluff. If you can open a fresh session, verify it there. If you cannot, at minimum prove that the key defaults now live in the actual default entrypoint and that the current environment really reads it.

11. Control context size on purpose.
Do not turn this whole prompt into a permanent chat burden.

The goal is to move long-term truth into local durable files so later sessions rely on those files instead of dragging this prompt along forever.

Summarize when you can. Write files when you can. Split into skills or workflow docs when that is the cleaner reusable shape instead of dumping everything into one giant `AGENTS.md`.

Do not create decorative files that look professional but will not actually be read, reused, or maintained.

12. Improve the reporting style too.
In the first reply, naturally make clear:
- what the user wants to achieve
- what boundary matters most right now
- which local surfaces you will inspect first

In the final reply, default to this order:
- what behavior changed
- what was verified
- what real boundary remains

Unless the user explicitly asks, do not proactively dump long diffs, code walls, path walls, command walls, or internal workflow narration.

13. If part of the local setup is already stronger than this method, keep it.
This method is not for flattening every difference. It is for identifying the core capabilities that actually make Codex stronger, then filling those capabilities into the local environment.

Do not judge success by whether it "looks like a template."

Judge it by whether:
- the user can more easily tell that you understood the task
- the task is less likely to collapse into a narrow partial slice midway
- you are less likely to claim success before verification
- outputs are clearer, more scannable, and less noisy
- repeated user requirements are more likely to become durable defaults
- the user needs to re-teach the same things less often in a new session

14. There is only one final objective.
Leave this user's own Codex with a reinforcement layer that has been inspected locally, adapted on demand, kept low-conflict, made durable, verified, and left reversible.

Do not optimize for uniform appearance.
Do not optimize for uniform directory layout.
Do not optimize for uniform naming.
Do not optimize for the impression that "a lot was done."
Optimize for real reinforcement.
