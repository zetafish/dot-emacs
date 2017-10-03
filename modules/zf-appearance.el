(defun zf-appearance/dark ()
  (interactive)
  (use-package material-theme)
  (load-theme 'material))

(defun zf-appearance/light ()
  (interactive)
  (use-package material-theme)
  (load-theme 'material-light))

(defun zf-appearance/nice ()
  (interactive)
  (use-package grandshell-theme)
  (load-theme 'grandshell))

(global-linum-mode t)
(setq linum-format "%4d")

(use-package hlinum
  :config
  (hlinum-activate))

;; Show column number in modeline.
(setq column-number-mode t)

;; Show current function in modeline.
(which-function-mode)

;; Disable linum-mode in certain major modes
(setq linum-disabled-modes
      '(term-mode magit-status-mode help-mode nrepl-mode))

;; Hightlight matching braces
(show-paren-mode 1)

;; Nyan Cat!
(use-package nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-bar-length 16
	nyan-wavy-trail t))

(use-package diminish)

(provide 'zf-appearance)
