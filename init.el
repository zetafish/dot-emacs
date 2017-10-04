1(package-initialize)

(setq inhibit-splash-screen t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;(set-frame-font "Fira Mono-13" nil t)
(set-frame-font "Monaco" nil t)

(setq dotfiles-dir user-emacs-directory)

(setq custom-file (expand-file-name "custom.el" dotfiles-dir))
(load custom-file 'noerror)

(add-to-list 'load-path (expand-file-name "modules" dotfiles-dir))

(require 'zf-packages)
(require 'zf-appearance)
(require 'zf-completion)
(require 'zf-git)
(require 'zf-helm)
(require 'zf-editing)
(require 'zf-codestyle)
(require 'zf-elisp)
(require 'zf-python)
(require 'zf-clojure)
