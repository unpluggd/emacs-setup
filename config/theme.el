(packages-install
    (cons 'color-theme marmalade)
    (cons 'color-theme-sanityinc-solarized marmalade)
    )
    
;; theme directory
(setq theme-dir (expand-file-name "themes" dotfiles-dir))

(add-to-list 'load-path theme-dir)

;; load themes
(mapcar '(lambda (x)
           (load-file x))
        (directory-files theme-dir t "\\.el$"))

;(require 'color-theme)
;(setq color-theme-is-global t)

;(load-theme 'sanityinc-solarized-dark t)
;(load-theme 'wombat t)
;(load-theme 'subdued t)
;(load-theme 'gruber-darker t)

(eval-after-load "color-theme"
  (progn
    (setq color-theme-is-global t)
    (when (window-system) ; needed for the first frame
      (color-theme-custom-dark)
      )))

(add-hook 'after-make-frame-functions
          '(lambda (f)
             (with-selected-frame f
               (if (window-system f)
                   (color-theme-dark-emacs)
                 ))))


(custom-set-variables
 )
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(hl-line ((t (:background "#222")))))

(set-face-attribute 'default nil :font "Monaco-10:weight=normal")
