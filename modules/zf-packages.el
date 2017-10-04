(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(unless (package-installed-p 'paradox)
  (package-refresh-contents)
  (package-install 'paradox))

(paradox-require 'use-package)

;; Enable use-package-always-enusre makes use-package install every
;; declared package automatically instead of doing it manually.
(setq use-package-always-ensure t)

(provide 'zf-packages)
