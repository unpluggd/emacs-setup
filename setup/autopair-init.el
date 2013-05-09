(packages-install
    (cons 'autopair marmalade)
    )

(require 'autopair)
(autopair-global-mode) ; enable in all buffers

;; parens
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)
;(setq autopair-autowrap t)

;; Fix issues with terminals
(add-hook 'term-mode-hook
          #'(lambda () 
              (setq autopair-dont-activate t) ;; for emacsen < 24
              (autopair-mode -1))             ;; for emacsen >= 24
          )
