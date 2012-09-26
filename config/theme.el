(packages-install
    (cons 'color-theme marmalade)
    (cons 'color-theme-solarized marmalade)
    (cons 'color-theme-molokai marmalade)
    (cons 'color-theme-sanityinc-solarized marmalade)
    )

(require 'color-theme)
(setq color-theme-is-global t)

;(load-theme 'solarized-dark t)
(load-theme 'sanityinc-solarized-dark t)
