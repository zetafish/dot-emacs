(use-package magit
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package gist)

(use-package git-gutter-fringe
  :config
  (global-git-gutter-mode t)
  :diminish git-gutter-mode)

(provide 'zf-git)
