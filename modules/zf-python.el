;;; zf-python.el -- Python development

;;; Commentary:
;; Copyright (C) 2017 Endymion Kasanardjo
;; Author: Endymion Kasanardjo <zetafish@gmail.com>

;;; Code:

(use-package company-jedi
  :config
  ;;(setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.venv/")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi))

(use-package elpy)

(use-package python)

(use-package yaml-mode)

(provide 'zf-python)

;;; zf-python ends here
