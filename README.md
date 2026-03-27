# fagan-inspection-skill

<p align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="assets/banner.dark.png" />
    <source media="(prefers-color-scheme: light)" srcset="assets/banner.light.png" />
    <img src="assets/banner.light.png" alt="fagan-inspection-skill banner" width="100%" />
  </picture>
</p>

<p align="center">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License" /></a>
  <img src="https://img.shields.io/badge/skills-2-2563eb" alt="2 skills" />
  <img src="https://img.shields.io/badge/review-formal%20inspection-1d4ed8" alt="formal inspection" />
</p>

A formal Fagan Inspection skill pack for code review and defect discovery. It turns a staged diff, working tree, or PR range into a structured inspection process with a prioritized defect log.

## Included skills

- `fagan-inspection`
- `fagan-inspection-beads`

## Features

- Uses a formal inspection flow instead of an ad hoc review pass
- Detects scope from staged changes, working tree changes, or PR context
- Produces a structured inspection report with defect tracking
- Includes an optional Beads-backed variant for turning defects into follow-up issues
- Mirrors packaged skills into both `.claude/skills/` and `.agents/skills/`

## Install

### Option A: Install globally

```bash
git clone https://github.com/45ck/fagan-inspection-skill.git
cd fagan-inspection-skill
bash install.sh
```

This installs every packaged skill into both:

- `~/.claude/skills/`
- `~/.agents/skills/`

### Option B: Copy into a project

```bash
cp -R .claude /path/to/your-project/
cp -R .agents /path/to/your-project/
```

### Uninstall

```bash
bash uninstall.sh
```

## Usage

```text
/fagan-inspection
/fagan-inspection focus on auth module and SQL queries

/fagan-inspection-beads
/fagan-inspection-beads --include-minor
```

## Repo structure

```text
.claude/skills/<skill>/SKILL.md      packaged skill format
.agents/skills/<skill>/SKILL.md      mirrored packaged skill format
install.sh                           global installer
uninstall.sh                         global uninstaller
LICENSE                              MIT
```

## Related skill packs

- [business-analysis-skills](https://github.com/45ck/business-analysis-skills) - Business analysis techniques, workflows, and quality checks
- [marketing-product-skills](https://github.com/45ck/marketing-product-skills) - Product strategy, growth, positioning, launch, SEO, and pricing skills
- [hci-review-skill](https://github.com/45ck/hci-review-skill) - Structured HCI and UX review skills for prototypes and product interfaces

## License

[MIT](LICENSE)
