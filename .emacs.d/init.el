(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq load-path
      (append '(
                "~/dotfiles/.emacs.d"
                ) load-path))

(load-theme 'manoj-dark t)

(setq inhibit-startup-message t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq delete-auto-save-files t)


(global-linum-mode t)

(setq linum-format "%4d|")

(setq-default tab-width 2 indent-tabs-mode nil)

(fset 'yes-or-no-p 'y-or-n-p)

;;keybind
(global-set-key "\C-h" 'backward-char)
(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)
(global-set-key "\C-l" 'forward-char)
(global-set-key "\C-n" 'newline-and-indent)
(global-set-key "\C-o" 'kill-line)

(load "window")

;;package
(require 'package)
(require 'cl)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(defvar installing-package-list
  '(
    ;;auto-complete
    auto-complete popup popwin
    ;;snippet
    yasnippet
    ;;c/c++
    auto-complete-c-headers
    ;;common-lisp
    slime ac-slime
    ;;clojure
    cider clojure-mode ac-cider
    ;;color
    rainbow-delimiters
    ;;window
    neotree hiwin
    ;;interface
    helm magit
    ))
(let ((not-installed (loop for x in installing-package-list
                           when (not (package-installed-p x))
                           collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
              (package-install pkg))))

;;generic-x
(require 'generic-x)

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")

;;yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;;cc-mode
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          (lambda()
            (setq c-default-style "java")
            (setq indent-tabs-mode nil)
            (setq c-basic-offset 2)
            ))
(add-to-list 'auto-mode-alist '("\\.h\\' " . c++-mode))

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

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

;;popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

;;clojure
(load "clojure-setting")

;;rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;;using stronger colors
(require 'cl-lib)
(require 'color)
(defun rainbow-delimiters-using-stronger-colors ()
  (interactive)
  (cl-loop
   for index from 1 to rainbow-delimiters-max-face-count
   do
   (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
     (cl-callf color-saturate-name (face-foreground face) 90))))

;;neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle) 
(setq neo-show-hidden-files t)
(setq neo-keymap-style 'concise)
(setq neo-smart-open t)
(when neo-persist-show
  (add-hook 'popwin:before-popup-hook
            (lambda () (setq neo-persist-show nil)))
  (add-hook 'popwin:after-popup-hook
            (lambda () (setq neo-persist-show t))))

;;hiwin
;;(require 'hiwin)
;;(hiwin-activate)
;;(set-face-background 'hiwin-face "gray20")

;;helm
(require 'helm-config)
(helm-mode 1)

;;magit
(require 'magit)
