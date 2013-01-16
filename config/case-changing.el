(defun cycle-word-capitalization ()
  "Change the capitalization of the current word.
   If the word under point is in lower case, capitalize it.  If it
   is in capitalized form, change it to upper case.  If it is in
   upper case, downcase it."
  (interactive "*")
  (let ((case-fold-search nil))
    (save-excursion
      (skip-syntax-backward "w")
      (cond
       ((looking-at-p "[[:lower:]]+")
        (capitalize-word 1))
       ((looking-at-p "[[:upper:]][[:lower:]]+")
        (upcase-word 1))
       ((looking-at-p "[[:upper:]]+")
        (downcase-word 1))
       (t
        (downcase-word 1))))))


;; upper/lowercase words
(global-set-key "\M-u" '(lambda () (interactive) (backward-word 1) (upcase-word 1)))
(global-set-key "\M-l" '(lambda () (interactive) (backward-word 1) (downcase-word 1)))
(global-set-key "\M-c" '(lambda () (interactive) (backward-word 1) (capitalize-word 1)))
;(global-set-key "\M-r" '(lambda () (interactive) (backward-word 1) (cycle-word-capitalization 1)))

