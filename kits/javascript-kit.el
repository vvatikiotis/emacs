(autoload 'js-mode "js" "Start js-mode" t)

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
;(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

(setq js-indent-level 4)
(setq js-auto-indent-flag t)

(add-hook 'js-mode-hook 'esk-paredit-nonlisp)
(add-hook 'js-mode-hook 'run-coding-hook)

(defun open-curly-and-place-cursor ()
  (interactive)
  (paredit-open-curly)
  (newline)
  (newline)
  (previous-line)
  (indent-for-tab-command))

(eval-after-load 'js
  '(progn 
     (define-key js-mode-map "{" 'open-curly-and-place-cursor)
     (define-key js-mode-map "}" 'paredit-close-curly-and-newline)
     ;; fixes problem with pretty function font-lock
     (define-key js-mode-map (kbd ",") 'self-insert-command)
     (font-lock-add-keywords
      'js-mode `(("\\(function *\\)("
                  (0 (progn (compose-region (match-beginning 1)
                                            (match-end 1) "ƒ")
                            nil)))))))

(provide 'javascript-kit)
