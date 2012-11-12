;;; inf-ruby-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (run-ruby inf-ruby inf-ruby-keys) "inf-ruby" "../../../../../.emacs.d/elpa/inf-ruby-2.2.3/inf-ruby.el"
;;;;;;  "cf4814b6a8112e33d480c4f463825ba3")
;;; Generated autoloads from ../../../../../.emacs.d/elpa/inf-ruby-2.2.3/inf-ruby.el

(autoload 'inf-ruby-keys "inf-ruby" "\
Set local key defs to invoke inf-ruby from ruby-mode.

\(fn)" nil nil)

(autoload 'inf-ruby "inf-ruby" "\
Run an inferior Ruby process in a buffer.
With prefix argument, prompts for which Ruby implementation
\(from the list `inf-ruby-implementations') to use. Runs the
hooks `inf-ruby-mode-hook' (after the `comint-mode-hook' is
run).

\(fn &optional IMPL)" t nil)

(autoload 'run-ruby "inf-ruby" "\
Run an inferior Ruby process, input and output via buffer *ruby*.
If there is a process already running in `*ruby*', switch to that buffer.
With argument, allows you to edit the command line (default is value
of `ruby-program-name').  Runs the hooks `inferior-ruby-mode-hook'
\(after the `comint-mode-hook' is run).
\(Type \\[describe-mode] in the process buffer for a list of commands.)

\(fn &optional COMMAND NAME)" t nil)

(eval-after-load 'ruby-mode '(add-hook 'ruby-mode-hook 'inf-ruby-keys))

;;;***

;;;### (autoloads nil nil ("../../../../../.emacs.d/elpa/inf-ruby-2.2.3/inf-ruby-pkg.el"
;;;;;;  "../../../../../.emacs.d/elpa/inf-ruby-2.2.3/inf-ruby.el")
;;;;;;  (20641 3549 76550 0))

;;;***

(provide 'inf-ruby-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; inf-ruby-autoloads.el ends here
