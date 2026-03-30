# claude-dotfiles

Personal Claude Code configuration — settings and status line script.

## Files

- **`settings.json`** — Claude Code settings: permissions, enabled plugins, and status line command
- **`statusline-command.sh`** — Status line script that displays model name and rate limit usage

## Status Line

The status line shows:

```
Claude Sonnet 4.6 | 5h:▓▓▓░░░░░░░ 30%  7d:▓░░░░░░░░░ 10%
```

| Segment | Description |
|---------|-------------|
| `Claude Sonnet 4.6` | Current model display name |
| `5h:▓▓▓░░░░░░░ 30%` | 5-hour session limit usage (10-block bar + percentage) |
| `7d:▓░░░░░░░░░ 10%` | Weekly rate limit usage (10-block bar + percentage) |

Bars use `▓` for used capacity and `░` for remaining. Both segments are hidden before the first API response in a session.

## Setup

```bash
git clone git@github.com:duyluann/claude-dotfiles.git ~/.claude-dotfiles
cp ~/.claude-dotfiles/settings.json ~/.claude/settings.json
cp ~/.claude-dotfiles/statusline-command.sh ~/.claude/statusline-command.sh
```
