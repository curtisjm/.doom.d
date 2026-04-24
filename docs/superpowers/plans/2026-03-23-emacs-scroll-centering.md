# Emacs Scroll Centering Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Configure Emacs globally so point stays near the vertical center of the window during normal editing.

**Architecture:** Use Emacs' built-in scrolling behavior by setting a high global `scroll-margin` in `config.el`. Keep the change isolated to one top-level setting, then verify interactively in a regular buffer.

**Tech Stack:** Doom Emacs, Emacs Lisp

---

### File Structure

**Files:**
- Modify: `config.el`
- Reference: `docs/superpowers/specs/2026-03-23-emacs-scroll-centering-design.md`

`config.el` already holds top-level editor preferences such as fonts, theme, and line number configuration, so the global scroll-centering setting belongs there.

### Task 1: Add the global scroll setting

**Files:**
- Modify: `config.el`
- Reference: `docs/superpowers/specs/2026-03-23-emacs-scroll-centering-design.md`

- [ ] **Step 1: Write the failing test**

Manual verification is the appropriate test here because the requested behavior is visual and interactive. Define the failure condition before editing: in any normal buffer, moving point far enough to scroll should let point drift close to the top or bottom edge of the window.

- [ ] **Step 2: Run test to verify it fails**

Run: open Emacs, visit any sufficiently long buffer, and move point repeatedly with `j`/`k` or arrow keys.
Expected: point is not kept near the window center during scrolling.

- [ ] **Step 3: Write minimal implementation**

Make this the only code change. Add it once near the other top-level display/editor settings in `config.el`:

```elisp
(setq scroll-margin 99999)
```

- [ ] **Step 4: Run test to verify it passes**

Run: restart Emacs, open a long buffer, then move point enough to trigger scrolling.
Expected: point stays visually near the middle of the window for normal navigation.

- [ ] **Step 5: Commit**

```bash
git add config.el
git commit -m "config: keep point centered while scrolling"
```

Skip this step unless the user explicitly asks for a commit.
