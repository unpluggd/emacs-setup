;; Custom functions/hooks for persisting/loading frame geometry upon save/load
(defun save-frameg ()
  "Gets the current frame's geometry and saves to ~/.emacs.frameg."
  (let ((frameg-font (frame-parameter (selected-frame) 'font))
        (frameg-left (frame-parameter (selected-frame) 'left))
        (frameg-top (frame-parameter (selected-frame) 'top))
        (frameg-width (frame-parameter (selected-frame) 'width))
        (frameg-height (frame-parameter (selected-frame) 'height))
        (frameg-file (expand-file-name "~/.emacs.d/.frameg")))
    (with-temp-buffer
      ;; Turn off backup for this file
      (make-local-variable 'make-backup-files)
      (setq make-backup-files nil)
      (insert
       ";;; This file stores the previous emacs frame's geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       "      '((font . \"" frameg-font "\")\n"
       (format "        (top . %d)\n" (max frameg-top 0))
       (format "        (left . %d)\n" (max frameg-left 0))
       (format "        (width . %d)\n" (max frameg-width 0))
       (format "        (height . %d)))\n" (max frameg-height 0)))
      (when (file-writable-p frameg-file)
        (write-file frameg-file)))))

 
(defun load-frameg ()
  "Loads ~/.emacs.frameg which should load the previous frame's geometry."
  (let ((frameg-file (expand-file-name "~/.emacs.d/.frameg")))
    (when (file-readable-p frameg-file)
      (load-file frameg-file))))

 
;; Special work to do ONLY when there is a window system being used
(if window-system
    (progn
      (add-hook 'after-init-hook 'load-frameg)
      (add-hook 'kill-emacs-hook 'save-frameg)))


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

(global-set-key [C-right] 'custom-forward-word)


(defun custom-backward-word () 
   ;; Move one word backward. Leave the pointer at start of word 
   ;; Treat _ as part of word 
   (interactive) 
   (backward-word 1) 
   (backward-char 1) 
   (cond ((looking-at "_") (custom-backward-word)) 
         (t (forward-char 1)))) 
         
(global-set-key [C-left] 'custom-backward-word) 


(defun custom-page-down ()
  (interactive)
  (condition-case nil (scroll-up)
    (end-of-buffer (goto-char (point-max)))))
    
(global-set-key [(hyper down)] 'custom-page-down)


(defun custom-page-up ()
  (interactive)
  (condition-case nil (scroll-down)
    (beginning-of-buffer (goto-char (point-min)))))
    
(global-set-key [(hyper up)] 'custom-page-up)


(defun custom-ignore-buffer (str)
  (or
   ;;buffers I don't want to switch to 
   (string-match "\\*Buffer List\\*" str)
   (string-match "^TAGS" str)
   (string-match "^\\*Messages\\*$" str)
   (string-match "^\\*Completions\\*$" str)
   (string-match "^\\*SPEEDBAR\\*" str)
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

(global-set-key [M-down] 'custom-prev-buffer)


(defun custom-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (custom-switch-buffer (buffer-list)))

(global-set-key [M-up] 'custom-next-buffer)


; autocompile emacs init file on save
(defun autocompile nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
      (byte-compile-file dotemacs))))

(add-hook 'after-save-hook 'autocompile)


(defun smart-tab ()
  "This smart tab is minibuffer compliant: it acts as usual in
    the minibuffer. Else, if mark is active, indents region. Else if
    point is at the end of a symbol, expands it. Else indents the
    current line."
  (interactive)
  (if (minibufferp)
      (unless (minibuffer-complete)
        (dabbrev-expand nil))
    (if mark-active
        (indent-region (region-beginning)
                       (region-end))
      (if (looking-at "\\_>")
          (dabbrev-expand nil)
        (indent-for-tab-command)))))

(global-set-key [(tab)] 'smart-tab)


(defun remove-control-m ()
  (interactive)
  (goto-char 1)
  (while (search-forward "
" nil t)
    (replace-match "" t nil)))


(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))


(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))


(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify-buffer)
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))


(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer.
Including indent-buffer, which should not be called automatically on save."
  (interactive)
  (cleanup-buffer-safe)
  (indent-buffer))


(defun new-empty-buffer ()
  "Create a new buffer called untitled(<n>)"
  (interactive)
  (let ((newbuf (generate-new-buffer-name "untitled")))
    (switch-to-buffer newbuf)))
(global-set-key [(hyper n)] 'new-empty-buffer)
