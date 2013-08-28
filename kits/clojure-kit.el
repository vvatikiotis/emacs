(defun turn-on-paredit () (paredit-mode 1))

(add-hook 'clojure-mode-hook 'turn-on-paredit)
(add-hook 'inferior-lisp-mode-hook 'turn-on-paredit)

(setq linum-disabled-modes-list 
      '(inferior-lisp-mode))

(when (not (package-installed-p 'nrepl))
  (package-install 'nrepl))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'nrepl-mode-hook 'paredit-mode)
(add-to-list 'same-window-buffer-names "*nrepl*")
(setq nrepl-popup-stacktraces nil)

(require 'cljdoc)
(provide 'clojure-kit)
