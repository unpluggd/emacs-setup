(packages-install
  (cons 'redo+ marmalade))

(setq mac-command-modifier 'alt mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper shift z)] 'redo)

(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper o)] 'find-file)
(global-set-key [(hyper f)] 'isearch-forward)
(global-set-key [(hyper g)] 'isearch-repeat-forward)
(global-set-key [(hyper w)]
                (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [(hyper .)] 'keyboard-quit)
(global-set-key [(hyper q)] 'save-buffers-kill-emacs)
(global-set-key [(hyper left)] 'beginning-of-line)
(global-set-key [(hyper right)] 'end-of-line)
(global-set-key [(hyper h)] 'ns-do-hide-emacs)
(global-set-key [(hyper j)] 'join-line)

(global-set-key [(hyper shift r)] 'repeat)

(define-key local-function-key-map [cancel] [H-Esc])

;; save as.. dialog (shift + command + S)
(defun mac-save-as (filename &optional wildcards)
  "Write current buffer to another file using standard file open dialog."
  (interactive
   (let (last-nonmenu-event)
     (find-file-read-args "Write file: " nil)))
   (write-file filename))

(global-set-key [(hyper shift s)] 'mac-save-as)

(defvar mac-allow-anti-alaising)

(setq mac-allow-anti-alaising nil)
;(setq default-input-method "MacOSX")
(setq mouse-wheel-scroll-amount '(0.01))

(set-frame-parameter nil 'alpha 0.9) 

;(fset 'insertPound "#")
;(global-set-key [(hyper 3)] 'insertPound)

;; Allow hash to be entered  
(global-set-key (kbd "H-3") '(lambda () (interactive) (insert "#")))

(global-set-key [(hyper shift v)] '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))
