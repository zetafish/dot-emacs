(use-package helm
  :config
  (require 'helm-config)
  (require 'helm)
  (helm-mode 1)
  (with-eval-after-load "zf-project"
    (use-package helm-projectile
      :bind (("C-c C-f" . helm-projectile-find-file-dwim)
	     ("C-x C-g" . helm-projectile-grep))
      :config (helm-projectile-on)))
  (setq-default helm-display-header-line nil
		helm-autoresize-min-height 10
		helm-autoresize-max-height 35
		helm-split-window-in-side-p t
		helm-M-x-fuzzy-match t
		helm-buffer-fuzzy-matching t
		helm-recentf-fuzzy-match t
		helm-apropos-fuzzy-match t)
  (set-face-attribute 'helm-source-header nil :height 0.75)

  :bind (("M-x" . helm-M-x)
	 ("C-c C-f" . helm-find-files)
	 ("C-x C-g" . helm-do-grep)
	 ("C-x b" . helm-buffers-list)
	 ("C-x c g" . helm-google-suggest)
	 ("C-t" . helm-imenu)
	 ("M-y" . helm-show-kill-ring)))

(use-package swiper-helm
  :bind (("C-S-s" . swiper-helm)))

;; Fuzy matching in helm navigation
(use-package helm-flx
  :config
  (with-eval-after-load "helm"
    (require 'helm-flx)
    (helm-flx-mode 1)))

;; Some tweaks to helm
(use-package helm-ext
  :config
  (helm-ext-ff-enable-skipping-dots t)
  (helm-ext-ff-enable-auto-path-expansion t))

(provide 'zf-helm)
