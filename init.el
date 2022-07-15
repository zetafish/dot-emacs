;;; init.el --- Init file

;;; Commentary:
;;; Code:

;; Startup
(setq inhibit-splash-screen t)

;; Get rid of noise.
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq ring-bell-function 'ignore)

;; Backup settings.
(setq backup-by-copying t)
(setq backup-directory-alist '(("." . "~/.saves")))
(setq delete-old-versions t)
(setq kept-new-versions 6)
(setq kept-old-versions 2)
(setq version-control t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(column-number-mode)        ; Show column in modeline.
(which-function-mode)       ; Show current function in modeline.
(display-time)              ; Show time in modeline.
(display-battery-mode)      ; Show battery in modeline.
(show-paren-mode 1)         ; Highlight matching braces.
(global-linum-mode)         ; Show line numbers

;;(set-frame-font "Monaco-14" nil t)
(set-frame-font "JetBrains Mono-15" nil t)
;;(set-frame-font "Courier New-13" nil t)
;;(set-frame-font "Andale Mono-15" nil t)
;;(set-frame-font "courier-13" nil t)
;;(set-frame-font "Monofur-13" nil t)
;;(set-frame-font "Hack-14" nil t)
;;(set-frame-font "Inconsolata" nil t)
;;(set-frame-font "Roboto Mono for Powerline-15" nil t)

(global-set-key (kbd "C-c <tab>") 'indent-buffer)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Turn off tabs.
(set-default 'indent-tabs-mode nil)

;; Automatically reload files when they change
(global-auto-revert-mode t)

(package-initialize)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;;(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/typescript.el")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package grandshell-theme :defer t)
(use-package solarized-theme :defer t)
(use-package monokai-theme :defer t)
(use-package noctilux-theme :defer t)
(use-package color-theme-sanityinc-solarized :defer t)
(use-package dracula-theme :defer t)
(use-package doom-themes :defer t)
(use-package ubuntu-theme :defer t)
(use-package gotham-theme :defer t)

;;(load-theme 'ubuntu)
;;(load-theme 'gotham)
;;(load-theme 'grandshell t)
;;(load-theme 'doom-acario-dark)
;;(load-theme 'dracula t)
;;(load-theme 'doom-sourcerer t)
;;(load-theme 'doom-tomorrow-night t)
;;(load-theme 'doom-tomorrow-day t)
;;(load-theme 'doom-city-lights)
;;(load-theme 'doom-vibrant  t)
(load-theme 'doom-one t)
;;(load-theme 'leuven t)

(use-package diminish)

(use-package company
  :diminish)

(global-company-mode)

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (highlight-parentheses-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  (add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
  :diminish)

(use-package paredit
 :demand t
 :commands paredit-mode
 :config
 (add-hook 'lisp-mode-hook 'paredit-mode)
 (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
 (add-hook 'clojure-mode-hook 'paredit-mode)
 :diminish)

(use-package origami)

(use-package nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-bar-length 16
        nyan-wavy-trail t))

(use-package transpose-frame)

(use-package magit
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package diff-hl
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

;;; https://elpa.gnu.org/packages/counsel.html
(use-package counsel)

(use-package ivy
  :config
  (ivy-mode 1)
  (counsel-mode 1)
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :bind (("C-s" . swiper-isearch)
         ("C-x C-f" . counsel-find-file)
         ("C-x b" . counsel-switch-buffer)
         ("C-r" . counsel-minibuffer-history))
  :diminish ivy-mode counsel-mode)

(use-package flx)

;; ;; Multiple cursors
;; ;;
;; ;; Use <insert> to place cursor on the next match for the selection
;; ;; Use S-<insert> to place on the previous match
;; ;; Use C-' to use extended mark mode
;; ;; Use C-" to place cursor on all matches
;; ;; Select a region and C-M-' to place cursors on each line of the selection
;; (use-package multiple-cursors
;;   :commands multiple-cursors-mode
;;   :config
;;   (bind-keys :map mc/keymap
;;              ("C-'" . nil))
;;   :bind (("<insert>" . mc/mark-next-like-this)
;;          ("S-<insert>" . mc/mark-previous-like-this)
;;          ("C-'" . mc/mark-more-like-this-extended)
;;          ("C-\"" . mc/mark-all-like-this-dwim)
;;          ("C-M-'" . mc/edit-lines)))

;; ;; Use C-= to select innermost logical unit the cursor is on. Keep
;; ;; hitting C-= to expand it to the next logical unit.
;; (use-package expand-region
;;   :commands er/expand-region
;;   :bind ("C-=" . er/expand-region))

;; ;; Use C-c <tab> to auto-indent the entire buffer
;; (defun indent-buffer ()
;;   "Auto indent entire buffer."
;;   (interactive)
;;   (indent-region (point-min) (point-max)))

;; ;; Highlight areas with certain operations, such as undo, kill, yank.
;; (use-package volatile-highlights
;;   :commands volatile-highlights-mode
;;   :config
;;   (volatile-highlights-mode t)
;;   :diminish volatile-highlights-mode)

(setq mode-require-final-newline nil)

(use-package ethan-wspace
  :demand t
  :commands ethan-wspace-mode
  :config
  (global-ethan-wspace-mode t)
  :bind ("C-c c" . ethan-wspace-clean-all)
  :diminish)

(use-package rainbow-mode)

(use-package rainbow-delimiters)

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)))

(use-package hl-todo
  :config
  (global-hl-todo-mode t))

(use-package rjsx-mode)

(use-package json-mode)

(use-package json-reformat)

(use-package prettier-js
  :config
  (add-hook 'rjsx-mode-hook 'prettier-js-mode)
  (add-hook 'js-mode-hook 'prettier-js-mode)
  (add-hook 'js2-mode-hook 'prettier-js-mode))

(use-package add-node-modules-path
  :config
  (add-hook 'prettier-js-mode-hook 'add-node-modules-path))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((clojure-mode . lsp)
         (clojurescript-mode . lsp)
         (clojurec-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-code-actions nil)
  (setq lsp-ui-sideline-update-mode 'point))


(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)


(use-package which-key
    :config
    (which-key-mode))

;; [M-x] lsp-install-server [RET] clojure-lsp

(with-eval-after-load 'lsp-mode
  ;; :global/:workspace/:file
  ;;(lsp-lens-mode)
  (setq lsp-modeline-diagnostics-scope :workspace)
  (setq lsp-headerline-breadcrumb-enable nil))

(use-package clj-refactor
  :commands clj-refactor-mode
  :init
  (add-hook 'clojure-mode-hook 'clj-refactor-mode))

(use-package flycheck-clj-kondo
  :ensure t)

(load-library "cljstyle-mode.el")

(use-package zprint-mode
  :config
  ;;(add-hook 'clojure-mode-hook 'zprint-mode)
  ;;(add-hook 'clojurescript-mode-hook 'zprint-mode)
  )

(use-package clojure-mode
  :ensure t
  :config
  (add-hook 'clojure-mode-hook 'cljstyle-mode)
  (require 'flycheck-clj-kondo))

(use-package kaocha-runner
  :init
  (bind-keys :prefix-map ar-emacs-kaocha-prefix-map
             :prefix "C-c k"
             ("t" . kaocha-runner-run-test-at-point)
             ("r" . kaocha-runner-run-tests)
             ("a" . kaocha-runner-run-all-tests)
             ("w" . kaocha-runner-show-warnings)
             ("h" . kaocha-runner-hide-windows)))

(use-package cider
  :commands cider-mode
  :config
  ;;(setq cider-clojure-cli-global-options "-R:dev:test:build")
  ;;(setq cider-clojure-cli-global-options "-R:dev:test -C:dev:test")
  :bind (("C-c C-t t" . cider-test-run-test)
         ("C-c C-t n" . cider-test-run-ns-tests)
         ("C-M-x" . cider-eval-last-sexp)))

(use-package sayid
  :config
  (eval-after-load 'clojure-mode
    '(sayid-setup-package)))

(use-package projectile
  :diminish
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

;; (use-package flycheck-joker
;;   :demand t)

;; (use-package flycheck-clj-kondo
;;   :demand t)

;; (dolist (checkers '((clj-kondo-clj . clojure-joker)
;;                     (clj-kondo-cljs . clojurescript-joker)
;;                     (clj-kondo-cljc . clojure-joker)
;;                     (clj-kondo-edn . edn-joker)))
;;   (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))

(use-package clojure-mode-extra-font-locking)

(use-package docker-compose-mode)

(use-package blacken
  :init
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package go-mode)

(use-package yafolding)

(use-package typescript-mode)

(setq-default json-indent-level 2)
(setq-default js-indent-level 2)
(setq-default js2-indent-level 4)
(setq-default jsx-indent-level 4)
(setq-default sgml-basic-offset 2)
(setq-default js2-basic-offset 2)
(setq-default css-indent-offset 2)


;; See: https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(setq org-agenda-files (list "~/todo.org"))
;;(setq org-todo-keywords '((sequence "TODO")))

;; (global-set-key (kbd "C-c a") 'org-agenda)
;; (setq org-agenda-files (quote "/Users/endymion/todo.org"))
;; (setq org-highest-priority ?A)
;; (setq org-lowest-priority ?C)
;; (setq org-default-priority ?B)
;; (setq org-priority-faces '((?A . (:foreground "#F0DFAF" :weight bold))
;;                            (?B . (:foreground "LightSteelBlue"))
;;                            (?C . (:foreground "OliveDrab"))))
;; (define-key global-map (kbd "C-c c") 'org-capture)
;; (setq org-capture-templates
;;       '(("t" "todo" entry (file+headline "/Users/endymion/todo.org" "Tasks")
;;          "* TODO [#A] %?")))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(provide 'init)
;;; init.el ends here
