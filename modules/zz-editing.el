;;; -*- lexical-binding: t -*-
;;; zz-editing.el -- General editing

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
