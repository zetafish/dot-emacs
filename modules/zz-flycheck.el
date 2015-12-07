;;; -*- lexical-binding: t -*-
;;; zz-flycheck.el -- Flycheck

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

(paradox-require 'flycheck)

;; Start it automatically except Elisp.
(add-hook 'find-file-hook
          (lambda ()
            (when (not (equal 'emacs-lisp-mode major-mode))
              (flycheck-mode))))

;; Jump between current errors with M-n and M-p
(global-set-key (kbd "M-n") 'next-error)
(global-set-key (kbd "M-p") 'previous-error)

;; Turn the modeline red when Flycheck has errors.
(paradox-require 'flycheck-color-mode-line)

;; Configure the theme
(with-eval-after-load "flycheck"
  (setq flycheck-highlighting-mode 'symbols)
  (setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))



(provide 'zz-flycheck)
