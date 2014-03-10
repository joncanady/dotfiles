(when (eq system-type 'darwin)
  ;; default Latin font (e.g. Consolas)
  (set-face-attribute 'default nil :family "Source Code Pro for Powerline")
  ;; default font size (point * 10)
  ;;
  ;; WARNING!  Depending on the default font,
  ;; if the size is not supported very well, the frame will be clipped
  ;; so that the beginning of the buffer may not be visible correctly. 
  (set-face-attribute 'default nil :height 140))

(add-to-list 'load-path "~/.emacs.d/vendor/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(require 'hippie-exp)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
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
                      magit
                      markdown-mode
                      yaml-mode
                      rspec-mode
                      flycheck))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "03b649ae49a7d40c7115611f1da3e126c33c10b96dd18ee45bdd8319ed375a78" "1d9f2295049aacd2ba2cf0068b8b6985b78e1913c001135cc7d9930b037493e5" "a0aca9963b34ddf04767e2fe85abd67009bdf975027b81bac385a7e9d549f54d" "8643546ef586d1bc6e887c0aceab520b086126f13a86631c917f293b2c660cf1" "1cc69add80a116d4ceee9ab043bb3d372f034586da54c9677d0fff99231e5eb9" "bd6e539f641b33aeaf21ae51266bd9dfd6c1f2d550d109192e1c678b440242ad" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark)
(add-to-list 'default-frame-alist '(alpha 95 95))

;; --------------------------------------------------------
;; nice little alternative visual bell; Miles Bader <miles /at/ gnu.org>
(defcustom echo-area-bell-string "*DING* " ;"♪"
  "Message displayed in mode-line by `echo-area-bell' function."
  :group 'user)
(defcustom echo-area-bell-delay 0.1
  "Number of seconds `echo-area-bell' displays its message."
  :group 'user)
;; internal variables
(defvar echo-area-bell-cached-string nil)
(defvar echo-area-bell-propertized-string nil)
(defun echo-area-bell ()
  "Briefly display a highlighted message in the echo-area.
    The string displayed is the value of `echo-area-bell-string',
    with a red background; the background highlighting extends to the
    right margin.  The string is displayed for `echo-area-bell-delay'
    seconds.
    This function is intended to be used as a value of `ring-bell-function'."
  (unless (equal echo-area-bell-string echo-area-bell-cached-string)
    (setq echo-area-bell-propertized-string
          (propertize
           (concat
            (propertize
             "x"
             'display
             `(space :align-to (- right ,(+ 2 (length echo-area-bell-string)))))
            echo-area-bell-string)
           'face '(:background "red")))
    (setq echo-area-bell-cached-string echo-area-bell-string))
  (message echo-area-bell-propertized-string)
  (sit-for echo-area-bell-delay)
  (message ""))
(setq ring-bell-function 'echo-area-bell)

;; Enable flycheck for all files
(add-hook 'find-file-hook 'flycheck-mode)

;; Setting rbenv path
(setenv "PATH" (concat  "/opt/boxen/rbenv/shims:"  "/opt/boxen/rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat  "/opt/boxen/rbenv/shims") (cons (concat  "/opt/boxen/rbenv/bin") exec-path)))

;; org-mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/Dropbox/todo/innova.org"
                             "~/Dropbox/todo/personal.org"))

(setq org-default-notes-file "~/Dropbox/todo/innova.org")
(define-key global-map "\C-co" 'org-capture)
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/Dropbox/todo/innova.org" "Inbox")
         "* TODO %?\n  %i\n  %a")))

(eval-after-load 'ruby-mode
  '(progn
     ;; rcodetools
     (require 'rcodetools)
     (define-key ruby-mode-map (kbd "C-c C-c") 'xmp))
  )

(define-key global-map (kbd "C-;") 'comment-dwim)

;; F12 toggles fullscreen mode
(global-set-key [f12] 'ns-toggle-fullscreen)

(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
