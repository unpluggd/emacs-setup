;; -- Custom keyboard alterations --
(global-set-key [kp-home] 'beginning-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [kp-end] 'end-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [delete] 'delete-char)
(global-set-key [C-tab] 'other-window)

(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-R" 'replace-string)
(global-set-key "\C-x\C-b" 'buffer-menu)

(global-set-key [C-right] 'custom-forward-word) 
(global-set-key [C-left] 'custom-backward-word) 
(global-set-key [next] 'custom-page-down)
(global-set-key [prior] 'custom-page-up)

;; -- fix cmd-h on osx -- 
(global-set-key [(alt h)] 'ns-do-hide-emacs) 

;; -- Smart Tab completion/indenting --
(global-set-key [(tab)] 'smart-tab)

; not working
(global-set-key [(alt p)]
    '(lambda () (interactive) (message "noop")))

; list search results in a new buffer
(define-key isearch-mode-map (kbd "C-0")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
	       (regexp-quote isearch-string))))))

