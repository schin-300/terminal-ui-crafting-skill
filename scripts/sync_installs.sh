#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

for target in \
  "$HOME/.codex/skills/terminal-ui-crafting" \
  "$HOME/.hermes/skills/terminal-ui-crafting"
do
  mkdir -p "$target"
  cp -R "$SOURCE_DIR"/. "$target"/
done

echo "Synced terminal-ui-crafting to Codex and Hermes skill directories."
