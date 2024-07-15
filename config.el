;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Yee Fay Lim"
      user-mail-address "yeefay.lim@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept.
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; For Mac OS German keyboard
(setq mac-right-option-modifier 'none)

;; Enable windmove for easy window navigation
(use-package! windmove
  :config
  (windmove-default-keybindings))

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

;; Here are some additional functions/macros that could help you configure Doom:
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

;; Instant GitHub-flavored Markdown/Org preview using a grip subprocess
(add-hook 'markdown-mode-hook #'grip-mode)

;; Restore old substitution behaviour on s
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

;; Maximize Emacs on startup
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Specify directories for Projectile to check for projects on startup
(setq projectile-project-search-path '("~/programming/code/"))

;; Because evil-search mode ignores or smart search (or evil-ex-search-case?) overrides case-fold-search
(setq evil-ex-search-case 'sensitive)

(setq org-src-preserve-indentation nil)
(setq org-edit-src-content-indentation 0)

;; Unbind M-. in evil-normal-state-map
(define-key evil-normal-state-map (kbd "M-.") nil)

;; Enable org-mode Markdown export backend
(after! org (add-to-list 'org-export-backends 'md))

;; uncomment if ever needed again for sane Python code block indentation
(setq python-indent-guess-indent-offset-verbose t)
(setq tab-width 4)
(setq python-indent-offset 4)

;; Associate .vue Files with web-mode
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(setq web-mode-enable-current-column-highlight t)

;; Only (perhaps) relevant if I ever try to make LSP for Clojure work again
;; Remove lookup handlers conflict between LSP, cider, and clj-refactor?
;(use-package! cider
;  :after clojure-mode
;  :config
;  (set-lookup-handlers! 'cider-mode nil))
;
;(use-package! clj-refactor
;  :after clojure-mode
;  :config
;  (set-lookup-handlers! 'clj-refactor-mode nil))

;; Display en- and em-dashes in-buffer. Doesn't seem to work.
;(add-hook 'org-mode-hook (lambda () (push '("--" . ?–) prettify-symbols-alist)))
;(add-hook 'org-mode-hook (lambda () (push '("---" . ?—) prettify-symbols-alist)))
