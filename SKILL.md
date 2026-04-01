---
name: terminal-ui-crafting
description: Use when asked to design, implement, or refine a stylish terminal UI or TUI, especially a Textual/Rich dashboard with a strong visual identity, boot splash, keyboard navigation, status panels, queue tables, or a Hermes-HUD-like neon terminal aesthetic for Python tools.
version: 1.0.0
metadata:
  hermes:
    tags: [tui, terminal-ui, textual, rich, dashboard, design]
    related_skills: []
---

# Terminal UI Crafting

Build terminal interfaces that feel intentional, vivid, and operator-friendly rather than generic debug screens.

Use this skill when the user wants:
- a TUI
- a terminal dashboard
- a Hermes-HUD-style interface
- a neon or cinematic command-line UI
- a richer terminal control surface for an existing tool

## Default Stack

For Python projects, prefer:
- `textual` for the app shell, tabs, keybindings, live refresh, and layout
- `rich` for panels, tables, colors, boot banners, and text composition
- `typer` for CLI entrypoints that launch the TUI cleanly

If the repo already uses another terminal stack, follow the repo instead of forcing Textual.

## Design Target

Aim for one clear visual metaphor, not random ornament.

Good defaults:
- background near-black with blue/cyan or amber accents
- one short masthead that names the mode
- 3 to 5 stat cards at the top
- one main queue or table for the core job to be done
- one activity feed
- visible keyboard shortcuts in the footer

Avoid:
- rainbow palettes
- giant walls of ASCII
- too many bordered boxes competing for attention
- fake telemetry with no meaning

## Implementation Workflow

1. Pick the operating metaphor.
2. Decide the core tabs or panes from the user workflow.
3. Make the overview screen useful first.
4. Add a short boot splash or branded masthead.
5. Add hotkeys for the main navigation.
6. Keep data loading separate from rendering.
7. Do a terminal smoke test with a forced timeout so startup issues surface fast.

## Layout Pattern

Use this shape unless the repo already suggests something better:

1. Header with title and clock
2. Masthead panel with mode name and one-line description
3. Tab bar
4. Overview tab:
   - stat cards
   - core queue
   - repo or environment summary
5. Detail tabs:
   - agents/workers
   - tasks or PRs
   - activity/logs
   - info/help
6. Footer with bindings

## Visual Recipe

Use a restrained palette:
- background: deep navy or black-blue
- primary accent: cyan/ice blue
- secondary accent: slate or steel blue
- body text: pale blue-gray

Good panel titles are short and functional:
- `Workers`
- `Queue`
- `Merged`
- `Activity Feed`
- `Info`

## Boot Splash

Boot splashes should be quick and memorable.

Pattern:
- 4 to 6 lines of compact ASCII
- one subtitle explaining the mode
- sleep no more than about 0.7s unless the user wants drama
- always provide a `--no-boot` or equivalent skip path

## Textual Guidance

- Keep `App` state thin; fetch snapshot data from a service layer.
- Use `TabbedContent` for multi-view dashboards.
- Use `DataTable` for rows the user scans repeatedly.
- Use `Static` with Rich renderables for overview and info panes.
- Register direct keybindings like `1`, `2`, `3`, `r`, `q`.

For concrete patterns, read:
- `references/style-playbook.md`
- `references/hermes-pr-hub-example.md`

## Validation

Minimum validation:

```bash
python3 -m compileall src tests
pytest -q
timeout 2s your-cli tui --no-boot
```

If the app uses a project venv, run the installed entrypoint from that venv.

## Output Standard

When you finish a terminal UI task, report:
- what visual direction you chose
- where the TUI entrypoint lives
- how to launch it
- what you verified
