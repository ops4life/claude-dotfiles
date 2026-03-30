#!/bin/sh
set -e

REPO="git@github.com:duyluann/claude-dotfiles.git"
DEST="$HOME/.claude"
TMP="$(mktemp -d)"

echo "Installing claude-dotfiles..."

# Clone into temp dir
git clone --depth=1 "$REPO" "$TMP"

# Ensure destination exists
mkdir -p "$DEST"

# Copy config files (never overwrite credentials or local settings)
cp "$TMP/settings.json" "$DEST/settings.json"
cp "$TMP/statusline-command.sh" "$DEST/statusline-command.sh"
chmod +x "$DEST/statusline-command.sh"

# Cleanup
rm -rf "$TMP"

echo "Done. Restart Claude Code to apply changes."
