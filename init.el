(package-initialize)

(setq inhibit-startup-message t)

(setq dotfiles-dir "~/.emacs.d/")

(setq package-user-dir (concat dotfiles-dir "elpa"))

(add-to-list 'default-frame-alist '(width . 85))


;; Tell emacs where to our modules.
(add-to-list 'load-path (concat dotfiles-dir "modules"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; Load the user settings from `custom.el'
(load custom-file 'noerror)

;; Load the modules
(require 'zz-package)
(require 'zz-appearance)
(require 'zz-editing)
(require 'zz-dired)
(require 'zz-codestyle)
(require 'zz-ido)
(require 'zz-helm)
(require 'zz-project)
(require 'zz-navigation)
(require 'zz-git)

(require 'zz-elisp)
(require 'zz-clojure)
(require 'zz-python)

;; Load the user's config file
(load (concat dotfiles-dir "user.el") 'noerror)

