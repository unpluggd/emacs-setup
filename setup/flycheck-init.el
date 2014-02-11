(packages-install
    (cons 'exec-path-from-shell marmalade)
    (cons 'flycheck melpa)
    (cons 'flycheck-color-mode-line melpa)
    )

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'flycheck-color-mode-line)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;(require 'flycheck-xslt)

;;; flycheck-init.el ends here
