;;; -*- lexical-binding: t -*-

(paradox-require 'clojure-mode)

(paradox-require 'clj-refactor)

(paradox-require 'paredit)

(paradox-require 'flycheck-clojure)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (clj-refactor-mode 1)))


(with-eval-after-load "clojure-mode"
  ;;; Rebind C-x C-e to eval through nREPL in clojure-mode buffers.
  ;;(define-key clojure-mode-map (kbd "C-x C-e"))
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(eval-after-load 'flycheck '(flycheck-clojure-setup))
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'zz-clojure)
