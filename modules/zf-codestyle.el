;;; zf-codestyle --- Code style

;;; Commentary:

;;; Code:

;; Turn of tabs
(set-default 'indent-tabs-mode nil)

;; Always indent after newline
(define-key global-map (kbd "RET")  'newline-and-indent)

;; Cleanup whitespace
(use-package ethan-wspace
  :demand t
  :commands ethan-wspace-mode
  :init
  (setq mode-require-final-newline nil)
  (setq require-final-newline nil)
  :config
  (global-ethan-wspace-mode t)
  :bind ("C-c c" . ethan-wspace-clean-all)
  :diminish ethan-wspace-mode)

;; Default indents for various languages
(setq-default tab-width 2)

;; Javascript
(setq-default js2-indent-level 2)

;; JSON
(setq-default js-indent-level 2)
(setq-default rjsx-indent-level 2)
;; Python
;;(setq-default py-indent-offset 4)

(provide 'zf-codestyle)
;;; zf-codestyle ends here
