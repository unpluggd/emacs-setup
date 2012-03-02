(add-to-list 'load-path "~/.emacs.d")
;(add-to-list 'load-path "~/.emacs.d/icicles")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/coffee-mode")
;(add-to-list 'load-path "~/.emacs.d/plugins/twittering-mode")
;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet-0.6.1c")
;(add-to-list 'load-path "~/.emacs.d/vendor")



;; -- Custom Functions --
(load-file "~/.emacs.d/environ/custom-funcs.el")


;; -- Mac config --
(defvar mac-allow-anti-alaising)
(if (eq system-type 'darwin)
    (load-file "~/.emacs.d/environ/mac.el")
    (setq mac-allow-anti-alaising nil)
    )


;; -- Fixing annoyances --
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
(setq-default c-basic-offset 4) ; set tab width to 4 for all c-based modes
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(put 'downcase-region 'disabled nil) ; enable lowercase shortcut - disabled by default
(put 'upcase-region 'disabled nil) ; enable uppercase shortcut - disabled by default

;; -- Aliases
(defalias 'qrr 'query-replace-regexp)

;; -- yasnippet 
;(require 'yasnippet)
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")


;; -- twitter
;(require 'epa-file)
;(epa-file-enable)

;(require 'twittering-mode)
;(setq twittering-use-master-password t)
;(setq twittering-status-format "%s, aka %S, from %l:\n%FILL[  ]{%t}\n %@%r%R\n")
;(add-hook 'twittering-edit-mode-hook (lambda () (ispell-minor-mode) (flyspell-mode)))


;; -- speedbar --
(require 'sr-speedbar)

(setq speedbar-frame-parameters
      '((minibuffer)
        (width . 40)
        (border-width . 0)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (unsplittable . t)
        (left-fringe . 0)))

(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
;(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 40)
;(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)
  
  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

(speedbar-add-supported-extension ".js")
(add-to-list 'speedbar-fetch-etags-parse-list
             '("\\.js" . speedbar-parse-c-or-c++tag))

(defadvice delete-other-windows (after my-sr-speedbar-delete-other-window-advice activate)
  "Check whether we are in speedbar, if it is, jump to next window."
  (let ()
	(when (and (sr-speedbar-window-exist-p sr-speedbar-window)
               (eq sr-speedbar-window (selected-window)))
      (other-window 1)
	)))
(ad-enable-advice 'delete-other-windows 'after 'my-sr-speedbar-delete-other-window-advice)
(ad-activate 'delete-other-windows)

(if window-system
    (progn
      (add-hook 'after-init-hook 'sr-speedbar-open)))

;(sr-speedbar-open)


;; -- Undo/Redo --
(require 'redo+)
(global-set-key (kbd "C-?") 'redo)
(global-unset-key (kbd "C-z"))(global-set-key (kbd "C-z") 'undo)
(global-unset-key (kbd "C-Z"))(global-set-key (kbd "C-Z") 'redo)


;; -- autopair --
(require 'autopair)
(autopair-global-mode) ; enable in all buffers
; parens
(setq show-paren-delay 0)
(show-paren-mode t)
(setq show-paren-style 'parenthesis)


;; -- lipsum --
;(require 'lipsum)


;; -- searching --
(define-key isearch-mode-map (kbd "C-0")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
	       (regexp-quote isearch-string))))))


;; -- autocomplete --
(require 'auto-complete)

;; -- killring
(require 'browse-kill-ring+)
(browse-kill-ring-default-keybindings)




;; -- Themes --
(require 'color-theme)
(setq color-theme-is-global t)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-wombat)))


(require 'highlight-current-line)
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#222222")


;; -- Window alterations --
(require 'linum-off)
(global-linum-mode 1)
(setq column-number-mode 1)
(setq linum-disabled-modes-list '(speedbar))

(require 'window-number)
(window-number-meta-mode)



;; -- Project Management --
;(require 'ditz)
;(setq ditz-issue-directory ".issues")
;(setq ditz-find-issue-directory-automatically-flag t)



;; -- Python mode --
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; Highlight trailing whitespace
(add-hook 'python-mode-hook (lambda() (setq show-trailing-whitespace t)))
 
;(add-hook 'python-mode-hook
;           (lambda ()
;             (set (make-variable-buffer-local 'beginning-of-defun-function)
;                  'py-beginning-of-def-or-class)
;             (setq outline-regexp "def\\|class ")))


;; -- HAML mode --
; never used
;(require 'haml-mode)


;; -- Coffee-Script mode --
;(require 'coffee-mode)
(autoload 'coffee-mode "coffee-mode" "Major mode for editing coffee-script" t)
(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))


;; -- Less CSS mode --
(autoload 'less-css-mode "less-css-mode" "Major mode for editing less-css files" t)
(add-to-list 'auto-mode-alist '("\\.less\\'" . less-css-mode))


;; -- Thrift mode --
;(require 'thrift-mode)
(autoload 'thrift-mode "thrift-mode" "Major mode for thrift code" t)
(add-to-list 'auto-mode-alist '("\\.thrift\\'" . thrift-mode))


;; -- NGINX mode --
;(require 'nginx-mode)
(autoload 'nginx-mode "nginx-mode" "Major mode for nginx code." t)
(add-to-list 'auto-mode-alist '("\\.nginx\\'" . nginx-mode))


;; -- PHP mode --
(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php[345]?" . php-mode))
(add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.phtml$" . php-mode))
;(defun my-php-mode-hook ()
;  (setq c-basic-offset 4)
;  (lambda () (zencoding-mode 1)))
;(add-hook 'php-mode-hook 'my-php-mode-hook)


;; -- Zen Coding --
;(require 'zencoding-mode)
(autoload 'zencoding-mode "zencoding-mode" "Major mode for quickly creating html fragments" t)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;(add-to-list 'auto-mode-alist '("\\.php[345]?" . 'zencoding-mode))


;; -- FlyMake --
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
 
;(set-face-background 'flymake-errline "#ffa2a2")
;(set-face-foreground 'flymake-errline "#ff0000")

;(set-face-background 'flymake-errline "#000000")
;(set-face-foreground 'flymake-errline "#000000")

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "OrangeRed"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))



;; -- Remote Editing --
;(add-to-list 'load-path "~/emacs/tramp/lisp/")
;(add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")
;(require 'tramp)
;(setq tramp-default-method "ssh")


;; -- Custom keyboard alterations --
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



;; -- Smart Tab completion/indenting --
(global-set-key [(tab)] 'smart-tab)
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


;; -- Gnu config

(setq gnus-select-method '(nnimap "gmail"
                                  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)))

;(setq message-send-mail-function 'smtpmail-send-it
;      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "phillip.oldham@gmail.com" nil))
;      smtpmail-default-smtp-server "smtp.gmail.com"
;      smtpmail-smtp-server "smtp.gmail.com"
;      smtpmail-smtp-service 587
;      smtpmail-local-domain "")

(setq user-mail-address "phillip.oldham@gmail.com")
(setq user-full-name "Phillip B Oldham")

;; Make Gnus NOT ignore [Gmail] mailboxes
(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; -- PuTTY fixes --
;(load-file "~/.emacs.d/environ/putty.el")
