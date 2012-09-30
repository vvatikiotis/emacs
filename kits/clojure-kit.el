(defun turn-on-paredit () (paredit-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'inferior-lisp-mode-hook 'turn-on-paredit)

(setq linum-disabled-modes-list 
      '(inferior-lisp-mode))

(require 'cljdoc)
(provide 'clojure-kit)
