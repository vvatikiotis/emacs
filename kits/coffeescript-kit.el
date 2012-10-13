(autoload 'coffee-mode "coffee-mode" "Start coffee-mode" t)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun coffee-custom ()
  "coffee-mode-hook"

  (set (make-local-variable 'tab-width) 2)

  (define-key coffee-mode-map (kbd "s-r") 'coffee-compile-buffer)

  ;; Compile '.coffee' files on every save
  (if buffer-file-name
      (if (file-exists-p (buffer-file-name))
       (coffee-cos-mode t))
    )
  )


(add-hook 'coffee-mode-hook
          '(lambda () 
             (coffee-custom)
             ))
(add-hook 'coffee-mode-hook 'esk-paredit-nonlisp)

;; (eval-after-load 'coffee-mode
;;   '(progn 
;;      (define-key coffee-mode-map "{" 'paredit-open-curly)
;;      (define-key coffee-mode-map "}" 'paredit-close-curly-and-newline)
;;      ;; fixes problem with pretty function font-lock
;;      ))

(provide 'coffeescript-kit)
