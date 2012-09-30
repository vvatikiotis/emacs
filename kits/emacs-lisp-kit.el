(require 'paredit)

(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)
(add-hook 'emacs-lisp-mode-hook       (lambda () 
					(paredit-mode +1) 
					(turn-on-eldoc-mode)
					()))

;;(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
;(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))
;(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))

(provide 'emacs-lisp-kit)
