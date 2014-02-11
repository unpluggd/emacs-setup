(packages-install
  (cons 'auto-complete marmalade)
  )

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name "autocomplete" dotfiles-dir))
(ac-config-default)
(setq ac-use-menu-map t)
(define-key ac-completing-map "\e" 'ac-stop) ; use esc key to exit completion
(define-key ac-completing-map "\t" 'ac-complete) ; use tab to complete
(define-key ac-completing-map "\r" nil) ; ignore RET for completing
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\C-m" nil)
(global-set-key "\C-f" 'ac-isearch)

;; only use RET for completion when the menu is showing
;(define-key ac-completing-map "\C-m" nil)
;(setq ac-use-menu-map t)
;(define-key ac-menu-map "\C-m" 'ac-complete)

(define-key ac-complete-mode-map "\t" 'ac-complete)
(define-key ac-complete-mode-map "\r" nil)
(define-key ac-complete-mode-map [return] nil)
(define-key ac-complete-mode-map "\C-m" nil)
