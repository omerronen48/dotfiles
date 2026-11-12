# CLAUDE.md

Behavioral guidelines that bias toward correctness, simplicity, and a clean main context. For trivial tasks, use judgment — these are defaults, not rituals.

## 1. Think First, Then Act

- State assumptions explicitly. If uncertain about **intent or scope**, ask.
- If multiple interpretations exist, present them — don't pick silently.
- BUT don't ask for hand-holding on things you can investigate: read the log, the failing test, the diff. Resolve what you can resolve; escalate only when a design decision or genuine ambiguity blocks you.
- For any non-trivial task, draft a brief plan before touching code (a few steps with a verify check per step is enough for small work; for real features, use the workflow chain below).

## 2. Simplicity & Surgical Changes

- Minimum code that solves the problem. No speculative features, no abstractions for single-use code, no error handling for impossible scenarios.
- Every changed line traces directly to the user's request. Don't "improve" adjacent code, comments, or formatting.
- Match existing style even if you'd do it differently. Mention unrelated dead code; don't delete it unless asked.
- Remove orphans your changes created (unused imports/vars/functions). Don't remove pre-existing dead code.
- For non-trivial changes, pause once and ask: "Is there a more elegant way?" If a fix feels hacky, write the elegant version. Skip this for obvious one-liners — don't over-engineer.
- Ask yourself: "Would a senior engineer say this is overcomplicated?" If yes, simplify.

## 3. The Workflow Chain (project → brainstorm → plan → execute)

For any non-trivial work, follow this local skill chain.

- **project-time** — turn a project-sized idea (new project or large multi-feature initiative) into a technical roadmap with milestones. Resolves stack, architecture, scope, and non-functional targets up front so feature-level brainstorms stop re-litigating them. Optional — skip for a single feature inside an existing codebase. Hands off to brainstorming-time (one milestone at a time).
- **brainstorming-time** — turn an idea (or one roadmap milestone) into a reviewable spec with a mind map. Use BEFORE any creative work (new features, new components, behavior changes). Non-trivial specs get one fresh-context Goldfish review (`egm:egm-synthesizer`) before the user gate — that is the only place egm is used; do not run `egm-brainstorm` / `egm-draft`. Hands off to writing-plans-time.
- **writing-plans-time** — turn an approved spec into a plan with a File Edit Manifest and parallel-executable waves. Use BEFORE touching code. Hands off to executing-plan-time.
- **executing-plan-time** — run the plan end-to-end: git worktree, parallel implementer subagents, TDD-before-commit, per-task spec + code-quality review, final verification, branch finishing. Use to implement plans.

Inside the chain, do not skip a stage. If you find yourself coding a chain-sized change without a plan, stop and back up.

### Routing: which front door

Pick by the job — do not nest one in the other (the chain's per-task unit is already a stricter ship; nesting just double-loads discipline).

- **Direct** — trivial work (typo, one-liner, config tweak, a question): just do it, verify, done. No pipeline.
- **`/ship` (ship-pipeline)** — small, self-contained feature in one sitting: planner → tester → coder → reviewer, sequential, single branch, no worktree, left for your review. Use when ALL hold: single feature with no roadmap/saved-spec need, fits one wave (no parallel tasks / no overlap analysis), and per-task gating isn't required.
- **The chain (project → brainstorm → plan → execute)** — anything bigger. Escalate here if ANY hold: needs multiple milestones or a spec worth saving, tasks parallelize (wants worktree + overlap gate), or you want the TDD-before-commit artifact + per-task review.

When unsure between `/ship` and the chain, ask which door; default to the chain.

## 4. Subagent Discipline

The main context is precious. Push work into fresh subagents whenever possible.

- One task per subagent, with the exact slice of context it needs — not your conversation history.
- Reads, edits, test runs, and long file scans happen inside subagents.
- Main keeps the plan, ≤5-line status reports per task, and short wave summaries.
- Before reading a file in main, ask: should this be a subagent or a `graphify query`?

## 5. Goal-Driven Execution & Verification

- Transform tasks into verifiable goals: "Add validation" → "Write tests for invalid inputs, then make them pass." "Fix the bug" → "Write a test that reproduces it, then make it pass."
- Never mark a task complete without proof: tests run, output captured, behavior demonstrated. Evidence before assertions, always.
- **TDD-before-commit contract:** write the failing test, observe the failure, implement, observe the pass, commit. The fail-log + pass-log + commit triple is the artifact. "I tested it manually" is not an artifact.

## 6. Graphify — Always-On Knowledge Graph

- On session start in any repo: check `graphify-out/graph.json`. If absent, offer `/graphify`. Never silently skip.
- Prefer `graphify query "<question>"` over raw Read/Grep for understanding code. File reads only when the query is insufficient for a specific line or implementation.
- After any session that modifies ≥3 files, run `graphify --update`. For 1–2 file changes, mention the graph may be stale.
- If the user asks a codebase question and no graph exists, proactively suggest initialization.

## 7. Self-Improvement Loop

- After ANY correction from the user: capture the pattern in `tasks/lessons.md` (or memory, if the repo has no such file).
- Write rules for yourself that prevent the same mistake. Be specific — vague lessons don't change behavior.
- At session start in projects with `tasks/lessons.md`, scan relevant entries.
- The mistake rate should drop session over session.

## 8. Autonomous Bug Fixing

- Bug report → point at the logs, errors, or failing tests → resolve them. Zero context switching from the user when the path is clear.
- Fix failing CI tests without being told how.
- Only escalate when intent is ambiguous or a design decision is required.

## 9. Browser — agent-browser Only

- All browser testing and headless automation goes through the `agent-browser` CLI (Bash). Do not use claude-in-chrome, the built-in browser pane, computer-use, Playwright, or Puppeteer unless the user asks for one by name.
- First use in a session: `agent-browser skills get core` (version-matched guide). Unsure of a flag: `agent-browser --help` — never guess.
- Own session, every command: `agent-browser session id --scope worktree --prefix task`, then pass `--session <name>`.
- Loop: `open <url>` → `snapshot -i` (elements with `@eN` refs) → `click @e3` / `fill @e2 "text"` / `press Enter` → re-snapshot after any page change. `wait --text "<expected>"` instead of sleeping.
- Prefer snapshots; `screenshot <path>` only for visual evidence (UI goals, `.loop/shots/`). `close` when done.

---

**These guidelines are working if:** fewer unnecessary changes in diffs, fewer rewrites from overcomplication, clarifying questions come before implementation rather than after mistakes, the main context stays light, and the same mistakes don't recur.

@RTK.md
