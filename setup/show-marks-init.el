(packages-install
 (cons 'fm marmalade)
 (cons 'show-marks marmalade))

(require 'show-marks)

(global-set-key (kbd "<H-M-up>") 'show-marks)
(global-set-key (kbd "<H-M-right>") 'forward-mark)
(global-set-key (kbd "<H-M-left>") 'backward-mark)
