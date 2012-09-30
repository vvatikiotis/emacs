;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; jumping to windows
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)

;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; evaluate buffer
(global-set-key (kbd "C-c v") 'jw-eval-or-clear-buffer) ; pkg:eval-buffer

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; File finding
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

;; So good!
(global-set-key (kbd "C-x g") 'magit-status)

;; Start eshell or switch to it if it's active.
;;(global-set-key (kbd "C-x m") 'ansi-term)
(global-set-key (kbd "C-x m") 'shell)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "\C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(provide 'key-bindings)
