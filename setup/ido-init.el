(require 'ido)
(ido-mode t)
(setq ido-confirm-unique-completion nil)
(setq ido-create-new-buffer 'always)
(setq ido-enable-flex-matching t)
(setq ido-ignore-extensions t)
(setq ido-use-virtual-buffers t)

(defun ido-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (unless (featurep 'imenu)
    (require 'imenu nil t))
  (cond
   ((not symbol-list)
    (let ((ido-mode ido-mode)
          (ido-enable-flex-matching
           (if (boundp 'ido-enable-flex-matching)
               ido-enable-flex-matching t))
          name-and-pos symbol-names position)
      (unless ido-mode
        (ido-mode 1)
        (setq ido-enable-flex-matching t))
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (ido-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (ido-completing-read "Symbol? " symbol-names))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (ido-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names name)
          (add-to-list 'name-and-pos (cons name position))))))))

(global-set-key (kbd "M-i") 'ido-goto-symbol)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; This tab override shouldn't be necessary given ido's default
;; configuration, but minibuffer-complete otherwise dominates the
;; tab binding because of my custom tab-completion-everywhere
;; configuration.
;; (add-hook 'ido-setup-hook
;;           (lambda ()
;;             (define-key ido-completion-map [tab] 'ido-complete)))
