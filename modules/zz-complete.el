;;; -*- lexical-binding: t -*-
;;; zz-complete.el -- Completions

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

;; Company mode
(paradox-require 'company)
(global-company-mode)

;; Disable when in term-mode
(setq company-global-modes '(not term-mode))

;; Give Company a decent default configuration
(setq company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-show-numbers t
      company-tooltip-align-annotations t
      company-require-match nil
      company-dabbrev-downcase nil
      company-dabbrev-ignore-case nil)

;; Sort completion candidates that already occur in the current
;; buffer at the top of the candidate list.
(setq company-transformers '(company-sort-by-occurrence))

;; Show documentation where available for selected completion
;; after a short delay.
(paradox-require 'company-quickhelp)
(setq company-quickhelp-delay 1)
(company-quickhelp-mode 1)

;; Add a completion source fo emoji. 🐱
(paradox-require 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)
(paradox-require 'company-emoji)
(company-emoji-init)

;; Use C-\ to activate the Company autocompleter.
(paradox-require 'company-try-hard)
(global-set-key (kbd "C-\\") #'company-try-hard)
(define-key company-active-map (kbd "C-\\") #'company-try-hard)


(provide 'zz-complete)
