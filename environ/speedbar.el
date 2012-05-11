(require 'sr-speedbar)

(setq speedbar-frame-parameters
      '((minibuffer)
        (width . 40)
        (border-width . 0)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (unsplittable . t)
        (left-fringe . 0)))

(setq speedbar-hide-button-brackets-flag t)
(setq speedbar-show-unknown-files t)
(setq speedbar-smart-directory-expand-flag t)
(setq speedbar-use-images nil)
;(setq sr-speedbar-auto-refresh nil)
(setq sr-speedbar-max-width 40)
;(setq sr-speedbar-right-side nil)
(setq sr-speedbar-width-console 40)

(when window-system
  (defadvice sr-speedbar-open (after sr-speedbar-open-resize-frame activate)
    (set-frame-width (selected-frame)
                     (+ (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-open 'after 'sr-speedbar-open-resize-frame)
  
  (defadvice sr-speedbar-close (after sr-speedbar-close-resize-frame activate)
    (sr-speedbar-recalculate-width)
    (set-frame-width (selected-frame)
                     (- (frame-width) sr-speedbar-width)))
  (ad-enable-advice 'sr-speedbar-close 'after 'sr-speedbar-close-resize-frame))

(speedbar-add-supported-extension ".js")
(add-to-list 'speedbar-fetch-etags-parse-list
             '("\\.js" . speedbar-parse-c-or-c++tag))

(defadvice delete-other-windows (after my-sr-speedbar-delete-other-window-advice activate)
  "Check whether we are in speedbar, if it is, jump to next window."
  (let ()
	(when (and (sr-speedbar-window-exist-p sr-speedbar-window)
               (eq sr-speedbar-window (selected-window)))
      (other-window 1)
	)))
(ad-enable-advice 'delete-other-windows 'after 'my-sr-speedbar-delete-other-window-advice)
(ad-activate 'delete-other-windows)

(if window-system
    (progn
      (add-hook 'after-init-hook 'sr-speedbar-open)))

;(sr-speedbar-open)
