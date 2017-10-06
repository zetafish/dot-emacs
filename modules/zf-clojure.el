;;; zf-clojure --- Clojure development

;;; Commentary:

;;; Code:

(use-package clj-refactor
  :commands clj-refactor-mode
  :config
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(use-package cider
  :commands cider-mode)

(use-package flycheck-clojure
  :config
  (eval-after-load 'flycheck '(flycheck-clojure-setup))
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package flycheck-pos-tip
  :commands flycheck-pos-tip-mode
  :config
  (eval-after-load 'flycheck
    '(setq flycheck-display-errors-function
	   #'flycheck-pos-tip-error-message)))

(use-package clojure-mode
  :commands clojure-mode
  :config
  (add-hook
   'clojure-mode-hook
   (lambda ()
     (paredit-mode)
     (eldoc-mode)
     (clj-refactor-mode 1))))

(provide 'zf-clojure)
;;; zf-clojure ends here
