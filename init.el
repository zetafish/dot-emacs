;;; -*- lexical-binding: t -*-
;;; init.el -- Bootstrapping emacs

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

(package-initialize)

(setq inhibit-startup-message t)

(setq dotfiles-dir "~/.emacs.d/")

(setq package-user-dir (concat dotfiles-dir "elpa"))

(add-to-list 'default-frame-alist '(width . 85))


;; Tell emacs where to our modules.
(add-to-list 'load-path (concat dotfiles-dir "modules"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; Load the user settings from `custom.el'
(load custom-file 'noerror)

;; Load the modules
(require 'init-package)
(require 'init-appearance)
(require 'init-editing)
(require 'init-dired)
(require 'init-codestyle)
(require 'init-ido)
(require 'init-helm)
(require 'init-complete)
(require 'init-project)
(require 'init-navigation)
(require 'init-git)
(require 'init-snippets)
(require 'init-flycheck)
(require 'init-help)
(require 'init-org)

(require 'init-elisp)
(require 'init-clojure)
(require 'init-python)
(require 'init-javascript)
(require 'init-haskell)
(require 'init-markdown)
(require 'init-textile)

;; Load the user's config file
(load (concat dotfiles-dir "user.el") 'noerror)

;;(toggle-debug-on-error nil)
;;(toggle-debug-on-quit nil)

(setq backup-directory-alist '(("." . "~/.saves")))
