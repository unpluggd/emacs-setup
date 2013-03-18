;;recentf
(require 'recentf)
(recentf-mode t)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)
