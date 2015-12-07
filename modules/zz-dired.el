;; dired+ is an enhanced version of the built-in Emacs directory editor.
(paradox-require 'dired+)
(setq diredp-hide-details-initially-flag nil)
(require 'dired+)
(set-face-foreground 'diredp-file-name nil)

;; Keep dired buffers updated when the file system changes.
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; TODO (defun delete-current-buffer-file () ...)
;; TODO (defun rename-current-buffer-file () ...)

(provide 'zz-dired)
