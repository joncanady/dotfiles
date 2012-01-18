(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(package-refresh-contents)


(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-bindings scpaste
                                  markdown-mode yaml-mode rvm))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(rvm-use-default)


