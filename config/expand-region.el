(packages-install
  (cons 'expand-region marmalade)
  )

(require 'expand-region)
(global-set-key (kbd "H-e") 'er/expand-region)