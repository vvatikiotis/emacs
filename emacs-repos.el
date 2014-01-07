;; package --- Summary:

;;; Commentary:

;;; Code:

(require 'package)

(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/"))
(package-initialize)

(provide 'emacs-repos)
;;; emacs-repos.el ends here
