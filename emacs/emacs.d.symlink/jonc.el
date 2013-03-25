;; Setting rbenv path
(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(defun echo-false-comint ()
  (setq comint-process-echoes t))

(add-hook 'comint-mode-hook 'echo-false-comint)

(setq ispell-program-name "/usr/local/bin/ispell")

