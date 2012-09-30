(autoload 'markdown-mode "markdown-mode" "Start markdown-mode" t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'markdown-kit)
