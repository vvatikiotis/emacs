(autoload 'markdown-mode "markdown-mode" "Start markdown-mode" t)

(defun turn-on-paredit () (paredit-mode 1))

(add-hook 'markdown-mode-hook 'turn-on-paredit)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'markdown-kit)
