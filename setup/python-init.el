;(packages-install
;  (cons 'python-mode marmalade))

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist 
             '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist 
             '("python" . python-mode))

;; Highlight trailing whitespace
(add-hook 'python-mode-hook 
          (lambda() (setq show-trailing-whitespace t)))
 
