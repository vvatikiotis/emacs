(setq comint-prompt-read-only nil) ;; t breaks shell-command
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output nil)
(setq comint-scroll-show-maximum-output t)
(setq comint-input-ignoredups t)


(defvar my-local-shells
  '("*shell*" "*shell*<2>"))
(defvar my-remote-shells
  '( ))
(defvar my-shells (append my-local-shells my-remote-shells))

(defun make-my-shell-output-read-only (text)
  "Add to comint-output-filter-functions to make stdout read only in my shells."
  (if (member (buffer-name) my-shells)
      (let ((inhibit-read-only t)
            (output-end (process-mark (get-buffer-process (current-buffer)))))
        (put-text-property comint-last-output-start output-end 'read-only t))))

(add-hook 'comint-output-filter-functions 'make-my-shell-output-read-only)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; make it harder to kill my shell buffers
;;(require 'protbuf)
;;(add-hook 'shell-mode-hook 'protect-process-buffer-from-kill-mode)

(add-hook 'term-mode-hook 'ansi-color-for-comint-mode-on)

(provide 'shell-modes)
