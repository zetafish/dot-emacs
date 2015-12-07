(paradox-require 'which-key)
(which-key-mode)

;; Hit C-h C-k to have which key show top level bindings
(global-set-key (kbd "C-h C-k") 'which-key-show-top-level)

;; Set the delay before which-key appears.
(setq-default which-key-idle-delay 2.0)

;; Get cheat sheet with C-h C-m
(paradox-require 'discover-my-major)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(provide 'zz-help)
