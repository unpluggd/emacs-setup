;; remove the useless menubar early to avoid the window bouncing around the screen
(menu-bar-mode -1)

;; add plist-to-alist function to fix older modes
(defun plist-to-alist (the-plist)
  (defun get-tuple-from-plist (the-plist)
    (when the-plist
      (cons (car the-plist) (cadr the-plist))))

  (let ((alist '()))
    (while the-plist
      (add-to-list 'alist (get-tuple-from-plist the-plist))
      (setq the-plist (cddr the-plist)))
  alist))

;; load cl as it's required by many packages on startup
(require 'cl)

;; Set path to .emacs.d
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)

;; Packages stores modes/features not in package repositories
(setq packages-dir (expand-file-name "packages" dotfiles-dir))
;; Config stores custom configuration/preferences
(setq config-dir (expand-file-name "config" dotfiles-dir))
;; Setup stores install/setup files for various modes
(setq setup-dir (expand-file-name "setup" dotfiles-dir))

(setq dir-list (list packages-dir config-dir setup-dir))

;; Set up load path
(dolist (dir dir-list)
	(add-to-list 'load-path dir))

(require 'setup-package)

;; Recursively load env
(dolist (base dir-list)
  	(dolist (f (directory-files base))
    	(let ((name (concat base "/" f)))
      		(when (and (file-directory-p name) 
            		(not (equal f ".."))
                 	(not (equal f ".")))
       			(add-to-list 'load-path name))
    		(when (and (file-regular-p name)
    				(string-match "\\.el$" name))
    			(load-file name)))))

