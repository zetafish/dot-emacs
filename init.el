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

;;(set-frame-font "Fira Mono-13" nil t)
(set-frame-font "Monaco-12" nil t)
;;(set-frame-font "Andale Mono-13" nil t)
;; (set-frame-font "courier-13" nil t)
;;(set-frame-font "inconsolata-14" nil t)

(global-set-key (kbd "C-c <tab>") 'indent-buffer)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Turn off tabs.
(set-default 'indent-tabs-mode nil)

(defun present-on ()
  "Enter presentation mode."
  (interactive)
  (set-face-attribute 'default nil :height 200))

(defun present-off ()
  "Leave presentation mode."
  (interactive)
  (set-face-attribute 'default nil :height 130))

(package-initialize)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

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

(load-theme 'grandshell t)

(use-package diminish)

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (highlight-parentheses-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  :diminish highlight-parentheses-mode)

(use-package paredit
  :demand t
  :commands paredit-mode
  :config
  (add-hook 'lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)
  :diminish paredit-mode)

(use-package paxedit
  :commands paxedit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'enable-paxedit-mode)
  (add-hook 'clojure-mode-hook 'enabled-paxedit-mode))

(use-package nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-bar-length 16
        nyan-wavy-trail t))

(use-package transpose-frame)

(use-package company
  :demand t
  :commands company-mode
  :config

  ;; Enable company-mode globally.
  (global-company-mode)

  ;; Except when in term-mode
  (setq company-global-modes '(not term-mode))

  ;; Set some default configuration
  (setq company-minimum-prefix-length 2
        company-selection-wrap-around t
        company-show-numbers t
        company-tooltip-align-annotations t
        company-require-match nil
        company-dabbrev-downcase nil
        company-dabbrev-ignore-case nil)

  ;; Sort completion candidates that already occur in the current
  ;; buffer at the top of the candidate list
  (setq company-transformers '(company-sort-by-occurrence))

  :diminish company-mode)

(use-package company-quickhelp
  :config
  (setq company-quickhelp-delay 1)
  (company-quickhelp-mode 1))

(use-package company-try-hard
  :commands company-try-hard
  :bind ("C-\\" . company-try-hard))

(use-package company-emoji
  :config
  (company-emoji-init))

(use-package magit
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package diff-hl)

(use-package gist)

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)
  (helm-mode 1)
  (setq-default helm-display-header-line nil
                helm-autoresize-min-height 10
                helm-autoresize-max-height 35
                helm-split-window-in-side-p t
                helm-M-x-fuzzy-match t
                helm-buffer-fuzzy-matching t
                helm-recentf-fuzzy-match t
                helm-apropos-fuzzy-match t)
  (set-face-attribute 'helm-source-header nil :height 0.75)

  :bind (("M-x" . helm-M-x)
         ("C-x C-f" . helm-find-files)
         ("C-x C-g" . helm-do-grep)
         ("C-x b" . helm-buffers-list)
         ("C-x c g" . helm-google-suggest)
         ("C-t" . helm-imenu)
         ("M-y" . helm-show-kill-ring))

  :diminish helm-mode)

(use-package swiper-helm
  :bind (("C-S-s" . swiper-helm)))

(use-package helm-flx
  :config
  (with-eval-after-load "helm"
    (require 'helm-flx)
    (helm-flx-mode 1)))

(use-package helm-ext
  :config
  (helm-ext-ff-enable-skipping-dots t)
  (helm-ext-ff-enable-auto-path-expansion t))

;; (use-package ivy
;;   :config
;;   (ivy-mode 1)
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) ")
;;   (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

(use-package counsel)

(use-package flx)

;; Multiple cursors
;;
;; Use <insert> to place cursor on the next match for the selection
;; Use S-<insert> to place on the previous match
;; Use C-' to use extended mark mode
;; Use C-" to place cursor on all matches
;; Select a region and C-M-' to place cursors on each line of the selection
(use-package multiple-cursors
  :commands multiple-cursors-mode
  :config
  (bind-keys :map mc/keymap
             ("C-'" . nil))
  :bind (("<insert>" . mc/mark-next-like-this)
         ("S-<insert>" . mc/mark-previous-like-this)
         ("C-'" . mc/mark-more-like-this-extended)
         ("C-\"" . mc/mark-all-like-this-dwim)
         ("C-M-'" . mc/edit-lines)))

;; Use C-= to select innermost logical unit the cursor is on. Keep
;; hitting C-= to expand it to the next logical unit.
(use-package expand-region
  :commands er/expand-region
  :bind ("C-=" . er/expand-region))

;; Use C-c <tab> to auto-indent the entire buffer
(defun indent-buffer ()
  "Auto indent entire buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;; Highlight areas with certain operations, such as undo, kill, yank.
(use-package volatile-highlights
  :commands volatile-highlights-mode
  :config
  (volatile-highlights-mode t)
  :diminish volatile-highlights-mode)

(use-package ethan-wspace
  :demand t
  :commands ethan-wspace-mode
  :config
  (global-ethan-wspace-mode t)
  :bind ("C-c c" . ethan-wspace-clean-all)
  :diminish ethan-wspace-mode)

(use-package terraform-mode)

(use-package company-terraform
  :init
  (company-terraform-init))

(use-package markdown-mode
  :ensure t
  :commands markdown-mode gfm-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package rainbow-mode)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'clojure-mode-hook 'eldoc-mode)

(use-package eros
  :config
  (add-hook 'emacs-lisp-mode-hook 'eros-mode))

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)))

(use-package python)

(use-package yaml-mode)

(use-package elpy
  :init
  (elpy-enable))

(use-package py-yapf
  :config)

(use-package sphinx-doc
  :config
  (add-hook 'python-mode-hook 'sphinx-doc-mode))

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

(use-package clj-refactor
  ;; :pin melpa-stable
  :commands clj-refactor-mode
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'clojure-mode-hook 'clj-refactor-mode))

(use-package cider
  :commands cider-mode
  ;; :pin melpa-stable
  :bind (("C-c C-t t" . cider-test-run-test)
         ("C-c C-t n" . cider-test-run-ns-tests)
         ("C-M-x" . cider-eval-last-sexp)))

(use-package helm-cider
  :config
  (add-hook 'clojure-mode-hook 'helm-cider-mode))

(use-package sayid
  :config
  (eval-after-load 'clojure-mode
    '(sayid-setup-package)))

(use-package projectile
  :ensure t
  ;; :pin melpa-stable
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package clojure-mode
  :commands clojure
  :config
  (setq clojure-indent-style :align-arguments)
  (add-hook 'clojure-mode-hook
            (lambda ()
              (define-clojure-indent
                ;; Core
                (send-off 1)

                ;; Compojure
                (ANY 2) (GET 2) (POST 2) (PUT 2) (PATCH 2)
                (DELETE 2) (OPTIONS 2) (context 2)

                ;; Expect-call
                (expect-call 1)

                ;; Specter
                (recursive-path 1)

                ;; Om
                (render 1)))))

;; (use-package flycheck-clojure
;;   :config
;;   (eval-after-load 'flycheck '(flycheck-clojure-setup))
;;   (add-hook 'after-init-hook 'global-flycheck-mode))

(use-package flycheck-pos-tip
  :config
  (eval-after-load 'flycheck '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(use-package make-mode)

(use-package groovy-mode
  :mode ("Jenkinsfile" . groovy-mode)
  :config
  (add-hook 'groovy-mode-hook (lambda ()
                                (c-set-offset 'label 2))))

;; (use-package flycheck
;;   :config
;;   (flycheck-add-mode 'javascript-eslint 'rjsx-mode))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package flycheck-joker)

(use-package clojure-mode-extra-font-locking)

;;(use-package flower)

;;(use-package troncle)

(use-package slime
  :config
  (setq inferior-lisp-program "/usr/local/bin/sbcl")
  (setq slime-contribs '(slime-fancy)))

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

(use-package dockerfile-mode)

(use-package jira-markup-mode)

;;(use-package web-mode)

(use-package helm-ag)

(setq-default json-indent-level 4)
(setq-default js-indent-level 2)
(setq-default js2-indent-level 4)
(setq-default jsx-indent-level 4)
(setq-default sgml-basic-offset 2)
(setq-default js2-basic-offset 2)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(provide 'init)
;;; init.el ends here
