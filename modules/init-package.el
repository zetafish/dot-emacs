;;; -*- lexical-binding: t -*-
;;; init-package.el -- Package management

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

;; Emacs comes with a package manager for installing more features.
;; The default pacakge repository doesn't contain much, so we tell it
;; to use MELPA as well.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

;; To get the package manager going, invoke its initialise function.
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;; `Paradox' is an enhanced interface for package management.
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))


(provide 'init-package)
