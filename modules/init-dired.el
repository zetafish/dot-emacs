;;; -*- lexical-binding: t -*-
;;; init-dired.el -- Directory editing

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

;; dired+ is an enhanced version of the built-in Emacs directory editor.
(paradox-require 'dired+)
(setq diredp-hide-details-initially-flag nil)
(require 'dired+)
(set-face-foreground 'diredp-file-name nil)

;; Keep dired buffers updated when the file system changes.
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; TODO (defun delete-current-buffer-file () ...)
;; TODO (defun rename-current-buffer-file () ...)

(provide 'init-dired)
