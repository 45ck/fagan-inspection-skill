---
name: fagan-inspection
description: Formal defect-finding inspection of the current change set using Fagan steps. Use when the user asks for a Fagan inspection, deep review, code review, defect review, regression review, or a structured findings-first assessment of a diff, branch, staged changes, PR, or working tree. Uses parallel domain reviewers when supported and outputs a consolidated defect log plus verification.
---

Run a formal **Fagan Inspection** on the current change set. Optimize for defect discovery and verification.

## Operating rules

- Default to review mode, not implementation mode. Do not edit code unless the user explicitly asks for rework after the inspection.
- Prefer findings about bugs, regressions, missing tests, design risks, and operational hazards over summaries.
- When subagents are available, use them only for independent domain reviews. Keep scope selection, synthesis, severity decisions, and final reporting local.
- Keep commands non-interactive. Prefer fast local discovery (`rg`, targeted file reads, tests relevant to changed files).

## A) Scope

- Prefer existing chat context for intent + acceptance criteria.
- If missing, derive scope from git: status, staged/unstaged diff, and PR-range diff vs base (`origin/main` or `origin/master`).
- Summarize impacted modules/files + externally visible behavior changes.

## B) Plan (you decide domains dynamically)

- Define **Entry Criteria** (must be true to start) and **Exit Criteria** (must be true to finish).
- Choose only the reviewer domains needed for this change (examples: correctness, security, performance, reliability, API/design, tests, docs, ops, data/migrations, concurrency, UI).
- If parallel subagents are supported, spawn one reviewer per independent domain; otherwise run domains sequentially.
- Keep at most one reviewer per file cluster or concern area to avoid duplicated work.

## C) Preparation (domain reviews)

Each domain reviewer outputs defects in this schema:

- **Title**
- **Severity:** MAJOR | MINOR
- **Domain**
- **Location:** file:line or symbol
- **What/Why + Evidence/Repro**
- **Fix:** specific change
- **Verify:** test/command/scenario

## D) Inspection meeting (synthesis)

- De-duplicate, re-severity, prioritize.
- Produce a single defect log + rework plan.
- Reject weak findings that lack a concrete failure mode, evidence path, or actionable fix.

## E) Rework + follow-up

- Only change code if permissions/approval mode allows; otherwise give patch-level edits.
- Fix MAJOR first; add/update tests/docs for behavior changes; re-run relevant checks/tests; confirm Exit Criteria.

## OUTPUT: Fagan Inspection Report (Markdown)

1. Findings first, ordered by severity, with file references and concise evidence.
2. Scope & intent source (chat or git)
3. Entry/Exit criteria
4. Overview + top risks
5. Defect log (table: ID | Sev | Domain | Location | Title | Status | Fix/Next)
6. Rework summary (if applied)
7. Verification evidence (commands/tests)

If no defects are found, say that explicitly and list residual risks or testing gaps.
