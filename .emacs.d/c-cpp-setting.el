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
