;;; -*- lexical-binding: t -*-

(paradox-require 'clojure-mode)

(paradox-require 'clj-refactor)

(paradox-require 'paredit)

(paradox-require 'flycheck-clojure)
(paradox-require 'flycheck-pos-tip)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (clj-refactor-mode 1)))


(with-eval-after-load "clojure-mode"
  ;;; Rebind C-x C-e to eval through nREPL in clojure-mode buffers.
  ;;(define-key clojure-mode-map (kbd "C-x C-e"))
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(with-eval-after-load "flycheck"
  (flycheck-clojure-setup)
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
  (flycheck-mode))

;;(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)

;;(eval-after-load 'flycheck '(flycheck-clojure-setup))
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'zz-clojure)
