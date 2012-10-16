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
