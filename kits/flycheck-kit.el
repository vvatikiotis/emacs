;;; package --- Summary

;;; Commentary:

;;; Code:
(add-hook 'after-init-hook #'global-flycheck-mode)
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; (defface flycheck-color-mode-line-error-face
;;   '((t :foreground "#000000" :weight normal :inherit flycheck-fringe-error))
;;   "Face for the modeline in buffers with Flycheck errors."
;;   :group 'flycheck-faces)

;; (defface flycheck-color-mode-line-warning-face
;;   '((t :foreground "#000000" :weight normal :inherit flycheck-fringe-warning))
;;   "Face for the modeline in buffers with only Flycheck warnings."
;;   :group 'flycheck-faces)

(provide 'flycheck-kit)
;;; flycheck-kit.el ends here
