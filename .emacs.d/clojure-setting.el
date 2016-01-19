(require 'cider)
(require 'clojure-mode)
(add-hook 'clojure-mode-hook 'cider-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq nrepl-buffer-name-show-port t)

(require 'ac-cider)
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
          (add-to-list 'ac-modes 'cider-repl-mode)))

(define-key cider-repl-mode-map "\C-j" 'next-line)
(define-key cider-repl-mode-map "\C-n" 'newline-and-indent)
