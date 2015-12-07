(paradox-require 'projectile)
(projectile-global-mode)

;; Use C-c C-f to find a file anywhere in the current project.
(global-set-key (kbd "C-c C-f") 'projectile-find-file)

(provide 'zz-project)
