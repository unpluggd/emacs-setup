(autoload 'xquery-mode "xquery-mode" "minor mode for editing xquery files" t)
(setq auto-mode-alist (cons '("\\.xq" . xquery-mode) auto-mode-alist))
