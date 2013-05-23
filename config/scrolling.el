;; scroll by 1 line at the end of the file
(setq scroll-step 1
      scroll-conservatively 10000)

;; set mouse wheel to scroll one line at a time
(setq mouse-wheel-progressive-speed nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1))

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)

;; Emacs does not handle all scroll events on OSX, therefore inertia
;; scrolling does not work properly. This is a close approximation

(setq redisplay-dont-pause t)
(defun up-single () (interactive) (scroll-up 1))
(defun down-single () (interactive) (scroll-down 1))
(defun up-double () (interactive) (scroll-up 2))
(defun down-double () (interactive) (scroll-down 2))
(defun up-triple () (interactive) (scroll-up 5))
(defun down-triple () (interactive) (scroll-down 5))

(global-set-key [wheel-down] 'up-single)
(global-set-key [wheel-up] 'down-single)
(global-set-key [double-wheel-down] 'up-double)
(global-set-key [double-wheel-up] 'down-double)
(global-set-key [triple-wheel-down] 'up-triple)
(global-set-key [triple-wheel-up] 'down-triple)
