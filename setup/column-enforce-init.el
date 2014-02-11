;(packages-install
;    (cons 'column-enforce-mode marmalade)
;    )

(require 'column-enforce-mode)
(add-hook 'python-mode-hook 'column-enforce-mode)
