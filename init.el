(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(package-initialize)

(unless (package-installed-p 'paradox)
  (package-install 'paradox))

(paradox-require 'use-package)

(require 'use-package)

;; Enable use-package-always-enusre makes use-package install every
;; declared package automatically instead of doing it manually.
(setq use-package-always-ensure t)

(setq dotfiles-dir "~/.emacs.d/")

(add-to-list 'load-path (concat dotfiles-dir "modules"))

;; Elisp
(use-package paredit
  :commands paredit-mode
  :config (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  :diminish paredit-mode)

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  :diminish highlight-parentheses-mode)

(require 'zf-appearance)
(require 'zf-editing)
(require 'zf-completion)
(require 'zf-helm)

;; Programming
(require 'zf-clojure)
