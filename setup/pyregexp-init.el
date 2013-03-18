(packages-install
   (cons 'pyregexp melpa))

(require 'pyregexp)
(define-key global-map (kbd "C-c r") 'pyregexp-replace)
(define-key global-map (kbd "C-c q") 'pyregexp-query-replace)
;; to use pyregexp isearch instead of the built-in regexp isearch, also include the following lines:
(define-key esc-map (kbd "C-r") 'pyregexp-isearch-backward)
(define-key esc-map (kbd "C-s") 'pyregexp-isearch-forward)
