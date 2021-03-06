;; CUA rectangle support
;; ---------------------
;; Emacs' normal rectangle support is based on interpreting the region
;; between the mark and point as a "virtual rectangle", and using a
;; completely separate set of "rectangle commands" [C-x r ...] on the
;; region to copy, kill, fill a.s.o. the virtual rectangle.
;;
;; cua-mode's superior rectangle support uses a true visual
;; representation of the selected rectangle, i.e. it highlights the
;; actual part of the buffer that is currently selected as part of the
;; rectangle.  Unlike emacs' traditional rectangle commands, the
;; selected rectangle always as straight left and right edges, even
;; when those are in the middle of a TAB character or beyond the end
;; of the current line.  And it does this without actually modifying
;; the buffer contents (it uses display overlays to visualize the
;; virtual dimensions of the rectangle).
;;
;; This means that cua-mode's rectangles are not limited to the actual
;; contents of the buffer, so if the cursor is currently at the end of a
;; short line, you can still extend the rectangle to include more columns
;; of longer lines in the same rectangle.  And you can also have the
;; left edge of a rectangle start in the middle of a TAB character.
;; Sounds strange? Try it!
;;
;; To start a rectangle, use [C-return] and extend it using the normal
;; movement keys (up, down, left, right, home, end, C-home,
;; C-end). Once the rectangle has the desired size, you can cut or
;; copy it using C-x and C-c (or C-w and M-w), and you can
;; subsequently insert it - as a rectangle - using C-v (or C-y).  So
;; the only new command you need to know to work with cua-mode
;; rectangles is C-return!
;;
;; Normally, when you paste a rectangle using C-v (C-y), each line of
;; the rectangle is inserted into the existing lines in the buffer.
;; If overwrite-mode is active when you paste a rectangle, it is
;; inserted as normal (multi-line) text.
;;
;; If you prefer the traditional rectangle marking (i.e. don't want
;; straight edges), [M-p] toggles this for the current rectangle,
;; or you can customize cua-virtual-rectangle-edges.

;; And there's more: If you want to extend or reduce the size of the
;; rectangle in one of the other corners of the rectangle, just use
;; [return] to move the cursor to the "next" corner.  Or you can use
;; the [M-up], [M-down], [M-left], and [M-right] keys to move the
;; entire rectangle overlay (but not the contents) in the given
;; direction.
;;
;; [C-return] cancels the rectangle
;; [C-space] activates the region bounded by the rectangle

;; If you type a normal (self-inserting) character when the rectangle is
;; active, the character is inserted on the "current side" of every line
;; of the rectangle.  The "current side" is the side on which the cursor
;; is currently located. If the rectangle is only 1 column wide,
;; insertion will be performed to the left when the cursor is at the
;; bottom of the rectangle.  So, for example, to comment out an entire
;; paragraph like this one, just place the cursor on the first character
;; of the first line, and enter the following:
;;     C-return M-} ; ;   C-return

;; cua-mode's rectangle support also includes all the normal rectangle
;; functions with easy access:
;;
;; [M-a] aligns all words at the left edge of the rectangle
;; [M-b] fills the rectangle with blanks (tabs and spaces)
;; [M-c] closes the rectangle by removing all blanks at the left edge
;;       of the rectangle
;; [M-f] fills the rectangle with a single character (prompt)
;; [M-i] increases the first number found on each line of the rectangle
;;       by the amount given by the numeric prefix argument (default 1)
;;       It recognizes 0x... as hexadecimal numbers
;; [M-k] kills the rectangle as normal multi-line text (for paste)
;; [M-l] downcases the rectangle
;; [M-m] copies the rectangle as normal multi-line text (for paste)
;; [M-n] fills each line of the rectangle with increasing numbers using
;;       a supplied format string (prompt)
;; [M-o] opens the rectangle by moving the highlighted text to the
;;       right of the rectangle and filling the rectangle with blanks.
;; [M-p] toggles virtual straight rectangle edges
;; [M-P] inserts tabs and spaces (padding) to make real straight edges
;; [M-q] performs text filling on the rectangle
;; [M-r] replaces REGEXP (prompt) by STRING (prompt) in rectangle
;; [M-R] reverse the lines in the rectangle
;; [M-s] fills each line of the rectangle with the same STRING (prompt)
;; [M-t] performs text fill of the rectangle with TEXT (prompt)
;; [M-u] upcases the rectangle
;; [M-|] runs shell command on rectangle
;; [M-'] restricts rectangle to lines with CHAR (prompt) at left column
;; [M-/] restricts rectangle to lines matching REGEXP (prompt)
;; [C-?] Shows a brief list of the above commands.

;; [M-C-up] and [M-C-down] scrolls the lines INSIDE the rectangle up
;; and down; lines scrolled outside the top or bottom of the rectangle
;; are lost, but can be recovered using [C-z].

(setq cua-enable-cua-keys nil)
(setq cua-highlight-region-shift-only t) ;; no transient mark mode
(setq cua-toggle-set-mark nil) ;; original set-mark behavior, i.e. no transient-mark-mode
(cua-mode)
