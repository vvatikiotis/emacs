;; Not in load path so require doesn't work
;; I have to do this explicitely, via load
;(require 'multi-web-mode)

(load "multi-web-mode/multi-web-mode.el")
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (js-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))

(multi-web-global-mode 1)
