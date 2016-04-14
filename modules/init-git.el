;;; -*- lexical-binding: t -*-
;;; init-git.el -- Git porcelain

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
(if window-system
    (progn
     (paradox-require 'git-gutter-fringe)
     (require 'git-gutter-fringe)
     (set-face-foreground 'git-gutter-fr:modified "red")
     (set-face-foreground 'git-gutter-fr:added "magenta")
     (set-face-foreground 'git-gutter-fr:deleted "white")
     (setq git-gutter-fr:side 'left-fringe))
  (progn
    (paradox-require 'git-gutter)
    (git-gutter:linum-setup)
    ;; (global-set-key (kbd "C-x C-g") 'git-gutter:toggle)
    ;; (global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

    ;; ;; Jump to next/previous hunk
    ;; (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
    ;; (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

    ;; ;; Stage current hunk
    ;; (global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

    ;; ;; Revert current hunk
    ;; (global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

    ;; ;; Mark current hunk
    ;; (global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)(linum-mode nil)

    ))

(global-git-gutter-mode t)

(provide 'init-git)
