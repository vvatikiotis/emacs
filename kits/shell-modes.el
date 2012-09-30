(setq comint-prompt-read-only t)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)  ; --color=yes
(add-hook 'term-mode-hook 'ansi-color-for-comint-mode-on)  ; --color=yes

(provide 'shell-modes)
