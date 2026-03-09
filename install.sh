#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

install_skill() {
  local skill="$1"

  # Claude Code: install to ~/.claude/skills/
  local claude_dir="$HOME/.claude/skills/$skill"
  mkdir -p "$claude_dir"
  cp "$SCRIPT_DIR/.claude/skills/$skill/SKILL.md" "$claude_dir/SKILL.md"
  echo "  Claude Code -> $claude_dir/SKILL.md"

  # Codex CLI: install to ~/.codex/skills/
  local codex_dir="$HOME/.codex/skills/$skill"
  mkdir -p "$codex_dir/agents"
  cp "$SCRIPT_DIR/.agents/skills/$skill/SKILL.md" "$codex_dir/SKILL.md"
  if [ -f "$SCRIPT_DIR/.agents/skills/$skill/agents/openai.yaml" ]; then
    cp "$SCRIPT_DIR/.agents/skills/$skill/agents/openai.yaml" "$codex_dir/agents/openai.yaml"
  fi
  echo "  Codex CLI   -> $codex_dir/"
}

echo "Installing fagan-inspection (core)..."
install_skill "fagan-inspection"

echo ""
echo "Installing fagan-inspection-beads (optional add-on)..."
install_skill "fagan-inspection-beads"

echo ""
echo "Done. Usage:"
echo "  Claude Code:  /fagan-inspection"
echo "  Claude Code:  /fagan-inspection-beads  (with Beads integration)"
echo "  Codex CLI:    /skills -> select from list"
