;;; -*- lexical-binding: t -*-

(paradox-require 'clojure-mode)

(paradox-require 'clj-refactor)

(paradox-require 'paredit)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (clj-refactor-mode 1)))

(with-eval-after-load "clojure-mode"
  ;;; Rebind C-x C-e to eval through nREPL in clojure-mode buffers.
  ;;(define-key clojure-mode-map (kbd "C-x C-e"))
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(provide 'zz-clojure)
