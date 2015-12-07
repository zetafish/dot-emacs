;;; -*- lexical-binding: t -*-
;;; zz-clojure.el -- Clojure development

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

;;; Code:

(paradox-require 'clojure-mode)

(paradox-require 'clj-refactor)
;;(require 'clj-refactor)

(paradox-require 'paredit)

(paradox-require 'cider)

(paradox-require 'flycheck-clojure)
(paradox-require 'flycheck-pos-tip)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (clj-refactor-mode 1)))


(with-eval-after-load "clojure-mode"
  ;;; Rebind C-x C-e to eval through nREPL in clojure-mode buffers.
  ;;(define-key clojure-mode-map (kbd "C-x C-e"))
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (flycheck-clojure-setup))



;;(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)

;;(eval-after-load 'flycheck '(flycheck-clojure-setup))
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'zz-clojure)
;;; zz-clojure.el ends here
