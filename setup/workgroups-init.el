(packages-install
   (cons 'workgroups melpa))

(require 'workgroups)

;; Disable the mode-line functions as 
;; (wg-mode-line-on nil) doesn't work
;; and they conflict with powerline
(defun wg-mode-line-add-display () nil)
(defun wg-mode-line-remove-display () nil)

(setq wg-prefix-key (kbd "C-z")
      wg-mode-line-on nil
      wg-file (concat dotfiles-dir "/workgroups")
      wg-use-faces nil
      wg-morph-on nil)
(workgroups-mode 1)
