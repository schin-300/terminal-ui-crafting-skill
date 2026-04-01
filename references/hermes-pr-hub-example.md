# Workflow-First Operator Surface Example

This reference captures the reusable lesson from a terminal dashboard that worked well.

## What mattered

### 1. The overview answered real scan questions

The first screen told the operator what they needed to know right away.
That is the reusable pattern.
Not the exact widgets, colors, or tab names.

### 2. Summary plus drill-down was enough

A compact overview screen paired with more detailed views worked because the workflow needed:
- quick situational awareness
- fast movement into detail
- clear keyboard navigation

That pattern is broadly useful, but should not be forced on every TUI.

### 3. Rendering stayed separate from data collection

The interface was easier to extend because data gathering lived outside the widget tree.
Keep that separation whenever the UI has live refresh or multiple views.

### 4. Style supported the tool instead of replacing it

A little visual identity helped orientation, but the interface succeeded because it surfaced real tasks and state.
That is the main lesson.

## Transferable rule

When building a terminal interface, define these first:
1. what the user is trying to accomplish
2. what they need to scan quickly
3. what actions need first-class shortcuts
4. what should stay visible while they work

Then choose the layout and styling that supports those answers.