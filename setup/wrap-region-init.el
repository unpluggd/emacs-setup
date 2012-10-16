(packages-install
    (cons 'wrap-region marmalade)
    )

(require 'wrap-region)
(wrap-region-global-mode t)
(setq wrap-region-keep-mark t)
(add-to-list 'wrap-region-tag-active-modes 'sgml-mode)

(defadvice wrap-region-trigger (before disable-autopair activate)
  (if (region-active-p)
      (autopair-global-mode -1)))

(defadvice wrap-region-trigger (after re-enable-autopair activate)
  (if (region-active-p)
      (autopair-global-mode 1)))
