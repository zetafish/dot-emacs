(paradox-require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Use M-x gist-buffer or M-x gist-region to create a gist
(paradox-require 'gist)

;; Mark uncommitted changes in the fringe.
(paradox-require 'git-gutter-fringe)
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(provide 'zz-git)
