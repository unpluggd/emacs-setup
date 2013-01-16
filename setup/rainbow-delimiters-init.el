(packages-install
   (cons 'rainbow-delimiters marmalade))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
