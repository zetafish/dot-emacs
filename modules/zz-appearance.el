;;; -*- lexical-binding: t -*-
;;; yo-appearance.el

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

;; Use the moe theme, nice 👍
(paradox-require 'moe-theme)
(moe-theme-set-color 'green)
(moe-dark)

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

;; Nyan Cat!
(paradox-require 'nyan-mode)
(nyan-mode 1)
(setq nyan-bar-length 16
      nyan-wavy-trail t)

;; Unclutter the modeline
(paradox-require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))

(provide 'zz-appearance)

