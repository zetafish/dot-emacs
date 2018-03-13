;;; init.el --- Init file

;;; Commentary:
;;; Code:

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(require 'use-package)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(column-number-mode)   ;; Show column in modeline.
(which-function-mode)  ;; Show function in modeline.
(display-time)         ;; Show time in modeline.
(display-battery-mode) ;; Show battery status in modeline.
(show-paren-mode)      ;; Highlight matching paren.

;;(set-frame-font "Fira Mono-12" nil t)
(set-frame-font "Monaco-11" nil t)

;; Enable eldoc-mode
(add-hook 'emacs=lisp-mode-hook 'turn-on-eldoc-mode)
(add-hook 'clojure-mode 'turn-on-eldoc-mode)

(use-package grandshell-theme)
;;(use-package badwolf-theme)

(cond
 ((eq 'w32 window-system)
  (w32-send-sys-command 61488)))

(use-package ethan-wspace
  :config
  (global-ethan-wspace-mode t)
  :bind ("C-c c" . ethan-wspace-clean-all)
  :diminish ethan-wspace-mode)

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode))

(use-package diminish)

(use-package paredit
  :config
  (add-hook 'clojure-mode-hook 'paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(use-package paxedit
  :config
  (add-hook 'clojure-mode-hook 'paxedit-mode)
  (add-hook 'emacs-lisp-mode-hook 'paxedit-mode))

(use-package rjsx-mode)

(use-package exec-path-from-shell)

(use-package add-node-modules-path
  :config
  (add-hook 'rjsx-mode 'add-node-modules-path)
  (add-hook 'js2-mode 'add-node-modules-path)
  (add-hook 'js-mode 'add-node-modules-path))

(use-package eros
  :config
  (add-hook 'emacs-lisp-mode-hook 'eros-mode))

(use-package helm
  :config
  (require 'helm-config)
  (helm-mode 1)
  (setq-default helm-M-x-fuzzy-match t
		helm-buffers-fuzzy-matching t)
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x r b" . helm-filtered-bookmarks)
	 ;;("C-x C-g" . helm-do-grep)
	 ("C-x b" . helm-buffers-list)
	 ("M-y" . helm-show-kill-ring))
  :diminish helm-mode)

(use-package swiper-helm
  :bind (("C-S-s" . swiper-helm)))

(use-package helm-flx
  :config
  (helm-flx-mode 1))

(use-package helm-ext
  :config
  (helm-ext-ff-enable-skipping-dots t)
  (helm-ext-ff-enable-auto-path-expansion t))

(use-package company
  :commands company-mode
  :config
  (global-company-mode)
  :diminish company)

(use-package company-quickhelp
  :config
  (setq company-quickhelp-delay 1)
  (company-quickhelp-mode 1))

(use-package company-try-hard
  :commands company-try-hard
  :bind ("C-\\" . company-try-hard))

(use-package python)

(use-package yaml-mode)

(use-package elpy)

(use-package cider
  :commands cider-mode)

(use-package clj-refactor
  :commands cljr-refactor-mode
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'clojure-mode-hook (lambda () (clj-refactor-mode 1))))

(use-package clojure-mode
  :commands clojure-mode)


;; (require 'zf-git)
;; (require 'zf-editing)

;;; init.el ends here
