(packages-install
    (cons 'ack gnu))

(require 'ack)

;; replace grep with ack, 'cos it's better
(defalias 'grep 'ack)
