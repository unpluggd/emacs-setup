;; -- Fixing annoyances --

;; syntax highlighting on by default
(global-font-lock-mode 1) 

;; shorter 'yes or no' prompt
(fset 'yes-or-no-p 'y-or-n-p)

;; disable autosave 
(setq auto-save-default nil) 

;; stop making backup files
(setq make-backup-files nil) 

;; scroll by 1 line at the end of the file
(setq scroll-step 1) 

;; kill the annoying bell
(setq visible-bell t) 

;; kill the start screen
(setq inhibit-startup-message t) 

;; highlight regions/selections
(setq transient-mark-mode t) 

;; enable mouse-wheel where available
(mouse-wheel-mode t) 

;; always append a new line to the file
(setq require-final-newline t) 

;; always replace tabs with spaces
(setq-default indent-tabs-mode nil) 

;; set tab width to 4 for all buffers
(setq-default tab-width 4) 

;; always reload the file on disk when it updates
(global-auto-revert-mode 1)

;; set tab width to 4 for all c-based modes
(setq-default c-basic-offset 4) 
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(put 'downcase-region 'disabled nil) ; enable lowercase shortcut - disabled by default
(put 'upcase-region 'disabled nil) ; enable uppercase shortcut - disabled by default
(setq default-directory "~/Projects/") ; setting the open dir to my main projects folder
(prefer-coding-system 'utf-8)

;; highlight the current line
(global-hl-line-mode 1)
;(set-face-background 'hl-line "#222") 

(defalias 'xml-mode 'sgml-mode 
    "Use `sgml-mode' instead of nXML's `xml-mode'.")