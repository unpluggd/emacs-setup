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
(setq default-directory "~/Projects/") ; setting the open dir to my main projects folder
(prefer-coding-system 'utf-8)
