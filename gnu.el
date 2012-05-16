;(setq gnus-select-method '(nnimap "gmail"
;                                  (nnimap-address "imap.gmail.com")
;                                  (nnimap-server-port 993)
;                                  (nnimap-stream ssl)))

;(setq message-send-mail-function 'smtpmail-send-it
;      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
;      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "phillip.oldham@gmail.com" nil))
;      smtpmail-default-smtp-server "smtp.gmail.com"
;      smtpmail-smtp-server "smtp.gmail.com"
;      smtpmail-smtp-service 587
;      smtpmail-local-domain "")

;(setq user-mail-address "phillip.oldham@gmail.com")
;(setq user-full-name "Phillip B Oldham")

;; Make Gnus NOT ignore [Gmail] mailboxes
;(setq gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
