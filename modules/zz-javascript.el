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

(add-to-list 'exec-path "/Users/endymion/.nvm/versions/node/v5.1.0/bin")


(paradox-require 'js2-mode)
(paradox-require 'js2-refactor)
(paradox-require 'flymake-jshint)
(paradox-require 'ac-js2)
;;(paradox-require 'jscs)

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

(add-hook 'js-mode-hook #'jscs-indent-apply)
(add-hook 'js2-mode-hook #'jscs-indent-apply)
(add-hook 'json-mode-hook #'jscs-indent-apply)


(setq js2-highlight-level 3)
(setq js-indent-level 4)


(provide 'zz-javascript)
;;; zz-javascript ends here
