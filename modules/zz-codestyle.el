;; No tabs.
(set-default 'indent-tabs-mode nil)

;; No double spaces.
(setq sentence-end-double-space nil)

;; Always indent after a new line.
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Strict whitespace.
(paradox-require 'ethan-wspace)
(setq mode-require-final-newline nil)
(setq require-final-newline nil)
(global-ethan-wspace-mode 1)
(global-set-key (kbd "C-c c") 'ethan-wspace-clean-all)