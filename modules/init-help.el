;;; -*- lexical-binding: t -*-
;;; init-help.el -- Help

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

(paradox-require 'which-key)
(which-key-mode)

;; Hit C-h C-k to have which key show top level bindings
(global-set-key (kbd "C-h C-k") 'which-key-show-top-level)

;; Set the delay before which-key appears.
(setq-default which-key-idle-delay 2.0)

;; Get cheat sheet with C-h C-m
(paradox-require 'discover-my-major)
(global-set-key (kbd "C-h C-m") 'discover-my-major)

(provide 'init-help)
