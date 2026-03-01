#!/usr/bin/env bash
set -euo pipefail

SKILL="fagan-inspection"

rm -rf "$HOME/.claude/skills/$SKILL"
echo "Removed Claude Code skill from ~/.claude/skills/$SKILL"

rm -rf "$HOME/.agents/skills/$SKILL"
echo "Removed Codex CLI skill from ~/.agents/skills/$SKILL"

echo "Done."
