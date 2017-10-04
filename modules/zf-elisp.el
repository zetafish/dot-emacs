(use-package paredit
  :demand t
  :commands paredit-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
  (define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)
  :diminish paredit-mode)

(use-package highlight-parentheses
  :commands highlight-parentheses-mode
  :config
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  :diminish highlight-parentheses-mode)

(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)

;; Eros mode shows the result of evaluating en elisp command as an
;; overlay in the elisp buffer.
(use-package eros
  :config
  (add-hook 'emacs-lisp-mode-hook 'eros-mode))

(provide 'zf-elisp)
