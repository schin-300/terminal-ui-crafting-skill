# Hermes PR Hub Example

This skill was distilled from the standalone `hermes-pr-hub` project.

## What worked

### 1. Lead with the operator workflow

The first screen answers:
- how many workers exist
- how many maintainers exist
- how many PRs are waiting
- what repo is under management

That made the interface feel useful immediately.

### 2. One strong identity line

The masthead used:
- `Neural Maintainer Mode`
- `Maintainer approvals • Hermes workers • Git worktrees`

That gave the tool a personality without hiding what it does.

### 3. Rich overview, simple details

The overview is composed with Rich panels and tables.
The detailed tabs use `DataTable` or `Static`.

This split is a good default:
- `Rich` for polished summary views
- `Textual` widgets for structured interactive sections

### 4. A short boot splash

The splash used compact ASCII, blue accents, and a single subtitle.
It looked intentional without slowing the tool down much.

### 5. Keep the data model separate

The TUI reads from a service snapshot rather than owning all business logic.
That made it easy to add tabs and refresh behavior later.

## Current Hermes PR Hub tab model

- `Overview`
- `Agents`
- `Pull Requests`
- `Activity`
- `Info`

That is a solid template for operator dashboards in general.

## Reusable lesson

When building a terminal dashboard, do not start with widgets.
Start with:
1. the scan questions
2. the operator's top action
3. the visual tone

Then choose the widgets that support those decisions.
