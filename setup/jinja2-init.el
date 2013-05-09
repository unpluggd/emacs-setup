(packages-install
   (cons 'jinja2-mode melpa))

(autoload 'jinga2-mode "jinja2-mode" "Major mode for editing jinga2 template files" t)
(add-to-list 'auto-mode-alist '("\\.jinja2\\'" . jinja2-mode))
