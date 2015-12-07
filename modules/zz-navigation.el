;; Make PgUp/Dn move the point.
(setq scroll-error-top-bottom t)

;; Avy is a quick way to jump around your buffers.
(paradox-require 'avy)
(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-:") 'avy-goto-char)
(with-eval-after-load "isearch"
  (define-key isearch-mode-map (kbd "C-;") 'avy-isearch))

;; Enhance C-x o when more than two windows are open.
(paradox-require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x C-o") 'ace-swap-window)

;; Use Cx M-p to kill the buffer in the other window, revealing
;; the next buffer in the stack.
(global-set-key (kbd "C-x M-p")
                (lambda () (interactive)
                  (save-excursion
                    (other-window 1)
                    (quit-window))))

;; Display incremental search stats in the modeline.
(paradox-require 'anzu)
(global-anzu-mode 1)

(global-set-key (kbd "C-%") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)


(provide 'zz-navigation)
