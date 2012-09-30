(packages-install
    (cons 'flymake marmalade)
    (cons 'flymake-cursor marmalade)
    )

(require 'flymake)
(eval-after-load 'flymake '(require 'flymake-cursor))

(defun auto-flymake-goto-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )
 
(defun auto-flymake-goto-prev-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )

;(set-face-background 'flymake-errline "#ffa2a2")
;(set-face-foreground 'flymake-errline "#ff0000")

;(set-face-background 'flymake-errline "#000000")
;(set-face-foreground 'flymake-errline "#000000")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

(defun my-flymake-show-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )


(setq flymake-dir (expand-file-name "flymake" setup-dir))
(mapcar '(lambda (x)
           (load-file x))
        (directory-files flymake-dir t "\\.el$"))
