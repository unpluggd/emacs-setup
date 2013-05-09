(packages-install
  (cons 'auto-complete marmalade)
  )

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name "autocomplete" dotfiles-dir))
(ac-config-default)
(define-key ac-completing-map "\e" 'ac-stop) ; use esc key to exit completion
(global-set-key "\C-f" 'ac-isearch)

;; only use RET for completion when the menu is showing
(define-key ac-completing-map "\C-m" nil)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-m" 'ac-complete)
