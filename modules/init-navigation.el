;;; -*- lexical-binding: t -*-
;;; init-navigation.el -- Navigating

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

;; Make PgUp/Dn move the point.
(setq scroll-error-top-bottom t)

;; Avy is a quick way to jump around your buffers.
(paradox-require 'avy)
(global-set-key (kbd "C-;") 'avy-goto-word-1)
(global-set-key (kbd "C-:") 'avy-goto-char)
(with-eval-after-load "isearch"
  (define-key isearch-mode-map (kbd "C-;") 'avy-isearch))

;; Enhance C-x o when more than two windows are open.
(paradox-require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)
(global-set-key (kbd "C-x C-o") 'ace-swap-window)

;; Use Cx M-p to kill the buffer in the other window, revealing
;; the next buffer in the stack.
(global-set-key (kbd "C-x M-p")
                (lambda () (interactive)
                  (save-excursion
                    (other-window 1)
                    (quit-window))))

;; Display incremental search stats in the modeline.
(paradox-require 'anzu)
(global-anzu-mode 1)

(global-set-key (kbd "C-%") 'anzu-query-replace-at-cursor)
(global-set-key (kbd "M-%") 'anzu-query-replace)
(global-set-key (kbd "C-M-%") 'anzu-query-replace-regexp)


(provide 'init-navigation)
