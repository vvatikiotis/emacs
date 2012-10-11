(autoload 'coffee-mode "coffee-mode" "Start coffee-mode" t)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 2))

(add-hook 'coffee-mode-hook
          '(lambda () (coffee-custom)))
(add-hook 'coffee-mode-hook 'esk-paredit-nonlisp)

(eval-after-load 'coffee-mode
  '(progn 
     (define-key coffee-mode-map "{" 'paredit-open-curly)
     (define-key coffee-mode-map "}" 'paredit-close-curly-and-newline)
     ;; fixes problem with pretty function font-lock
     ))

(provide 'coffeescript-kit)
