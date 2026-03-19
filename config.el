;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 16)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 16))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)

;; Relative line numbers with actual line number on current line
(setq display-line-numbers-type 'relative
      display-line-numbers-current-absolute t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; --- ORG MODE CONFIG ---
;; https://zzamboni.org/post/beautifying-org-mode-in-emacs/
;; https://sophiebos.io/posts/beautifying-emacs-org-mode/
;; Hide the emphasis markup (e.g. /.../ for italics, *...* for bold, etc.)
;; (setq org-hide-emphasis-markers t)
;; ;; Replace list markers with a centered-dot character
;; (font-lock-add-keywords 'org-mode
;;                         '(("^ *\\([-]\\) "
;;                            (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; ;; The org-bullets package replaces all headline markers with different Unicode bullets
;; (use-package! org-bullets
;;   :hook (org-mode . org-bullets-mode))
;; ;; Resise Org headings
;; (after! org
;;   (custom-set-faces!
;;     '(org-level-1 :inherit outline-1 :height 1.4)
;;     '(org-level-2 :inherit outline-2 :height 1.3)
;;     '(org-level-3 :inherit outline-3 :height 1.2)
;;     '(org-level-4 :inherit outline-4 :height 1.1)
;;     '(org-document-title :height 1.6 :weight bold))
;;   ;; Make the document title a bit bigger
;;   ;; (set-face-attribute 'org-document-title nil :font "Source Sans Pro" :weight
;;   ;;                     'bold :height 1.8)
;;   ;; In order to avoid line spacing issues when a line of text contains both variable- and fixed-pitch text,
;;   ;; we need to make sure that the org-indent face inherits from fixed-pitch
;;   (require 'org-indent)
;;   (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
;;   ;; We want to make sure that some parts of the Org document always use fixed-pitch even when variable-pitch-mode is on
;;   (set-face-attribute 'org-block nil            :foreground nil :inherit
;;                       'fixed-pitch :height 0.85)
;;   (set-face-attribute 'org-code nil             :inherit '(shadow fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-indent nil           :inherit '(org-hide fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-verbatim nil         :inherit '(shadow fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-special-keyword nil  :inherit '(font-lock-comment-face
;;                                                            fixed-pitch))
;;   (set-face-attribute 'org-meta-line nil        :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-checkbox nil         :inherit 'fixed-pitch)
;;   ;; We need to make sure that variable-pitch-mode is always active in Org buffers
;;   (add-hook 'org-mode-hook 'variable-pitch-mode)
;;   ;; If you're having troubles with the size of LaTeX-previews like I did, you can increase the size
;;   (plist-put org-format-latex-options :scale 2))

;;; Org Mode Beautification Config

;;; ~/.doom.d/config.el

;; ============================================
;; ORG MODE BASE SETTINGS
;; ;; ============================================
;; (after! org
;;   (setq org-hide-emphasis-markers t
;;         org-pretty-entities t
;;         org-ellipsis " ▾"
;;         org-auto-align-tags nil
;;         org-tags-column 0
;;         org-startup-indented t
;;         org-startup-with-inline-images t))

;; ;; ============================================
;; ;; ORG-MODERN
;; ;; ============================================
;; (use-package! org-modern
;;   :after org
;;   :hook (org-mode . org-modern-mode)
;;   :config
;;   (setq org-modern-star '("◉" "○" "◈" "◇" "✳")
;;         org-modern-list '((?- . "•") (?+ . "◦") (?* . "‣"))
;;         org-modern-block-fringe nil))

;; ;; ============================================
;; ;; ORG-APPEAR
;; ;; ============================================
;; (use-package! org-appear
;;   :after org
;;   :hook (org-mode . org-appear-mode))

;; Org face customizations (must be wrapped in after! org)
;; (after! org
;;   ;; Resize Org headings
;;   (dolist (face '((org-level-1 . 1.35)
;;                   (org-level-2 . 1.3)
;;                   (org-level-3 . 1.2)
;;                   (org-level-4 . 1.1)
;;                   (org-level-5 . 1.1)
;;                   (org-level-6 . 1.1)
;;                   (org-level-7 . 1.1)
;;                   (org-level-8 . 1.1)))
;;     (set-face-attribute (car face) nil :weight 'bold :height (cdr face)))

;;   ;; Make the document title a bit bigger
;;   (set-face-attribute 'org-document-title nil :weight 'bold :height 1.8)

;;   ;; In order to avoid line spacing issues when a line of text contains both variable- and fixed-pitch text,
;;   ;; we need to make sure that the org-indent face inherits from fixed-pitch
;;   (require 'org-indent)
;;   (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch))
;;   ;; We want to make sure that some parts of the Org document always use fixed-pitch even when variable-pitch-mode is on
;;   (set-face-attribute 'org-block nil :foreground nil :inherit 'fixed-pitch :height 0.85)
;;   (set-face-attribute 'org-code nil :inherit '(shadow fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-indent nil :inherit '(org-hide fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-verbatim nil :inherit '(shadow fixed-pitch) :height 0.85)
;;   (set-face-attribute 'org-special-keyword nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-meta-line nil :inherit '(font-lock-comment-face fixed-pitch))
;;   (set-face-attribute 'org-checkbox nil :inherit 'fixed-pitch))

;; ;; For this all to come together, we need to make sure that variable-pitch-mode is always active in Org buffers
;; (add-hook 'org-mode-hook 'variable-pitch-mode)

;; ;; If you're having troubles with the size of LaTeX-previews like I did, you can increase the size like so.
;; (after! org
;;   (plist-put org-format-latex-options :scale 2))

;; ;; Declutter by hiding leading starts in headings and emphasis markers (e.g., the slashes in /.../ ).
;; (setq org-adapt-indentation t
;;       org-hide-leading-stars t
;;       org-hide-emphasis-markers t
;;       org-pretty-entities t
;;       org-ellipsis " ▾")
;; ;; For source code blocks specifically, I want Org to display the contents using the major mode of the relevant language.
;; ;; I also want TAB to behave inside the source code block like it normally would when writing code in that language.
;; (setq org-src-fontify-natively t
;;       org-src-tab-acts-natively t
;;       org-edit-src-content-indentation 0)
;; ;; I want the text to fill the screen adaptively, so that long lines of text adapt to the size of the window.
;; ;; It also breaks lines instead of truncating them
;; (add-hook 'org-mode-hook 'visual-line-mode)
;; ;; Center org buffer
;; (add-hook 'org-mode-hook 'olivetti-mode)

;; ;; Modern UI elements
;; (use-package! org-modern
;;   :config
;;   (setq
;;    org-auto-align-tags t
;;    org-tags-column 0
;;    org-fold-catch-invisible-edits 'show-and-error
;;    org-special-ctrl-a/e t
;;    org-insert-heading-respect-content t

;;    ;; Don't style the following
;;    org-modern-tag nil
;;    org-modern-priority nil
;;    org-modern-todo nil
;;    org-modern-table nil

;;    ;; Agenda styling
;;    org-agenda-tags-column 0
;;    org-agenda-block-separator ?─
;;    org-agenda-time-grid
;;    '((daily today require-timed)
;;      (800 1000 1200 1400 1600 1800 2000)
;;      " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
;;    org-agenda-current-time-string
;;    "⭠ now ─────────────────────────────────────────────────")

;;   (global-org-modern-mode))

;; (use-package! org-superstar
;;   :config
;;   (setq org-superstar-leading-bullet " ")
;;   (setq org-superstar-special-todo-items t) ;; Makes TODO header bullets into boxes
;;   (setq org-superstar-todo-bullet-alist '(("TODO" . 9744)
;;                                           ("DONE" . 9744)
;;                                           ("READ" . 9744)
;;                                           ("IDEA" . 9744)
;;                                           ("WAITING" . 9744)
;;                                           ("CANCELLED" . 9744)
;;                                           ("PROJECT" . 9744)
;;                                           ("POSTPONED" . 9744)))
;;   )

;; ============================================================================
;; OBSIDIAN-STYLE ORG MODE
;; ============================================================================

;; ---------------------------------------------------------------------------
;; Centered, readable text with olivetti
;; ---------------------------------------------------------------------------
(use-package! olivetti
  :hook (org-mode . olivetti-mode)
  :config
  (setq olivetti-body-width 120
        olivetti-minimum-body-width 80
        olivetti-style 'fancy))

;; ---------------------------------------------------------------------------
;; Modern bullets and clean UI with org-modern
;; ---------------------------------------------------------------------------
(use-package! org-modern
  :hook (org-mode . org-modern-mode)
  :config
  (setq
   ;; Clean heading bullets (Obsidian-style)
   org-modern-star '("●" "○" "◆" "◇" "►")
   ;; Clean list bullets
   org-modern-list '((?- . "•") (?+ . "◦") (?* . "‣"))
   ;; Hide leading stars
   org-modern-hide-stars t
   ;; Checkbox styling
   org-modern-checkbox '((?X . "☑") (?- . "◫") (?\s . "☐"))
   ;; Cleaner block styling
   org-modern-block-fringe nil
   org-modern-block-name '("" . "")
   ;; Timestamps
   org-modern-timestamp t
   ;; Tags styling (inline, no column alignment)
   org-modern-tag t
   org-modern-priority t
   org-modern-todo t
   org-modern-table t))

;; ---------------------------------------------------------------------------
;; Show markup when cursor is on it (like Obsidian's live preview)
;; ---------------------------------------------------------------------------
(use-package! org-appear
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autoemphasis t
        org-appear-autolinks t
        org-appear-autosubmarkers t
        org-appear-autoentities t
        org-appear-autokeywords t
        org-appear-inside-latex t
        ;; Delay before hiding markup again
        org-appear-delay 0.2))

;; ---------------------------------------------------------------------------
;; Org-mode base settings for clean Obsidian look
;; ---------------------------------------------------------------------------
(after! org
  ;; Hide all the markup characters
  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis " ▾"
        org-hide-leading-stars t
        ;; Indentation
        org-startup-indented t
        org-adapt-indentation nil
        ;; Tags
        org-auto-align-tags nil
        org-tags-column 0
        ;; Editing behavior
        org-special-ctrl-a/e t
        org-insert-heading-respect-content t
        org-catch-invisible-edits 'show-and-error
        ;; Images
        org-startup-with-inline-images t
        org-image-actual-width '(400))

  ;; Heading sizes with colors (inheriting from outline faces)
  (custom-set-faces!
    '(org-document-title :inherit outline-1 :height 1.8 :weight bold)
    '(org-level-1 :inherit outline-1 :height 1.5 :weight bold)
    '(org-level-2 :inherit outline-2 :height 1.3 :weight bold)
    '(org-level-3 :inherit outline-3 :height 1.2 :weight bold)
    '(org-level-4 :inherit outline-4 :height 1.1 :weight bold)
    '(org-level-5 :inherit outline-5 :height 1.05)
    '(org-level-6 :inherit outline-6 :height 1.0)
    '(org-level-7 :inherit outline-7 :height 1.0)
    '(org-level-8 :inherit outline-8 :height 1.0)))

;; ---------------------------------------------------------------------------
;; Line spacing and larger text for org-mode readability
;; ---------------------------------------------------------------------------
(defun my/org-mode-visual-setup ()
  "Set up better spacing and larger text for org-mode."
  (setq-local line-spacing 0.3)
  ;; Increase text size in org-mode (1 step = ~12% larger)
  (text-scale-increase 1))

(add-hook 'org-mode-hook #'my/org-mode-visual-setup)

;; Extra space around headings
(setq org-cycle-separator-lines 2)

;; ---------------------------------------------------------------------------
;; Visual line mode for soft wrapping (like Obsidian)
;; ---------------------------------------------------------------------------
(add-hook 'org-mode-hook #'visual-line-mode)

;; Make 0/$ go to actual line start/end in org-mode
(add-hook 'org-mode-hook
          (lambda ()
            (evil-local-set-key 'normal "0" #'evil-beginning-of-line)
            (evil-local-set-key 'normal "$" #'evil-end-of-line)
            (evil-local-set-key 'motion "0" #'evil-beginning-of-line)
            (evil-local-set-key 'motion "$" #'evil-end-of-line)))

;; Line numbers are kept enabled (configured globally in doom)

;; ---------------------------------------------------------------------------
;; Org-sidebar for headings outline
;; ---------------------------------------------------------------------------
(use-package! org-sidebar
  :commands (org-sidebar-toggle org-sidebar-tree-toggle)
  :config
  (setq org-sidebar-tree-side 'right))

;; ---------------------------------------------------------------------------
;; Variable-pitch font for body text, fixed-pitch for code (optional)
;; Uncomment if you want proportional fonts like Obsidian
;; ---------------------------------------------------------------------------
;; (add-hook 'org-mode-hook #'mixed-pitch-mode)

;; ============================================================================
;; GITHUB COPILOT
;; ============================================================================
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :config
;;   ;; Accept completions with C-f / right arrow (avoids TAB conflicts with corfu)
;;   (map! :map copilot-completion-map
;;         "C-f"       #'copilot-accept-completion
;;         "<right>"   #'copilot-accept-completion
;;         "M-f"       #'copilot-accept-completion-by-word
;;         "M-<right>" #'copilot-accept-completion-by-word
;;         "C-e"       #'copilot-accept-completion-by-line
;;         "M-n"       #'copilot-next-completion
;;         "M-p"       #'copilot-previous-completion))
