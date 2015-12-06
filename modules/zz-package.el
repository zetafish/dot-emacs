;; Emacs comes with a package manager for installing more features.
;; The default pacakge repository doesn't contain much, so we tell it
;; to use MELPA as well.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("elpy" . "http://jorgenschaefer.github.io/packages/") t)

;; To get the package manager going, invoke its initialise function.
(package-initialize)

(unless package-archive-contents (package-refresh-contents))

;; `Paradox' is an enhanced interface for package management.
(when (not (package-installed-p 'paradox))
  (package-install 'paradox))


(provide 'zz-package)
