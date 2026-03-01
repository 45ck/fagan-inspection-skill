# fagan-inspection-skill

A formal [Fagan Inspection](https://en.wikipedia.org/wiki/Fagan_inspection) skill for AI coding assistants. Works with both **Claude Code** and **Codex CLI**.

Given a change set (staged diff, PR, or working tree), the skill walks the AI through all five Fagan phases -- scoping, planning, domain reviews, synthesis, and rework -- and produces a structured **Fagan Inspection Report** with a prioritized defect log.

## Features

- Automatic scope detection from git context (staged diff, PR range, working tree)
- Dynamic domain selection (security, performance, correctness, tests, etc.)
- Parallel domain reviewers when subagents are available
- Consolidated defect log with severity, location, fix, and verification steps
- Entry/exit criteria enforcement
- Works as an explicit-only skill (no accidental triggers)

## Install

### Option A: Clone into your project

```bash
# From your project root
git clone https://github.com/YOUR_USERNAME/fagan-inspection-skill.git /tmp/fagan-skill
cp -r /tmp/fagan-skill/.claude .claude
cp -r /tmp/fagan-skill/.agents .agents
```

### Option B: Install globally (user-level)

```bash
git clone https://github.com/YOUR_USERNAME/fagan-inspection-skill.git
cd fagan-inspection-skill
bash install.sh
```

To remove:

```bash
bash uninstall.sh
```

## Usage

### Claude Code

```
/fagan-inspection
/fagan-inspection focus on auth module and SQL queries
```

### Codex CLI

```
/skills
# select fagan-inspection from the list
```

## What you get

The skill outputs a **Fagan Inspection Report** in Markdown:

| Section | Contents |
|---|---|
| Scope | What changed and why (from chat context or git) |
| Entry/Exit Criteria | Conditions that must hold before and after inspection |
| Overview | High-level summary and top risks |
| Defect Log | Table: ID, Severity, Domain, Location, Title, Status, Fix/Next |
| Rework Summary | What was fixed (if the AI had write permissions) |
| Verification | Commands and tests that confirm fixes |

## Repo structure

```
.claude/skills/fagan-inspection/SKILL.md   # Claude Code entrypoint
.agents/skills/fagan-inspection/SKILL.md   # Codex CLI entrypoint
.agents/skills/fagan-inspection/agents/openai.yaml  # Codex metadata
install.sh          # Global install script
uninstall.sh        # Global uninstall script
LICENSE             # MIT
```

## How it works

The Fagan Inspection is a structured code review process created by Michael Fagan at IBM in 1976. Unlike casual code review, it follows a defined process:

1. **Planning** -- define entry/exit criteria, select review domains
2. **Overview** -- summarize the change set and intent
3. **Preparation** -- each reviewer independently examines the code for their domain
4. **Inspection meeting** -- reviewers compare findings, de-duplicate, and prioritize
5. **Rework** -- defects are fixed and verified against exit criteria

This skill encodes that entire process as AI-executable instructions, so the assistant performs a rigorous, multi-perspective review rather than a single-pass skim.

## License

[MIT](LICENSE)
