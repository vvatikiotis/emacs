;(require 'css-mode)

(add-to-list 'auto-mode-alist '("\\.css$" . css-mode))

(add-hook 'css-mode-hook 'esk-paredit-nonlisp)
(add-hook 'css-mode-hook
	  (lambda ()
	    ()
	    )
	  )


(provide 'css-kit)
