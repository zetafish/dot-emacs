;;; -*- lexical-binding: t -*-
;;; zz-ido.el -- Ido

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

;; Enable ido mode.
(ido-mode t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-url-at-point t
      ido-max-prospects 10
      ido-use-virtual-buffers t)

;; Make sure ido is really everywhere
(paradox-require 'ido-ubiquitous)
(ido-ubiquitous-mode)

;; Use smex to provide ido-like inteface for M-x
(paradox-require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Vertical ido.
(paradox-require 'ido-vertical-mode)
(ido-vertical-mode)

;; Fuzzy matching
(paradox-require 'flx-ido)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t
      ido-use-faces nil
      gc-cons-threshold 20000000)

(provide 'zz-ido)
