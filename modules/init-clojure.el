;;; -*- lexical-binding: t -*-
;;; init-clojure.el -- Clojure development

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

(paradox-require 'paredit)

(paradox-require 'eldoc)

(paradox-require 'cider)

(paradox-require 'flycheck-clojure)

(paradox-require 'flycheck-pos-tip)

(add-hook 'clojure-mode-hook
          (lambda ()
            (paredit-mode)
            (eldoc-mode)
            (clj-refactor-mode 1)))



(with-eval-after-load "clojure-mode"
  ;;; Rebind C-x C-e to eval through nREPL in clojure-mode buffers.
  ;;(define-key clojure-mode-map (kbd "C-x C-e"))
  (cljr-add-keybindings-with-prefix "C-c C-m")
  (flycheck-clojure-setup))

(eval-after-load 'clojure-mode
  '(define-clojure-indent
     ;; Core
     (send-off 1) (cli 1) (go-loop 1)

     ;;Compojure
     (ANY 2) (GET 2) (POST 2) (PUT 2) (PATCH 2) (DELETE 2)
     (OPTIONS 2)

     ;; Korma
     ;; (select 1) (insert 1) (update 1) (where 1) (set-fields 1)
     ;; (values 1) (delete 1) (upsert 1) (subselect 1)
     ))


;;(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages)

;;(eval-after-load 'flycheck '(flycheck-clojure-setup))
;;(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-clojure)
;;; init-clojure.el ends here
