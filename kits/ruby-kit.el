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
;(require 'ruby-block)
(require 'ruby-electric)

(add-hook 'ruby-mode-hook
	  (lambda ()
	    (rvm-activate-corresponding-ruby)
	    (ruby-electric-mode t)
            (run-coding-hook)
	    ;(ruby-block-mode t)
	    )
	  )


(provide 'ruby-kit)
