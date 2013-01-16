;; -- Custom keyboard alterations --
(global-set-key [kp-home] 'beginning-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [kp-end] 'end-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [delete] 'delete-char)
(global-set-key [C-tab] 'other-window)

(global-set-key "\C-R" 'replace-string)
(global-set-key "\C-x\C-b" 'buffer-menu)

;; Font size
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; duplicate the current line or region
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

;; upper/lowercase words
(global-set-key "\M-u" '(lambda () (interactive) (backward-word 1) (upcase-word 1)))
(global-set-key "\M-l" '(lambda () (interactive) (backward-word 1) (downcase-word 1)))
(global-set-key "\M-c" '(lambda () (interactive) (backward-word 1) (capitalize-word 1)))

;; list search results in a new buffer
(define-key isearch-mode-map (kbd "C-0")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
	       (regexp-quote isearch-string))))))


;; unbind keys
(global-unset-key "\C-x\C-n") ; set-goal-column
