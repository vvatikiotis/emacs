;;; init.el --- Summary

;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/kits")
(let ((default-directory "~/.emacs.d/submodules/"))
  (normal-top-level-add-subdirs-to-load-path))

;; emacs-repos declares the package repos
;; place it first!
(load-library "emacs-repos") ;; looks up in the load-path var

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'bastard t)	;; t is no confirm flag

(setq custom-file "~/.emacs.d/misc.el")
(when (file-exists-p custom-file) (load custom-file))

;; set emacs exec-path to shell's PATH
;; M-: (executable-find "executable") to determine whether emacs can "see" it
;;(when (memq window-system '(mac ns))
(exec-path-from-shell-initialize)
;;)

(require 'mode-line-format)
(require 'defuns)
(require 'emacs-lisp-kit)
(require 'clojure-kit)
(require 'ruby-kit)
(require 'javascript-kit)
(require 'coffeescript-kit)
(require 'css-kit)
(require 'scss-kit)
(require 'markdown-kit)
(require 'eval-buffer)
(require 'eshell-kit)
(require 'shell-modes)
(require 'compilation-mode-kit)
(require 'tramp-kit)
(require 'html-kit)

;;
;; el4r requires to rvm-activate the right ruby
;(require 'xiki)
;(rvm-activate-corresponding-ruby)
;;(el4r-boot)

; visit directories in the same buffer
(put 'dired-find-alternate-file 'disabled nil)

;; put this last as we want our bindings to mask others
(require 'key-bindings)

(require 'flycheck-kit)

;; pair programming mode
(require 'lockstep)

;; projectile
(projectile-global-mode)

(provide 'init)
;;; init.el ends here
