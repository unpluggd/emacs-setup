(defadvice sgml-delete-tag (after reindent-buffer activate)
  (cleanup-buffer))

(eval-after-load 'sgml-mode
  '(define-key sgml-mode-map (kbd "<C-M-backspace>") 'sgml-delete-tag))

(defvar hc-tag nil)
(defun hc-tag ()
  (interactive)
  (let* (( tag (ido-completing-read 
                (format "Tag%s: " 
                        (if hc-tag 
                            (concat "[" (car hc-tag) "]")
                          ""))
                (mapcar 'car html-tag-alist)
                nil nil nil 'hc-tag
                )))
    (when tag (sgml-tag tag))))

(eval-after-load 'sgml-mode
  '(define-key sgml-mode-map (kbd "H-<") 'hc-tag))
