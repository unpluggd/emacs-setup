;; remove the useless menubar early to avoid the window bouncing around the screen
(menu-bar-mode -1)

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Packages stores modes/features not in package repositories
(setq packages-dir (expand-file-name "packages" dotfiles-dir))
;; Config stores custom configuration/preferences
(setq config-dir (expand-file-name "config" dotfiles-dir))
;; Setup stores install/setup files for various modes
(setq setup-dir (expand-file-name "setup" dotfiles-dir))
;; theme directory
(setq theme-dir (expand-file-name "themes" dotfiles-dir))

;; Set up load path
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path packages-dir)
(add-to-list 'load-path config-dir)
(add-to-list 'load-path setup-dir)
(add-to-list 'load-path theme-dir)

(require 'setup-package)

;; load packages
(mapcar '(lambda (x)
           (load-file x))
        (directory-files packages-dir t "\\.el$"))

;; load customisations
(mapcar '(lambda (x)
           (load-file x))
        (directory-files config-dir t "\\.el$"))

;; load modes
(mapcar '(lambda (x)
           (load-file x))
        (directory-files setup-dir t "\\.el$"))

;; load themes
(mapcar '(lambda (x)
           (load-file x))
        (directory-files theme-dir t "\\.el$"))

(custom-set-variables
 )
(custom-set-faces
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(hl-line ((t (:background "#222")))))
