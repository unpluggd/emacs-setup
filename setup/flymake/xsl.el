; Make FlyMake work with XSL
(push '(".+\\.xsl$" flymake-xml-init) flymake-allowed-file-name-masks)
(add-hook 'xsl-mode-hook
	  (lambda () (flymake-mode t)))

