(packages-install
    (cons 'zencoding-mode marmalade)
    )

(autoload 'zencoding-mode "zencoding-mode" "Major mode for quickly creating html fragments" t)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes