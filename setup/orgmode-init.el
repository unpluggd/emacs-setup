(packages-install
    (cons 'org-bullets melpa))

(require 'org-bullets)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-startup-indented t)

;; Add bullets
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
