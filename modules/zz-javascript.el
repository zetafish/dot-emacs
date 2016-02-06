;;; -*- lexical-binding: t -*-
;;; zz-javascript.el -- Javascript development

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

(setq node-path  "/Users/endymion/.nvm/versions/node/v5.1.0/bin")
(setenv "PATH" (concat (getenv "PATH") ":" node-path))
(add-to-list 'exec-path node-path)


(paradox-require 'js2-mode)
(paradox-require 'js2-refactor)
(paradox-require 'flymake-jshint)
(paradox-require 'ac-js2)
(paradox-require 'tern)
;;(paradox-require 'jscs)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-hook 'js-mode-hook #'jscs-indent-apply)
(add-hook 'js2-mode-hook #'jscs-indent-apply)
(add-hook 'json-mode-hook #'jscs-indent-apply)

(add-hook 'js-mode-hook (lambda () (tern-mode t)))

(setq js2-highlight-level 3)
(setq js-indent-level 4)

(flycheck-define-checker javascript-jscs
  "A JavaScript style checker using jscs.

See URL `https://www.npmjs.com/package/jscs'."
  :command ("jscs" "--reporter=checkstyle"
            (config-file "--config" flycheck-jscsrc)
            source)
  :error-parser flycheck-parse-checkstyle
  :modes (js-mode js2-mode js3-mode))

(flycheck-def-config-file-var flycheck-jscsrc javascript-jscs ".jscsrc"
  :safe #'stringp)

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is 2 spaces, we want 4 spaces-string
            (set (make-local-variable 'sgml-basic-offset) 4)))

(provide 'zz-javascript)
;;; zz-javascript ends here
