;;slime
(setq inferior-lisp-program "sbcl")

;;slime-setting for cygwin
(when (eq system-type 'cygwin)
  (defun slime-to-lisp-translation (filename)
    (replace-regexp-in-string
     "\n" "" (shell-command-to-string
              (format "cygpath.exe --windows %s" filename))))
  (defun lisp-to-slime-translation (filename)
    (replace-regexp-in-string
     "\n" "" (shell-command-to-string
              (format "cygpath.exe --unix %s filename"))))
  (setq slime-to-lisp-filename-function 'slime-to-lisp-translation)
  (setq lisp-to-slime-filename-function 'lisp-to-slime-translation))
;;

(setq slime-net-coding-system 'utf-8-unix)
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner))

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
