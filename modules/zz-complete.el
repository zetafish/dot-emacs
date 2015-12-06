;; Company mode
(paradox-require 'company)
(global-company-mode)

;; Disable when in term-mode
(setq company-global-modes '(not term-mode))

;; Give Company a decent default configuration
(setq company-minimum-prefix-length 2
      company-selection-wrap-around t
      company-show-numbers t
      company-tooltip-align-annotations t
      company-require-match nil
      company-dabbrev-downcase nil
      company-dabbrev-ignore-case nil)

;; Sort completion candidates that already occur in the current
;; buffer at the top of the candidate list.
(setq company-transformers '(company-sort-by-occurrence))

;; Show documentation where available for selected completion
;; after a short delay.
(paradox-require 'company-quickhelp)
(setq company-quickhelp-delay 1)
(company-quickhelp-mode 1)

;; Add a completion source fo emoji. 🐱
(paradox-require 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)
(paradox-require 'company-emoji)
(company-emoji-init)

;; Use C-\ to activate the Company autocompleter.
(paradox-require 'company-try-hard)
(global-set-key (kbd "C-\\") #'company-try-hard)
(define-key company-active-map (kbd "C-\\") #'company-try-hard)


(provide 'zz-complete)
