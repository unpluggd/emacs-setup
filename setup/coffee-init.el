(packages-install
    (cons 'coffee-mode marmalade)
    )

(autoload 'coffee-mode "coffee-mode" "Major mode for editing coffee-script" t)
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.cs\\'" . coffee-mode))
