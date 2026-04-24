# Emacs Scroll Centering Design

## Goal

Keep point near the vertical center of the window during normal editing across the full Emacs session.

## Context

The Doom Emacs configuration in `config.el` does not currently define any scroll-centering behavior. The requested change should apply globally rather than only to writing-focused modes.

## Options Considered

### 1. Global `scroll-margin` (recommended)

Set `scroll-margin` to a large value in `config.el`.

- Uses built-in Emacs behavior
- Applies everywhere without hooks or package configuration
- Keeps point away from the top and bottom edges in most normal scrolling situations

### 2. Tune multiple scrolling variables

Set `scroll-margin` together with variables such as `scroll-step` or `scroll-conservatively`.

- Can feel smoother in some workflows
- Changes more editor behavior than requested
- Harder to keep minimal and predictable

### 3. Force recentering after movement

Use hooks or advice to recenter after navigation commands.

- Produces stronger centering behavior
- More intrusive and heavier than needed
- Higher risk of conflicting with normal navigation patterns

## Chosen Design

Add a single global setting in `config.el` that assigns a high value to `scroll-margin`.

This design is intentionally minimal:

- no Doom module changes
- no extra packages
- no buffer-local hooks

## Implementation Notes

- Place the setting near other top-level editor behavior preferences in `config.el`
- Use a clearly high value so point stays visually centered as much as practical
- Leave room for future tuning if the value feels too aggressive on very small windows

## Verification

- Open any buffer and move point up and down through enough lines to trigger scrolling
- Confirm point stays near the center of the window rather than hugging the top or bottom
