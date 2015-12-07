;;; -*- lexical-binding: t -*-
;;; zz-appearance.el

;; Copyright (C) 2015 Endymion Kasanardjo

;; Author: Endymion Kasanardjo <zetafish@gmail.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program. If not, see <http://www.gnu.org/licenses/>.


;; Appearance
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font "Monaco-12" nil t)

(defun select-theme-moe ()
  (interactive)
  (paradox-require 'moe-theme)
  (moe-theme-set-color 'purple)
  (moe-dark)
  (set-face-background 'default "#000")
  (set-face-background 'fringe "#000")
  (set-face-background 'linum "#000")
  (set-face-foreground 'linum "#444444"))


(defun select-theme-monokai ()
  (interactive)
  (paradox-require 'monokai-theme)
  (load-theme 'monokai t))


(defun select-theme-ample ()
  (interactive)
  (paradox-require 'ample-theme)
  ;; (load-theme 'ample-flat t t)
  (load-theme 'ample t))

(defun select-theme-cyberpunk ()
  (interactive)
  (paradox-require 'cyberpunk-theme)
  (load-theme 'cyberpunk t))

(defun select-theme-molokai ()
  (interactive)
  (paradox-require 'molokai-theme)
  (load-theme 'molokai t))

(defun select-theme-alect ()
  (interactive)
  (paradox-require 'alect-themes)
  (load-theme 'alect-dark t))

;;(select-theme-ample)
;;(select-theme-monokai)
;;(select-theme-moe)
(select-theme-cyberpunk)
;;(select-theme-molokai)
;;(select-theme-alect)

;; Show line numbers.
(global-linum-mode t)
(setq linum-format "%4d ")

;; Highlight the line number of the current line.
(paradox-require 'hlinum)
(hlinum-activate)

;; Show column numners in modeline.
(setq column-number-mode t)

;; Disable linum-mode in certain kind of modes.
(setq linum-disabled-modes
      '(term-mode slime-repl-mode magit-status-mode help-mode nrepl-mode))
(defun linum-on ()
  (unless (or (minibufferp) (member major-mode linum-disabled-modes))
    (linum-mode 1)))

;; Highlight matchin parenthesis.
(show-paren-mode 1)
(setq show-paren-style 'paren)

(highlight-parentheses-mode 1)

(paradox-require 'rainbow-delimiters)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Nyan Cat!
(paradox-require 'nyan-mode)
(nyan-mode 1)
(setq nyan-bar-length 16
      nyan-wavy-trail t)

;; More status.
(display-time)
(display-battery-mode)

;; Unclutter the modeline
(paradox-require 'diminish)

(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "ethan-wspace" '(diminish 'ethan-wspace-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "anzu" '(diminish 'anzu-mode))
(eval-after-load "cider" '(diminish 'cider-mode))
(eval-after-load "rainbow-mode" '(diminish 'rainbow-mode))
(eval-after-load "git-gutter" '(diminish 'git-gutter-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "highlight-parentheses" '(diminish 'highlight-parentheses-mode))
(eval-after-load "which-key" '(diminish 'which-key-mode))
(eval-after-load "volatile-highlights" '(diminish 'volatile-highlights-mode))
(eval-after-load "flycheck" '(diminish 'flycheck-mode))

(provide 'zz-appearance)

