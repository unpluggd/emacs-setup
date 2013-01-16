(packages-install
    (cons 'rainbow-mode gnu))

(require 'rainbow-mode)
(add-hook 'clevercss-mode-hook 'rainbow-mode)
(add-hook 'less-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)
