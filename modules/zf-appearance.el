;;; zf-appearance --- Appearance

;;; Commentary:

;;; Code:

(defun zf-appearance/dark ()
  "Set dark theme."
  (interactive)
  (use-package material-theme)
  (load-theme 'material))

(defun zf-appearance/light ()
  "Set light theme."
  (interactive)
  (use-package material-theme)
  (load-theme 'material-light))

(defun zf-appearance/nice ()
  "Set nice theme."
  (interactive)
  (use-package grandshell-theme)
  (load-theme 'grandshell))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))


(zf-appearance/nice)

(global-linum-mode t)
(setq linum-format "%4d ")

(use-package hlinum
  :config
  (hlinum-activate))

;; Show column number in modeline.
(setq column-number-mode t)

;; Show current function in modeline.
(which-function-mode)

;; Show time in modeline
(display-time)

;; Show battery mode in the modeline
(display-battery-mode)

;; Disable linum-mode in certain major modes
(setq linum-disabled-modes
      '(term-mode magit-status-mode help-mode nrepl-mode))

;; Hightlight matching braces
(show-paren-mode 1)

(use-package highlight-parentheses
  :config
  (highlight-parentheses-mode 1))

;; Nyan Cat!
(use-package nyan-mode
  :config
  (nyan-mode 1)
  (setq nyan-bar-length 16
        nyan-wavy-trail t))

(use-package transpose-frame)

(use-package diminish)

(eval-after-load "eldoc" '(diminish 'eldoc-mode))

(provide 'zf-appearance)
;;; zf-appearance ends here
