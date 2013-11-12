;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")


(require 'rvm)
(require 'flymake-ruby)
;(require 'ruby-block)
(require 'ruby-electric)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (rvm-activate-corresponding-ruby)
	    ;(flymake-mode t)
	    (ruby-electric-mode t)
	    ;(ruby-block-mode t)
	    )
	  )

;; (defun flymake-ruby-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     ;; Invoke ruby with '-c' to get syntax checking
;;     (list "ruby" (list "-c" local-file))))

;; (defun flymake-ruby-enable ()
;;   (when (and buffer-file-name
;;              (file-writable-p
;;               (file-name-directory buffer-file-name))
;;              (file-writable-p buffer-file-name)
;;              (if (fboundp 'tramp-list-remote-buffers)
;;                  (not (subsetp
;;                        (list (current-buffer))
;;                        (tramp-list-remote-buffers)))
;;                t))
;;     (local-set-key (kbd "C-c d")
;;                    'flymake-display-err-menu-for-current-line)
;;     (flymake-mode t)))
   
;; (eval-after-load 'ruby-mode
;;   '(progn
;;      (require 'flymake)
;;      (push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
;;      (push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
;;      (push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3)
;;            flymake-err-line-patterns)
;;      (add-hook 'ruby-mode-hook 'flymake-ruby-enable)))

(provide 'ruby-kit)
