(defconst jw-eval-buffer-commands
  '(("js" . "/usr/local/bin/node -e")
    ("javascript-mode" . "/usr/local/bin/node -e")
    ("js-mode" . "/usr/local/bin/node -e")

    ("rb" . "/Users/vatikiot/.rvm/bin/rvm-auto-ruby")
    ("ruby-mode" . "/Users/vatikiot/.rvm/bin/rvm-auto-ruby")

    ("coffee-mode" . "/usr/local/share/npm/bin/coffee -e")

    ("clj" . "/Users/vatikiot/local/bin/clojure")
    ("clojure-mode" . "/Users/vatikiot/local/bin/clojure")))

(defconst jw-eval-buffer-name "*EVALBUFFER*")

(defun jw-eval-buffer ()
  "Evaluate the current buffer and display the result in a buffer."
  (interactive)
  ;(save-buffer)
  (let* ( ;(file-name (buffer-file-name (current-buffer)))
         ;(file-extension (file-name-extension file-name))
         (buffer-eval-command-pair (assoc (symbol-name major-mode) jw-eval-buffer-commands))
         (this-buffer-name (buffer-name))
         )
    (if buffer-eval-command-pair
        (let ((command (concat (cdr buffer-eval-command-pair) " " "'" (buffer-string) "'")))
          (shell-command-on-region (point-min) (point-max) command jw-eval-buffer-name nil)
          (pop-to-buffer jw-eval-buffer-name)
                                        ;(other-window 1)
          (select-window (get-buffer-window this-buffer-name))
          (jw-eval-buffer-pretty-up-errors jw-eval-buffer-name)
          (message ".."))
      (message "undefined mode"))))

(defun jw-eval-buffer-pretty-up-errors (buffer)
  "Fix up the buffer to highlight the error message (if it contains one)."
  (save-excursion
    (set-buffer buffer)
    (goto-char (point-min))
    (let ((pos (search-forward-regexp "\\.rb:[0-9]+:\\(in.+:\\)? +" (point-max) t)))
      (if pos (progn
                (goto-char pos)
                (insert-string "\n\n")
                (end-of-line)
                (insert-string "\n"))))))

(defun jw-clear-eval-buffer ()
  (interactive)
  (save-excursion
    (set-buffer jw-eval-buffer-name)
    (kill-region (point-min) (point-max))))

(defun jw-eval-or-clear-buffer (n)
  (interactive "P")
;  (message "n argument is %d" n)
  (cond ((null n) (jw-eval-buffer))
        (t (jw-clear-eval-buffer)))  )

(provide 'eval-buffer)
