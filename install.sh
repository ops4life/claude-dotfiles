#!/bin/sh
set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME/.claude"

echo "Installing claude-dotfiles..."

# Ensure destination exists
mkdir -p "$DEST"

# Copy config files (never overwrite credentials or local settings)
cp "$SCRIPT_DIR/settings.json" "$DEST/settings.json"
cp "$SCRIPT_DIR/statusline-command.sh" "$DEST/statusline-command.sh"
chmod +x "$DEST/statusline-command.sh"

echo "Done. Restart Claude Code to apply changes."
