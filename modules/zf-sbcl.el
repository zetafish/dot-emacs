;;; zf-sbcl --- SBCL development

;;; Commentary:

;;; Code:

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))
(use-package slime)

(add-hook 'lisp-mode-hook (lambda ()
                            (enable-paredit-mode)))


(provide 'zf-sbcl)
;;; zf-sbcl ends here
