(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(setq inhibit-startup-message t)

(setq make-backup-files nil)

(setq delete-auto-save-files t)

(setq-default tab-width 4 indent-tabs-mode nil)

(global-linum-mode t)

(fset 'yes-or-no-p 'y-or-n-p)
