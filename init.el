(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/kits")

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'bastard t)	;; t is no confirm flag

; custom place to save customizations
(setq custom-file "~/.emacs.d/misc.el")
(when (file-exists-p custom-file) (load custom-file))

(require 'emacs-repos)

(require 'key-bindings)
(require 'defuns)

(require 'emacs-lisp-kit)
(require 'clojure-kit)
(require 'ruby-kit)
(require 'javascript-kit)
(require 'coffeescript-kit)
(require 'css-kit)
(require 'scss-kit)
(require 'markdown-kit)
; nXhtml
(load "/Users/vatikiot/.emacs.d/kits/nxhtml/autostart.el")
(require 'html-kit)

(require 'eval-buffer)
(require 'eshell-kit)
(require 'shell-modes)

(require 'compilation-mode-kit)

(require 'tramp-kit)

;;
;; el4r requires to rvm-activate the right ruby
;(require 'xiki)
;(rvm-activate-corresponding-ruby)
;;(el4r-boot)

; visit directories in the same buffer
(put 'dired-find-alternate-file 'disabled nil)
