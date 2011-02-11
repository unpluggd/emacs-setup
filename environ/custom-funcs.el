(defun reload-config ()
  "Save the .emacs buffer if needed, then reload .emacs."
  (interactive)
  (let ((dot-emacs "~/.emacs.d/init.el"))
    (and (get-file-buffer dot-emacs)
         (save-buffer (get-file-buffer dot-emacs)))
    (load-file dot-emacs))
  (message "Re-initialized!"))


(defun custom-forward-word () 
   ;; Move one word forward. Leave the pointer at start of word 
   ;; instead of emacs default end of word. Treat _ as part of word 
   (interactive) 
   (forward-char 1) 
   (backward-word 1) 
   (forward-word 2) 
   (backward-word 1) 
   (backward-char 1) 
   (cond ((looking-at "_") (forward-char 1) (custom-forward-word)) 
         (t (forward-char 1)))) 

(defun custom-backward-word () 
   ;; Move one word backward. Leave the pointer at start of word 
   ;; Treat _ as part of word 
   (interactive) 
   (backward-word 1) 
   (backward-char 1) 
   (cond ((looking-at "_") (custom-backward-word)) 
         (t (forward-char 1)))) 

(defun custom-page-down ()
  (interactive)
  (condition-case nil (scroll-up)
    (end-of-buffer (goto-char (point-max)))))

(defun custom-page-up ()
  (interactive)
  (condition-case nil (scroll-down)
    (beginning-of-buffer (goto-char (point-min)))))

(defun custom-ignore-buffer (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^ " str)

   ;;Test to see if the window is visible on an existing visible frame.
   ;;Because I can always ALT-TAB to that visible frame, I never want to 
   ;;Ctrl-TAB to that buffer in the current frame.  That would cause 
   ;;a duplicate top-level buffer inside two frames.
   (memq str                
         (mapcar 
          (lambda (x) 
            (buffer-name 
             (window-buffer 
              (frame-selected-window x))))
          (visible-frame-list)))
   ))


(defun custom-switch-buffer (ls)
  "Switch to next buffer in ls skipping unwanted ones."
  (let* ((ptr ls)
         bf bn go
         )
    (while (and ptr (null go))
      (setq bf (car ptr)  bn (buffer-name bf))
      (if (null (custom-ignore-buffer bn))        ;skip over
   (setq go bf)
        (setq ptr (cdr ptr))
        )
      )
    (if go
        (switch-to-buffer go))))

(defun custom-prev-buffer ()
  "Switch to previous buffer in current window."
  (interactive)
  (custom-switch-buffer (reverse (buffer-list))))

(defun custom-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (custom-switch-buffer (buffer-list)))


;; flymake
(defun my-flymake-show-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )
