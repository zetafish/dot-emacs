;; Multiple cursors!
(paradox-require 'multiple-cursors)

;; Remap join-line to M-j
(global-set-key (kbd "M-j") 'join-line)

;; Hit C-c <tab> to auto-indet the enitre buffer.
(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))
(global-set-key (kbd "C-c <tab>") 'indent-buffer)

;; Automatically insert matchin braces.
(electric-pair-mode 1)

;; Shrink whitespace
(paradox-require 'shrink-whitespace)
(global-set-key (kbd "C-c DEL") 'shrink-whitespace)

;; Highlight changed areas.
(paradox-require 'volatile-highlights)
(volatile-highlights-mode t)


(provide 'zz-editing)
