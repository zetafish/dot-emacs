;;; -*- lexical-binding: t -*-
;;; init-elisp.el -- Emacs Lisp

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

;; Enable paredit
(paradox-require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

;; Setup C-c v to eval the whole buffer in all lisps.
(define-key lisp-mode-shared-map (kbd "C-c v") 'eval-buffer)

;; Highlight the sexp under the cursor
(paradox-require 'highlight-parentheses)
(add-hook 'emacs-lisp-mode 'highlight-parentheses-mode)

;; Enable eldoc mode
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (eldoc-mode t)))

;; Setup M-. to jump to the definition of the symbol under the cursor.
(define-key emacs-lisp-mode-map (kbd "M-.") 'find-function-at-point)

(provide 'init-elisp)
