(require 'redo+)

(setq mac-command-modifier 'alt mac-option-modifier 'meta)
(setq mac-command-modifier 'hyper)
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper shift z)] 'redo)

(global-set-key [(hyper m)] 'iconify-frame)
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper x)] 'kill-region)
(global-set-key [(hyper s)] 'save-buffer)
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
(global-set-key [(hyper t)] 'beginning-of-buffer)
(global-set-key [(hyper b)] 'end-of-buffer)

(global-set-key [(hyper u)] 'upcase-region)
(global-set-key [(hyper l)] 'downcase-region)

(global-set-key [(hyper j)] 'goto-line)
(global-set-key (kbd "H-S-<backspace>") 'join-line)

(global-set-key [(hyper shift r)] 'repeat)

(define-key local-function-key-map [cancel] [H-Esc])
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

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
;(setq mouse-wheel-scroll-amount '(0.01))

;(set-frame-parameter nil 'alpha 0.9)

;; Allow hash to be entered
(global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
;; Allow euro to be entered
(global-set-key (kbd "M-2") '(lambda () (interactive) (insert "€")))

(global-set-key [(hyper shift v)] '(lambda ()
   (interactive)
   (popup-menu 'yank-menu)))

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
