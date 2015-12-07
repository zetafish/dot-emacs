(paradox-require 'flycheck)

;; Start it automatically except Elisp.
(add-hook 'find-file-hook
          (lambda ()
            (when (not (equal 'emacs-lisp-mode major-mode))
              (flycheck-mode))))

;; Jump between current errors with M-n and M-p
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; Turn the modeline red when Flycheck has errors.
(paradox-require 'flycheck-color-mode-line)

;; Configure the theme
(with-eval-after-load "flycheck"
  (setq flycheck-highlighting-mode 'symbols)
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))



(provide 'zz-flycheck)
