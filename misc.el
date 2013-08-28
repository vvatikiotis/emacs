;;
;; Globals
;;

(server-start)

;(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; tabs are spaces
(setq-default indent-tabs-mode nil)

(setq
 ;locale
 locale-coding-system 'utf-8
 default-coding-system 'utf-8
 selection-coding-system 'utf-8
 terminal-coding-system 'utf-8
 keyboard-coding-system 'utf-8
 prefer-coding-system 'utf-8

 ;highlight line
 global-hl-line-mode t

 ;scrolling
 scroll-margin 0
 scroll-conservatively 100000
 scroll-preserve-screen-position 1
 
 ;clipboard
 x-select-enable-clipboard t

 visible-bell t
 echo-keystrokes 0.1
 font-lock-maximum-decoration t
 inhibit-startup-message t
 transient-mark-mode t
 color-theme-is-global t
 shift-select-mode nil
 mouse-yank-at-point t
 require-final-newline t
 truncate-partial-width-windows nil
 uniquify-buffer-name-style 'forward
 whitespace-style '(trailing lines space-before-tab
			     indentation space-after-tab)
 whitespace-line-column 100
 ediff-window-setup-function 'ediff-setup-windows-plain
 xterm-mouse-mode t
 )

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (mouse-wheel-mode t)
  (blink-cursor-mode -1))

(add-hook 'before-make-frame-hook 'turn-off-tool-bar)


;; ido-mode
(ido-mode t)
;(ido-ubiquitous t)
(setq ido-enable-prefix nil
      ido-enable-flex-matching t
      ido-auto-merge-work-directories-length nil
      ido-create-new-buffer 'always
      ido-use-filename-at-point 'guess
      ido-use-virtual-buffers t
      ido-handle-duplicate-virtual-buffers 2
      ido-max-prospects 10)


;; This for turning off antialiasing. Need to chack it out
;; (setq mac-allow-anti-aliasing nil)

;; no line numbers on certain major modes. Override linum-on
;;(column-number-mode nil)
;;(line-number-mode nil)
;;(global-linum-mode t)
;; (if (equal window-system nil)     ; nil=terminal
;;     (setq linum-format "%d ")
;;     )
;; (setq linum-disabled-modes-list 
;;       '(inferior-lisp-mode eshell-mode shell-mode wl-summary-mode compilation-mode term-mode completion-list-mode erc-mode))
;; (defun linum-on ()
;;   (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
;;     (linum-mode 1)
;;     ))

(delete-selection-mode 1)

;; font size matters!
;; different font sizes for screen sizes
(if (or (equal window-system "x") (equal window-system "ns"))
    (set-face-attribute 'default nil)
  (if (equal system-name "vael")
      (set-frame-font "Menlo-12")
    )
  (if (equal system-name "luminus.local")
      (set-frame-font "Menlo-12")
    )
  (if (equal system-name "iit")
      (set-frame-font "Menlo-12")
    )
  )

;; Transparently open compressed files
(auto-compression-mode t)

;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)

;; Save a list of recent files visited.
(recentf-mode 1)

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Don't clutter up directories with files~
(setq backup-by-copying t                ; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 3
      kept-old-versions 2
      version-control t)                 ; use versioned backups


(defalias 'yes-or-no-p 'y-or-n-p)

;; Select a line without marking it region first
(defadvice kill-ring-save (before slick-copy activate compile) 
  "When called interactively with no active region, copy a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (message "Copied line")
     (list (line-beginning-position) (line-beginning-position 2)))))

;; kill a line with C-w
(defadvice kill-region (before slick-cut activate compile)
  "When called interactively with no active region, kill a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))

;;
;; we cannot have more than one custom-set-variables function,
;; sod this is a good place, for now.
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(coffee-command "/usr/local/share/npm/bin/coffee")
 '(custom-safe-themes (quote ("0025f6995ccf2f0ee680c03e313c3cf1a4a93b9af9a740fc21c9e7cf20da4c4f" "da5a4e12964ed4c1e8fd7a52371c2cc5abf1f10b8f3c78da29f617411e9032ba" "2653101d267546b4cf6b76fa47e42604377aebf111a121ed71a7fd3d65cf43d7" default)))
 '(ediff-split-window-function (quote split-window-horizontally))
 '(explicit-shell-file-name "/usr/local/bin/bash")
 '(flymake-jslint-command "/usr/local/bin/jslint")
 '(scss-sass-command "/Users/vatikiot/.rvm/gems/ruby-1.9.2-p290@sencha/bin/compass")
 '(scss-sass-options (quote ("compile")))
 '(coffee-tab-width 2)
)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
