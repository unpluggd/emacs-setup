(packages-install
   (cons 'goto-last-change marmalade))

(require 'goto-last-change)
(global-set-key "\C-x \M-l" 'goto-last-change)
