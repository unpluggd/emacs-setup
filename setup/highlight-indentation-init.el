(packages-install
   (cons 'highlight-indentation marmalade))

(require 'highlight-indentation)

(set-face-background 'highlight-indentation-face "#222")
;(set-face-background 'highlight-indentation-current-column-face "#444")

(add-hook 'python-mode-hook 'highlight-indentation-mode)
(add-hook 'clevercss-mode-hook 'highlight-indentation-mode)

;(define-globalized-minor-mode global-highlight-indentation-mode highlight-indentation (lambda () (highlight-indentation 1)))
;(global-highlight-indentation-mode 1)
