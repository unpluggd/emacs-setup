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
  (let ((newbuf (generate-new-buffer-name "*RELOADING-CONFIG*")))
    (switch-to-buffer newbuf))
  (let ((dot-emacs "~/.emacs.d/init.el"))
    (and (get-file-buffer dot-emacs)
         (save-buffer (get-file-buffer dot-emacs)))
    (load-file dot-emacs))
  (kill-buffer "*RELOADING-CONFIG*")
  (message "Re-initialized!")
  (winner-undo))


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


;; (defun custom-page-down ()
;;   (interactive)
;;   (condition-case nil (scroll-up)
;;     (end-of-buffer (goto-char (point-max)))))

;; (global-set-key [(hyper down)] 'custom-page-down)


;; (defun custom-page-up ()
;;   (interactive)
;;   (condition-case nil (scroll-down)
;;     (beginning-of-buffer (goto-char (point-min)))))

;; (global-set-key [(hyper up)] 'custom-page-up)


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

(global-set-key [(hyper down)] 'custom-prev-buffer)


(defun custom-next-buffer ()
  "Switch to the other buffer (2nd in list-buffer) in current window."
  (interactive)
  (bury-buffer (current-buffer))
  (custom-switch-buffer (buffer-list)))

(global-set-key [(hyper up)] 'custom-next-buffer)


; compile emacs init file
(defun compile-initel nil
  "compile itself if ~/.emacs"
  (interactive)
  (require 'bytecomp)
  (setf byte-compile-warnings '(not cl-functions))
  (let ((dotemacs (expand-file-name "~/.emacs.d/init.el")))
    (if (string= (buffer-file-name) (file-chase-links dotemacs))
      (byte-compile-file dotemacs))))

;(add-hook 'after-save-hook 'compile-initel)


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


(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))


(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(global-set-key [(C f12)] 'iwb)


(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))


(defun open-with ()
  "Simple function that allows us to open the underlying
file of a buffer in an external program."
  (interactive)
  (when buffer-file-name
    (shell-command (concat
                    (if (eq system-type 'darwin)
                        "open"
                      (read-shell-command "Open current file with: "))
                    " "
                    buffer-file-name))))


(defun google-it ()
  "Google the selected region if any, display a query prompt otherwise."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (url-hexify-string (if mark-active
         (buffer-substring (region-beginning) (region-end))
       (read-string "Google: "))))))

(global-set-key (kbd "C-c g") 'google-it)


(defun smart-kill-whole-line (&optional arg)
  "A simple wrapper around `kill-whole-line' that respects indentation."
  (interactive "P")
  (kill-whole-line arg)
  (back-to-indentation))

(global-set-key [remap kill-whole-line] 'smart-kill-whole-line)


(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)))))))


(defun fix-whitespace-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))

(global-set-key (kbd "H-M-SPC") 'fix-whitespace-in-region)

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while  (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1  b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))

(global-set-key (kbd "<C-H-tab>") 'rotate-windows)


(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

;(global-set-key (kbd "<M-S-down>") 'move-line-down)
;(global-set-key (kbd "<M-S-up>") 'move-line-up)

(global-set-key (kbd "<H-S-down>") 'move-line-down)
(global-set-key (kbd "<H-S-up>") 'move-line-up)


(defun sort-lines-nocase ()
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))


(defun replace-string-withcase ()
  (interactive)
  (let ((case-fold-search nil))
    (call-interactively 'replace-string)))


(defun fix-quotes (beg end)
  "Replace 'smart quotes' in buffer or region with ascii quotes."
  (interactive "r")
  (format-replace-strings '(("\x201C" . "\"")
                            ("\x201D" . "\"")
                            ("\x2018" . "'")
                            ("\x2019" . "'"))
                          nil beg end))

;;; custom-funcs ends here
