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
    auto-complete popup
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
    neotree
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

;;c/c++
(load "c-cpp-setting")

;;common lisp
(load "cl-setting")

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

;;helm
(require 'helm-config)
(helm-mode 1)

;;magit
(require 'magit)
