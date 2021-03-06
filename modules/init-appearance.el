;;; -*- lexical-binding: t -*-
;;; init-appearance.el

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
(when window-system
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(set-frame-font "Monaco-12" nil t)

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

(paradox-require 'highlight-parentheses)
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
(eval-after-load "highlight-indentation" '(diminish 'highlight-indentation-mode))

;; Load a bunch of themes
;; (paradox-require 'moe-theme)
;; (paradox-require 'monokai-theme)
;; (paradox-require 'ample-theme)
;; (paradox-require 'cyberpunk-theme)
;; (paradox-require 'molokai-theme)
;; (paradox-require 'alect-themes)
;; (paradox-require 'moe-theme)
;; (paradox-require 'noctilux-theme)
;; (paradox-require 'gotham-theme)

;; (defun apply-darkness ()
;;   (interactive)
;;   (set-face-background 'default "#000")
;;   (set-face-background 'fringe "#000")
;;   (set-face-background 'linum "#000")
;;   (set-face-foreground 'linum "#444444"))



;;(load-theme 'ample-flat t)
;;(load-theme 'ample t)
;;(moe-dark)
;;(moe-light)
;;(moe-theme-set-color 'purple)
;;(load-theme 'alect-dark t)
;;(load-theme 'alect-light t)
;;(load-theme 'whiteboard t)
;;(load-theme 'leuven t)
;;(load-theme 'abyss t)
;;(load-theme 'cyberpunk t)
;;(load-theme 'noctilux t)
;;(load-theme 'leuven t)
;;(load-theme 'gotham t)

(paradox-require 'switch-window)

(provide 'init-appearance)
