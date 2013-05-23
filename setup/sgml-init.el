(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer))

(eval-after-load 'sgml-mode
  '(define-key sgml-mode-map (kbd "H-<") 'sgml-tag))

(eval-after-load 'sgml-mode
  '(define-key sgml-mode-map (kbd "<C-M-backspace>") 'sgml-delete-tag))
