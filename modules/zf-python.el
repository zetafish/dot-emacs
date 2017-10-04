;; (use-package jedi
;;   :ensure t
;;   :init
;;   (add-hook 'python-mode-hook 'jedi:setup)
;;   (add-hook 'python-mode-hook 'jedi:ac-setup))


;;(use-package jedi)

;;; company-mode completion back-end for Python JEDI
(use-package company-jedi
  :config
  ;;(setq jedi:environment-virtualenv (list (expand-file-name "~/.emacs.d/.venv/")))
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq jedi:use-shortcuts t)
  (defun config/enable-company-jedi ()
    (add-to-list 'company-backends 'company-jedi))
  (add-hook 'python-mode-hook 'config/enable-company-jedi))

(provide 'zf-python)
