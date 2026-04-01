---
name: terminal-ui-crafting
description: Use when asked to design, implement, or refine a terminal UI or TUI. Focus on choosing the right terminal stack, preserving the repo's conventions, and building a clear operator workflow instead of forcing a default visual theme or canned layout.
version: 2.0.0
metadata:
  hermes:
    tags: [tui, terminal-ui, textual, rich, dashboard, cli, ux]
    related_skills: []
---

# Terminal UI Crafting

Build terminal interfaces that help the user do real work.

This skill is for:
- full-screen TUIs
- keyboard-driven CLI flows
- terminal dashboards and control surfaces
- operator consoles
- terminal UX cleanup for existing tools

Core rule: do not impose a default theme, layout, or ornamental style.
Choose the stack, information density, navigation model, and visual treatment from:
1. the user's request
2. the repo's existing conventions
3. the actual workflow the interface must support

## Stack Selection

Follow the repo's current stack first.
Do not force Textual just because it is available.

Good defaults by task type:
- Python full-screen app: `textual`
- Python rich formatted output inside a normal CLI: `rich`
- Python command entrypoints: `typer`
- Python line-oriented interactive flows: `prompt_toolkit`
- Low-dependency terminal apps: `curses`, `blessed`, or the repo's existing primitives

If the project is not Python, prefer the ecosystem-native terminal stack already in use.

## Design Principles

1. Workflow first.
   Start from the operator's actual job, not from widgets or style ideas.

2. Real state over decorative state.
   Show meaningful queues, tasks, processes, logs, selections, forms, or status.
   Avoid fake telemetry.

3. The layout should follow the task.
   Use the minimum number of panes, tabs, tables, lists, and shortcuts needed to make the workflow clear.

4. Match the host tool.
   A release tool, monitor, queue runner, and terminal file picker should not all look the same.

5. Be opinionated only when needed.
   If the user asks for a particular aesthetic, deliver it.
   If they do not, stay neutral and functional.

## Implementation Workflow

1. Inspect the existing repo, commands, and data sources.
2. Write a short spec before implementation that names:
   - the primary user workflow
   - the scan questions the UI must answer quickly
   - the actions the user must be able to take
   - important constraints such as terminal size, dependencies, refresh model, and latency
3. Choose the smallest set of UI primitives that fits the workflow:
   - table
   - list
   - tree
   - log pane
   - status line
   - form
   - tabs
   - split panes
   - modal/help overlay
4. Keep data loading and business logic separate from rendering.
5. Build the smallest useful screen first.
6. Add navigation, keyboard shortcuts, and refresh behavior.
7. Add optional polish only after the interface is already useful.
8. Smoke test the real entrypoint in a terminal.

## Layout Guidance

Do not default to one canned layout.
Pick the layout pattern that matches the job:

- queue-first: when users mostly scan and act on jobs
- log-first: when recency and event flow matter most
- form or wizard: when guided input is the main task
- split view: when a list/detail workflow dominates
- overview + details: when users need a summary first and drill-down second
- command palette / shortcut surface: when speed matters more than rich panels

If a summary screen exists, make it answer the top scan questions immediately.

## Visual Guidance

Visual direction is optional and contextual.

If the user or repo already implies a style, follow that.
If there is no visual direction, keep styling restrained and legible:
- consistent spacing
- clear hierarchy
- limited color accents
- readable contrast
- borders only where they help grouping

Avoid prescribing exact colors, mastheads, clocks, splash screens, or dashboard chrome unless the task calls for them.

## Textual / Rich Guidance

When using Textual:
- keep `App` state thin
- prefer service/snapshot layers for data collection
- use `DataTable` for scan-heavy tabular views
- use `Static` with Rich renderables for summary or help panels
- use `TabbedContent` only when tabs genuinely simplify navigation
- register direct keybindings for high-frequency actions

When using Rich without a full TUI:
- use tables, panels, grouped renderables, and progress components for readable CLI output
- favor clear command output over pseudo-dashboard theatrics

## Real Terminal Rule

If the user asks for many real terminals on one surface, do not fake that with static panes.
A dashboard is not the same thing as hosting real PTYs.

For real multi-terminal surfaces, prefer tools built for PTYs such as:
- `tmux`
- `zellij`
- terminal emulators with pane APIs such as `wezterm` or `kitty`
- web approaches based on `xterm.js` plus a PTY backend

Use this skill for terminal interfaces and operator surfaces, but do not pretend a status dashboard is a true multi-terminal host.

## Validation

Minimum validation:

```bash
python3 -m compileall src tests
pytest -q
timeout 2s your-cli tui --no-boot
```

Adjust the validation to the actual stack:
- if there is no pytest suite, run the project's real test command
- if there is no full-screen TUI, smoke test the actual interactive entrypoint instead
- if a project venv exists, run the installed command from that venv

## Output Standard

When you finish a terminal UI task, report:
- what workflow the interface was designed around
- which stack or libraries were used and why
- where the entrypoint lives
- how to launch it
- what you verified
