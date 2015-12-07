;;; -*- lexical-binding: t -*-
;;; zz-git.el -- Git porcelain

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

(paradox-require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(paradox-require 'gist)

;; Mark uncommitted changes in the fringe.
(paradox-require 'git-gutter-fringe)
(require 'git-gutter-fringe)
(global-git-gutter-mode t)

(set-face-foreground 'git-gutter-fr:modified "red")
(set-face-foreground 'git-gutter-fr:added "magenta")
(set-face-foreground 'git-gutter-fr:deleted "white")
(setq git-gutter-fr:side 'left-fringe)

(provide 'zz-git)
