;; Enable paredit
(paradox-require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;; Setup C-c v to eval the whole buffer in all lisps.
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

;; Highlight the sexp under the cursor
(paradox-require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode 'highlight-parentheses-mode)

;; Enable eldoc mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (eldoc-mode t)))

;; Setup M-. to jump to the definition of the symbol under the cursor.
(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(provide 'zz-elisp)
