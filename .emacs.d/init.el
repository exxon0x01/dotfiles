(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(load-theme 'wheatgrass t)

(setq inhibit-startup-message t)

(setq make-backup-files nil)

(setq auto-save-default nil)

(setq delete-auto-save-files t)

(setq-default tab-width 4 indent-tabs-mode nil)

(global-linum-mode t)
(setq linum-format "%4d ")

(fset 'yes-or-no-p 'y-or-n-p)

;;keybind
(global-set-key "\C-h" 'backward-char)
(global-set-key "\C-j" 'next-line)
(global-set-key "\C-k" 'previous-line)
(global-set-key "\C-l" 'forward-char)
(global-set-key "\C-n" 'newline-and-indent)
(global-set-key "\C-o" 'kill-line)

(require 'generic-x)

;;package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(if (not (file-directory-p "~/.emacs.d/elpa")) (package-refresh-contents))

(defvar my/favorite-packages
    '(
      ;;auto-complete
      auto-complete popup auto-complete-c-headers
      ;;slime
      slime ac-slime
      ))
(dolist (package my/favorite-packages)
    (unless (package-installed-p package)
          (package-install package)))

;;auto-complete
(require 'auto-complete-config)
(ac-config-default)
(ac-set-trigger-key "TAB")

;;cc-mode
(require 'cc-mode)
(add-hook 'c-mode-common-hook
          (lambda()
            (setq c-default-style "k&r")
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
(setq slime-net-coding-system 'utf-8-unix)
(require 'slime)
(slime-setup)

(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
