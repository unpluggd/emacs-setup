;; scroll by 1 line at the end of the file
(setq scroll-step 1
      scroll-conservatively 10000)

;; set mouse wheel to scroll one line at a time
(setq mouse-wheel-progressive-speed nil)

;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))

;; don't accelerate scrolling
(setq mouse-wheel-progressive-speed nil)

;; scroll window under mouse
(setq mouse-wheel-follow-mouse 't)
