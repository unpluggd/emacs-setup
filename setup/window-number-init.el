(packages-install
    (cons 'window-number marmalade)
    )

(require 'window-number)
;(window-number-meta-mode)
;(setq window-number-meta-mode-map (make-sparse-keymap))
;(window-number-define-keys window-number-meta-mode-map "H-")

(window-number-mode)
(window-number-define-keys window-number-mode-map "H-")
