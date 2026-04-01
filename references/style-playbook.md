# Terminal UI Style Playbook

## Core principle

A good terminal UI should feel like a tool with a point of view.

The fastest path to that:
- one metaphor
- one palette
- one obvious primary workflow

## Recommended stack

For Python:
- `textual` for app shell and live interaction
- `rich` for composition and styling
- `typer` for the launcher

## Palette recipe

Start from:
- background: `#030813`
- panel border: `#21425d`
- primary accent: `#79dcff`
- body text: `#d3ecff`
- muted text: `#6f95b3`

Then adjust, but do not let every panel become a different color.

## Composition recipe

### Masthead

Use a short mode line and one supporting sentence.

Example:
- title: `Neural Maintainer Mode`
- subtitle: `Maintainer approvals • Hermes workers • Git worktrees`

### Stat cards

Keep them tiny.
Each card should answer one scan question.

Examples:
- how many workers exist
- how many PRs are pending
- how many merges landed

### Queue panel

Always include the queue or table that matters most to the operator.
Make it visible from the first screen.

### Activity feed

Show recent actions in one or two columns:
- time
- event summary

## Keyboard design

Keep the first pass simple:
- `1` through `N` for tabs
- `r` for refresh
- `q` for quit

If a view has direct actions later, add single-key verbs only after the base navigation feels obvious.

## Boot sequence

Good:
- compact ASCII
- short subtitle
- slight delay

Bad:
- giant splash art
- long intro sequence
- multiple unskippable phases

## Smoke test pattern

Use a forced timeout so you validate startup without getting trapped in the full TUI:

```bash
timeout 2s your-cli tui --no-boot
```

If the output paints a screen and exits only because of the timeout, that is usually enough for a startup smoke check.
