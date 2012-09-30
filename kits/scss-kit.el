
(add-to-list 'auto-mode-alist '("\\.scss" . scss-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; This it to "patch" sccs mode from elpa
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'scss-mode)
(require 'cl) ;; required for first function used in scss-mode.el

(defun scss-compile()
  "Compiles the current buffer, sass filename.scss filename.css"
  (interactive)
  (compile (concat scss-sass-command " " (mapconcat 'identity scss-sass-options " ") " " )))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'scss-mode-hook 'esk-paredit-nonlisp)
(add-hook 'scss-mode-hook
	  (lambda ()
	    ()
	    )
	  )

(provide 'scss-kit)
