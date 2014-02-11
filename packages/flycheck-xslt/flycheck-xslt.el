;;; flycheck-xslt.el --- Flycheck checker for XSLT

;; Copyright (C) 2013  Phillip B Oldham <phillip.oldham@gmail.com>

;; Author: Phillip B Oldham <phillip.oldham@gmail.com>
;; Keywords: tools, extensions

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Flycheck checker for XSLT using xmllint and an XSLT schema

;;; Code:

(require 'flycheck)

(eval-and-compile
  (defvar flycheck-xslt-path
    (let ((path (or (locate-library "flycheck-xslt") load-file-name)))
      (and path (file-name-directory path)))
    "Directory containing the flycheck-xslt package."))

(flycheck-def-option-var flycheck-xslt-lint-command
    '( "xmllint"
       (option "--noout")
       source
       )
    flycheck-xslt
  "*The flycheck command list used by the flycheck syntax checker xslt"
  :type 'sexp)

;; ("xmllint" "--noout" source)
;;`("xmllint", (option "--noout") (option "--relaxng" (concat flycheck-xslt-path "xslt.rng")) source)
;;   ((error line-start (file-name) ":" line ": " (message) line-end))


(flycheck-declare-checker xslt-lint
  "Check syntax of XSLT code"
  :command '("xmllint" "--noout" source)
  :error-patterns '(("^\\(?1:.*\\):\\(?2:.*\\):.*:\\(?4:.*\\)$" error))
  :predicate
  (lambda ()
    (or
     (and buffer-file-name
          (string= "xslt" (file-name-extension buffer-file-name)))
     (and buffer-file-name
          (string= "xsl" (file-name-extension buffer-file-name))))))
(add-to-list 'flycheck-checkers 'xslt-lint)


(provide 'flycheck-xslt)

;;; flycheck-xslt ends here
