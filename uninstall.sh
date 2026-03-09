#!/usr/bin/env bash
set -euo pipefail

for skill in fagan-inspection fagan-inspection-beads; do
  rm -rf "$HOME/.claude/skills/$skill"
  echo "Removed Claude Code skill: ~/.claude/skills/$skill"

  rm -rf "$HOME/.codex/skills/$skill"
  echo "Removed Codex CLI skill:   ~/.codex/skills/$skill"
done

echo "Done."
