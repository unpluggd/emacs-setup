;; Handle zip compression
(eval-after-load "dired-aux"
  '(add-to-list 'dired-compress-file-suffixes
                '("\\.zip\\'" ".zip" "unzip")))

;; Make sizes human-readable by default, sort version numbers
;; correctly, and put dotfiles and capital-letters first.
(setq-default dired-listing-switches "-aGglhvop")

(setq dired-recursive-copies 'always)

;; Allow running multiple async commands simultaneously
(defadvice shell-command (after shell-in-new-buffer (command &optional output-buffer error-buffer))
  (when (get-buffer "*Async Shell Command*")
    (with-current-buffer "*Async Shell Command*"
      (rename-uniquely))))
(ad-activate 'shell-command)


