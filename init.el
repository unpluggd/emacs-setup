(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/icicles")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/vendor")


; ----------------------
; -- Custom Functions --
; ----------------------

(load-file "~/.emacs.d/environ/custom-funcs.el")

; -----------------------
; -- Fixing annoyances --
; -----------------------

(global-font-lock-mode 1) ; syntax highlighting on by default
(fset 'yes-or-no-p 'y-or-n-p) ; shorter 'yes or no' prompt
(setq auto-save-default nil) ; disable autosave
(setq make-backup-files nil) ; stop making backup files
(setq scroll-step 1) ; scroll by 1 line at the end of the file
(setq visible-bell t) ; kill the annoying bell
(setq inhibit-startup-message t) ; kill the start screen
(setq transient-mark-mode t) ; highlight regions/selections
(mouse-wheel-mode t) ; enable mouse-wheel where available
(setq require-final-newline t) ; always append a new line to the file
(menu-bar-mode -1) ; remove the useless menubar
(setq-default indent-tabs-mode nil) ; always replace tabs with spaces
(setq-default tab-width 4) ; set tab width to 4 for all buffers

; ---------------
; -- Undo/Redo --
; ---------------

(require 'redo+)
(global-set-key (kbd "C-?") 'redo)
(global-unset-key (kbd "C-z"))(global-set-key (kbd "C-z") 'undo)
(global-unset-key (kbd "C-Z"))(global-set-key (kbd "C-Z") 'redo)

; ---------------
; -- searching --
; ---------------

(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
	       (regexp-quote isearch-string))))))

; ------------
; -- Themes --
; ------------

(require 'color-theme)
(setq color-theme-is-global t)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-wombat)))


; ------------------------
; -- System alterations --
; ------------------------

(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#333333")

; parens
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)


(require 'auto-complete)

(require 'icicles)
(icy-mode)

(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)



; ------------------------
; -- Window alterations --
; ------------------------

(require 'linum)
(global-linum-mode 1)
(setq column-number-mode 1)

(require 'window-number)
(window-number-meta-mode)



; ---------------
; -- yasnippet --
; ---------------

;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/snippets")



; ----------------
; -- Zen Coding --
; ----------------

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes

; ------------------------
; -- Project Management --
; ------------------------

;(require 'ditz)
;(setq ditz-issue-directory ".issues")
;(setq ditz-find-issue-directory-automatically-flag t)


; -----------------
; -- Python mode --
; -----------------

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
 
(add-hook 'python-mode-hook
           (lambda ()
             (set (make-variable-buffer-local 'beginning-of-defun-function)
                  'py-beginning-of-def-or-class)
             (setq outline-regexp "def\\|class ")))

; ---------------
; -- HAML mode --
; ---------------
; never used
;(require 'haml-mode)

; ------------------------
; -- Coffee-Script mode --
; ------------------------

(require 'coffee-mode)

; -----------------
; -- Thrift mode --
; -----------------

(require 'thrift-mode)

; -------------
; -- FlyMake --
; -------------

(require 'flymake)

(defun auto-flymake-goto-next-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )
 
(defun auto-flymake-goto-prev-error()
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line)
  )

; Make FlyMake work with HTML
(defun flymake-html-init ()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
		     'flymake-create-temp-inplace))
	 (local-file (file-relative-name
		      temp-file
		      (file-name-directory buffer-file-name))))
    (list "tidy" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
	     '("\\.html$\\|\\.ctp" flymake-html-init))
	
(add-to-list 'flymake-err-line-patterns
	     '("line \\([0-9]+\\) column \\([0-9]+\\) - \\(Warning\\|Error\\): \\(.*\\)"
	       nil 1 2 4))

; Make FlyMake work with XSL
(push '(".+\\.xsl$" flymake-xml-init) flymake-allowed-file-name-masks)
(add-hook 'xsl-mode-hook
	  (lambda () (flymake-mode t)))

; Make FlyMake work with PHP
(unless (fboundp 'flymake-php-init)
  (defun flymake-php-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "php" (list "-f" local-file "-l")))))
 
(let ((php-ext-re "\\.php[345]?\\'")
      (php-error-re
       "\\(?:Parse\\|Fatal\\) error: \\(.*\\) in \\(.*\\) on line \\([0-9]+\\)"))
  (unless (assoc php-ext-re flymake-allowed-file-name-masks)
    (add-to-list 'flymake-allowed-file-name-masks
                 (list php-ext-re
		       'flymake-php-init
		       'flymake-simple-cleanup
		       'flymake-get-real-file-name))
    (add-to-list 'compilation-error-regexp-alist-alist
                 (list 'compilation-php
		       php-error-re 2 3 nil nil))
    (add-to-list 'compilation-error-regexp-alist 'compilation-php)
    (add-to-list 'flymake-err-line-patterns
                 (list php-error-re 2 3 nil 1))))
 
(add-hook 'php-mode-hook (lambda () (flymake-mode t)))
 
(set-face-background 'flymake-errline "#ffa2a2")
(set-face-foreground 'flymake-errline "#ff0000")


; --------------------
; -- Remote Editing --
; --------------------

(add-to-list 'load-path "~/emacs/tramp/lisp/")
(add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")
(require 'tramp)
(setq tramp-default-method "ssh")

; ---------------------------------
; -- Custom keyboard alterations --
; ---------------------------------

(global-set-key [kp-home] 'beginning-of-line)
(global-set-key [home] 'beginning-of-line)
(global-set-key [kp-end] 'end-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key [delete] 'delete-char)
(global-set-key "\C-l" 'goto-line)

(global-set-key [C-right] 'custom-forward-word) 
(global-set-key [C-left] 'custom-backward-word) 
(global-set-key [next] 'custom-page-down)
(global-set-key [prior] 'custom-page-up)



; -----------------
; -- PuTTY fixes --
; -----------------

(load-file "~/.emacs.d/environ/putty.el")



; ----------------
; -- Mac config --
; ----------------

(if (eq system-type 'darwin)
    (load-file "~/.emacs.d/environ/mac.el")
    (setq mac-allow-anti-alaising nil)
    )


