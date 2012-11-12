(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Ubuntu Mono")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 160)

  )

(require 'hippie-exp)
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
; Fix an issue with starter-kit not requiring hippie-exp


(defvar my-packages '(starter-kit
                      starter-kit-lisp
                      starter-kit-ruby
                      starter-kit-bindings
                      starter-kit-eshell
                      ack
                      php-mode
                      twilight-theme
                      ujelly-theme
                      smooth-scroll
                      solarized-theme
                      sass-mode
                      haml-mode
                      coffee-mode
                      flymake
                      flymake-ruby
                      flymake-sass
                      flymake-haml
                      magit))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(load-theme 'solarized-dark)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
