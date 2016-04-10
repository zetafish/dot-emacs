;;; -*- lexical-binding: t -*-
;;; init-codestyle.el -- Code style

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

;; Set default indentations for various languages
(setq-default tab-width 4)

;; JSON
(setq-default js-indent-level 2)

;; Python
(setq-default py-indent-offset 4)

;; XML
(setq-default nxml-child-indent 2)

(provide 'init-codestyle)
