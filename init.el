(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/plugins")
(add-to-list 'load-path "~/.emacs.d/plugins/coffee-mode")
(add-to-list 'load-path "~/.emacs.d/plugins/markdown-mode")

(load-file "~/.emacs.d/environ/custom-funcs.el")
(load-file "~/.emacs.d/annoyances.el")


;; -- Mac config --
(if (eq system-type 'darwin)
    (load-file "~/.emacs.d/environ/mac.el"))
;; -- PuTTY config --
;(load-file "~/.emacs.d/environ/putty.el")



;; -- Aliases
(defalias 'qrr 'query-replace-regexp)



;; -- speedbar --
;(load-file "~/.emacs.d/environ/speedbar.el")


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
(load-file "~/.emacs.d/line-numbers.el")

(require 'window-number)
;(window-number-meta-mode)
(setq window-number-meta-mode-map (make-sparse-keymap))
(window-number-define-keys window-number-meta-mode-map "A-")



;; -- Python mode --
(load-file "~/.emacs.d/python.el")

;; -- Coffee-Script mode --
(require 'coffee-mode)
;(autoload 'coffee-mode "coffee-mode" "Major mode for editing coffee-script" t)
;(add-to-list 'auto-mode-alist '("\\.coffee\\'" . coffee-mode))
;(add-to-list 'auto-mode-alist '("\\.cs\\'" . coffee-mode))


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
;  (setq c-basicoffset 4)
;  (lambda () (zencoding-mode 1)))
;(add-hook 'php-mode-hook 'my-php-mode-hook)


;; -- Markdown --

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mkd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))

;; -- YAML --

(autoload 'yaml-mode "yaml-mode" "Major mode for editing YAML files" t)
(add-to-list 'auto-mode-alist '("\\.ya?ml" . yaml-mode))
(add-hook 'yaml-mode-hook 
          '(lambda () (define-key yaml-mode-map "\C-m" 'newline-and-indent)))


;; -- XSL-FO --
(add-to-list 'auto-mode-alist '("\\.fo\\'" . xml-mode))


;; -- Zen Coding --
;(require 'zencoding-mode)
(autoload 'zencoding-mode "zencoding-mode" "Major mode for quickly creating html fragments" t)
(add-hook 'sgml-mode-hook 'zencoding-mode) ;; Auto-start on any markup modes
;(add-to-list 'auto-mode-alist '("\\.php[345]?" . 'zencoding-mode))


;; -- Flymake --
(load-file "~/.emacs.d/flymake/init.el")
(load-file "~/.emacs.d/flymake/xsl.el")

;; -- keyboard tweaks --
(load-file "~/.emacs.d/keyboard.el")


;; -- Remote Editing --
;(add-to-list 'load-path "~/emacs/tramp/lisp/")
;(add-to-list 'Info-default-directory-list "~/emacs/tramp/info/")
;(require 'tramp)
;(setq tramp-default-method "ssh")

