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
(set-frame-font "Monaco-15" nil t)
;; (set-frame-font "Mono-12" nil t)
;; (set-frame-font "Courier New-13" nil t)
;; (set-frame-font "Andale Mono-13" nil t)
;; (set-frame-font "courier-13" nil t)
;; (set-frame-font "Monofur-13" nil t)
;; (set-frame-font "Hack-12" nil t)
;; (set-frame-font "Sauce Code Powerline-12" nil t)
;; (set-frame-font "Inconsolata-13" nil t)

(global-set-key (kbd "C-c <tab>") 'indent-buffer)
(global-set-key (kbd "M-j") 'join-line)
(global-set-key (kbd "RET") 'newline-and-indent)

;; Turn off tabs.
(set-default 'indent-tabs-mode nil)

;; Automatically reload files when they change
(global-auto-revert-mode t)

(defun present-on ()
  "Enter presentation mode."
  (interactive)
  (set-face-attribute 'default nil :height 200))

(defun present-off ()
  "Leave presentation mode."
  (interactive)
  (set-face-attribute 'default nil :height 120))

(package-initialize)

(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/elisp")

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

;;(load-theme 'grandshell t)
;;(load-theme 'dracula t)
;;(load-theme 'doom-sourcerer t)
(load-theme 'doom-tomorrow-night t)
;;(load-theme 'doom-tomorrow-day t)
;;(load-theme 'doom-vibrant  t)
;;(load-theme 'doom-one t)
;;(load-theme 'leuven t)

(use-package diminish
  :config
  (diminish 'eldoc-mode))

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (highlight-parentheses-mode 1)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  (add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
  :diminish highlight-parentheses-mode)

(use-package paredit
 :demand t
 :commands paredit-mode
 :config
 (add-hook 'lisp-mode-hook 'paredit-mode)
 (add-hook 'emacs-lisp-mode-hook 'paredit-mode)
 (add-hook 'clojure-mode-hook 'paredit-mode)
 :diminish paredit-mode)

(use-package paxedit
  :commands paxedit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'enable-paxedit-mode)
  (add-hook 'clojure-mode-hook 'enabled-paxedit-mode)
  :bind (:map paxedit-mode-map
              ("M-<right>" . paxedit-transpose-forward)
              ("M-<left>" . paxedit-transpose-backward)
              ("M-<up>" . paxedit-backward-up)
              ("M-<down>" . paxedit-backward-end)
              ("M-b" . paxedit-previous-symbol)
              ("M-f" . paxedit-next-symbol)
              ("C-&" . paxedit-kill)
              ("C-%" . paxedit-copy)
              ("C-*" . paxedit-delete)
              ("C-^" . paxedit-sexp-raise)
              ;; Symbol backward/forward kill
              ("C-w" . paxedit-backward-kill)
              ("M-w" . paxedit-forward-kill)
              ;; Symbol manipulation
              ("M-u" . paxedit-symbol-change-case)
              ("C-@" . paxedit-symbol-copy)
              ("C-#" . paxedit-symbol-kill)))

(use-package nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-bar-length 16
        nyan-wavy-trail t))

(use-package transpose-frame)

(use-package magit
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package gitignore-mode)

(use-package diff-hl
  :config
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh))

;; (use-package gist)

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

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

(use-package ethan-wspace
  :demand t
  :commands ethan-wspace-mode
  :config
  (global-ethan-wspace-mode t)
  :bind ("C-c c" . ethan-wspace-clean-all)
  :diminish ethan-wspace-mode)

(use-package rainbow-mode)

(use-package rainbow-delimiters)

;;(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;;(add-hook 'clojure-mode-hook 'eldoc-mode)

(when (memq window-system '(mac ns))
  (use-package exec-path-from-shell
    :ensure t
    :config (exec-path-from-shell-initialize)))

;; (use-package python)

;; (use-package yaml-mode)

;; ;; (use-package elpy
;; ;;   :init
;; ;;   (elpy-enable))

;; ;; (use-package py-yapf
;; ;;   :config)

;; (use-package sphinx-doc
;;   :config
;;   (add-hook 'python-mode-hook 'sphinx-doc-mode))

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
  :commands clj-refactor-mode
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (add-hook 'clojure-mode-hook 'clj-refactor-mode))



(use-package cider
  :commands cider-mode
  :config
  (setq cider-clojure-cli-global-options "-R:dev:test")
  ;;(setq cider-clojure-cli-global-options "-R:dev:test -C:dev:test")
  :bind (("C-c C-t t" . cider-test-run-test)
         ("C-c C-t n" . cider-test-run-ns-tests)
         ("C-M-x" . cider-eval-last-sexp)))

(use-package sayid
  :config
  (eval-after-load 'clojure-mode
    '(sayid-setup-package)))

(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (projectile-mode +1))

(use-package clojure-mode
  :commands clojure
  :config
  (setq clojure-indent-style :always-align)
  (add-hook 'clojure-mode-hook
            (lambda ()
              (rainbow-delimiters-mode-enable)
              (define-clojure-indent
                (context 2) (GET 2) (POST 2) (DELETE 2) (PATCH 2))))
  ;;(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
  )

;; (use-package flycheck-clojure
;;   :config
;;   (eval-after-load 'flycheck '(flycheck-clojure-setup))
;;   (add-hook 'after-init-hook 'global-flycheck-mode))

;; (use-package flycheck-clojure)

;; ;; (use-package flycheck-pos-tip
;; ;;   :config
;; ;;   (eval-after-load 'flycheck '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-joker
  :demand t)

(use-package flycheck-clj-kondo
  :demand t)

(dolist (checkers '((clj-kondo-clj . clojure-joker)
                    (clj-kondo-cljs . clojurescript-joker)
                    (clj-kondo-cljc . clojure-joker)
                    (clj-kondo-edn . edn-joker)))
  (flycheck-add-next-checker (car checkers) (cons 'error (cdr checkers))))

(use-package clojure-mode-extra-font-locking)

(use-package docker-compose-mode)

;; (use-package slime
;;   :config
;;   (setq inferior-lisp-program "/usr/local/bin/sbcl")
;;   (setq slime-contribs '(slime-fancy)))


;; (use-package jsonnet-mode)

;; ;;(use-package company-jedi)
;; (use-package python-docstring)
;; (use-package sphinx-doc)
;; (use-package python
;;   :config (setq python-shell-interpreter "python"
;;                 python-shell-interpreter-args "--profile=dev -i")
;;   :init
;;   (add-hook 'python-mode-hook (lambda ()
;;                                   (auto-complete-mode -1)
;;                                 (python-docstring-mode)
;;                                 (sphinx-doc-mode))))

(use-package blacken
  :init
  (add-hook 'python-mode-hook 'blacken-mode))

(use-package go-mode)

(use-package yafolding)

;;(use-package restclient)

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
