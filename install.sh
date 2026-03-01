#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL="fagan-inspection"

# Claude Code: install to ~/.claude/skills/
CLAUDE_DIR="$HOME/.claude/skills/$SKILL"
mkdir -p "$CLAUDE_DIR"
cp "$SCRIPT_DIR/.claude/skills/$SKILL/SKILL.md" "$CLAUDE_DIR/SKILL.md"
echo "Installed Claude Code skill -> $CLAUDE_DIR/SKILL.md"

# Codex CLI: install to ~/.agents/skills/
CODEX_DIR="$HOME/.agents/skills/$SKILL"
mkdir -p "$CODEX_DIR/agents"
cp "$SCRIPT_DIR/.agents/skills/$SKILL/SKILL.md" "$CODEX_DIR/SKILL.md"
cp "$SCRIPT_DIR/.agents/skills/$SKILL/agents/openai.yaml" "$CODEX_DIR/agents/openai.yaml"
echo "Installed Codex CLI skill  -> $CODEX_DIR/"

echo ""
echo "Done. Usage:"
echo "  Claude Code:  /fagan-inspection"
echo "  Codex CLI:    /skills -> select fagan-inspection"
