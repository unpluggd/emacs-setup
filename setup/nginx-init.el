(packages-install
    (cons 'nginx-mode marmalade)
    )

(autoload 'nginx-mode "nginx-mode" "Major mode for nginx code." t)
(add-to-list 'auto-mode-alist '("\\.nginx\\'" . nginx-mode))
