;;; zf-ido --- Ido

;;; Commentary:

;;; Code:

;; Enable ido mode
(ido-mode t)
(ido-everywhere t)

(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-create-new-buffer 'always
      ido-use-faces 'guess
      ido-use-url-at-point t
      ido-max-prospects 10
      ido-use-virtual-buffers t)

;; Use ido everywhere
(use-package ido-completing-read+
  :config
  (ido-ubiquitous-mode 1))

(use-package smex
  :config
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; Old M-x
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))

;; Vertical ido mode
(use-package ido-vertical-mode
  :config
  (ido-vertical-mode))

;; Fuzzy ido
(use-package flx-ido
  :config
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t
        ido-use-faces nil))

(provide 'zf-ido)
;;; zf-ido ends here
