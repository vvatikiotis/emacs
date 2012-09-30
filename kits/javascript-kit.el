(autoload 'js-mode "js" "Start js-mode" t)

(add-to-list 'auto-mode-alist '("\\.js$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . js-mode))

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

;; Flymake stuff
;(require 'flymake-jslint)

;;(require 'flymake-js)
;;(add-hook 'js-mode-hook 'flymake-jslint-load)

;; (when (load "flymake" t)
;;   (defun flymake-jslint-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;; 		       'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "jslint" (list local-file))))
  
;;   (setq flymake-err-line-patterns 
;; 	(cons '("^  [[:digit:]]+ \\([[:digit:]]+\\),\\([[:digit:]]+\\): \\(.+\\)$"  
;; 		nil 1 2 3)
;; 	      flymake-err-line-patterns))
  
;;   (add-to-list 'flymake-allowed-file-name-masks
;;                '("\\.js\\'" flymake-jslint-init)))
;; end flymake stuff

(provide 'javascript-kit)
