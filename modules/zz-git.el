(paradox-require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(paradox-require 'gist)

;; Mark uncommitted changes in the fringe.
(paradox-require 'git-gutter-fringe)
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(set-face-foreground 'git-gutter-fr:modified "red")
(set-face-foreground 'git-gutter-fr:added "magenta")
(set-face-foreground 'git-gutter-fr:deleted "white")
(setq git-gutter-fr:side 'left-fringe)

(provide 'zz-git)
