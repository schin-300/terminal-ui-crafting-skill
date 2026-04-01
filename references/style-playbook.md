# Terminal UI Playbook

## Core principle

A terminal UI should make the tool easier to operate.
Start from the workflow, not from a default theme.

Useful questions:
- what does the user scan first?
- what actions must be fast?
- what state changes matter?
- does this need a full-screen app or just better terminal output?

## Pick the right level of interface

Choose the lightest interface that fits the job:
- formatted CLI output for commands that mostly print results
- interactive prompt flow for guided input
- full-screen TUI for persistent state, navigation, or live refresh
- real PTY tooling when the requirement is multiple actual terminals

## Pick the stack from the job

Good defaults for Python:
- `rich` for formatted command output
- `typer` for command structure
- `prompt_toolkit` for interactive prompts and command palettes
- `textual` for full-screen TUIs

If the repo already uses another stack, stay with it.

## Choose primitives intentionally

Prefer a small number of primitives that match the task:
- table for scan-heavy records
- list for ordered choices
- tree for nested resources
- log pane for recency
- detail pane for selected-item inspection
- status line for compact live state
- modal/help overlay for commands the user will forget

## Visual treatment

Visual style is contextual, not mandatory.

If the user asks for a specific look, follow it.
If not, keep the interface readable and restrained:
- clear hierarchy
- limited accent colors
- spacing that separates groups
- borders only when they improve scanning

Do not add clocks, boot splashes, banners, or decorative chrome unless they help the product.

## Validation

Smoke test the real entrypoint in a real terminal.
Typical Python baseline:

```bash
python3 -m compileall src tests
pytest -q
timeout 2s your-cli tui --no-boot
```

Adjust to the actual stack and entrypoint.