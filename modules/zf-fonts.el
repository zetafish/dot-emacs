(defun zf-fonts/update-size (increment)
  (set-frame-font
   (-update-at 7 (lambda (i)
                   (number-to-string
                    (+ (string-to-number i) increment)))

               )))

(frame-parameter nil 'font)
