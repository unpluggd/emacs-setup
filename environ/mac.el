(require 'minimap)
(require 'redo+)
(require 'mac-key-mode)

(mac-key-mode 1)
(normal-erase-is-backspace-mode 1)

(setq default-input-method "MacOSX")
(setq mouse-wheel-scroll-amount '(0.01))
(setq mac-command-modifier 'alt mac-option-modifier 'meta)

(set-frame-parameter nil 'alpha 0.9) 

(fset 'insertPound
   "#")
(global-set-key "\M-\\" 'insertPound)
(global-set-key [M-up] 'custom-next-buffer)
(global-set-key [M-down] 'custom-prev-buffer)
