;; We swap first Command-Meta keys
;; mac switch meta key
(defun mac-switch-meta nil 
  "switch meta between Option and Command"
  (interactive)
  (if (eq mac-option-modifier 'hyper)
    (progn
      (setq mac-option-modifier 'meta)
      (setq mac-command-modifier 'hyper)
    )
    (progn 
      (setq mac-option-modifier 'hyper) 
      (setq mac-command-modifier 'meta)
    )
  )
)
;(mac-switch-meta)


;; Align your code in a pretty way.
(global-set-key (kbd "C-x \\") 'align-regexp)

;; jumping to windows
;;http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00211.html
(define-key input-decode-map "\e[1;2A" [S-up])
(global-set-key (kbd "S-<up>") 'windmove-up)
(global-set-key (kbd "S-<down>") 'windmove-down)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<left>") 'windmove-left)

;; Resize windows
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

;; scroll a few lines
(defun move-down-lines ()
  "Scroll down a few lines"
  (interactive)
  (next-line)(next-line)(next-line)(next-line)(next-line)(next-line))
(defun move-up-lines ()
  "Scroll up a few lines"
  (interactive)
  (previous-line) (previous-line) (previous-line) (previous-line) (previous-line) (previous-line))
(global-set-key (kbd "M-<up>") 'move-up-lines )
(global-set-key (kbd "M-<down>") 'move-down-lines)
;; and unset paredit key-bindings that shadow the 2 previous ones
(eval-after-load "paredit"
  '(progn
      (define-key paredit-mode-map (kbd "M-<up>") nil)
      (define-key paredit-mode-map (kbd "M-<down>") nil)
      ))


;; Start eshell or switch to it if it's active.
(global-set-key (kbd "C-x m") 'eshell)

;; evaluate buffer
(global-set-key (kbd "C-c v") 'jw-eval-or-clear-buffer) ; pkg:eval-buffer

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; File finding
;(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-x f") 'find-file-in-project)
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


;;  GNU Emacs in Terminal + OS X 
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


(provide 'key-bindings)
;;; key-bindings ends here
