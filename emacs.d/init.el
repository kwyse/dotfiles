(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative) ; TODO: Needs to be hooked into each file load?

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(menu-bar-no-scroll-bar)
(column-number-mode)
(tool-bar-mode 0)

(setq next-screen-context-lines 4)
(setq require-final-newline t)
(setq make-backup-files nil)
(setq auto-save-default 0)
(setq org-startup-indented 1)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(global-set-key (kbd "C-S-j") 'windmove-down)
(global-set-key (kbd "C-S-k") 'windmove-up)
(global-set-key (kbd "C-S-h") 'windmove-left)
(global-set-key (kbd "C-S-l") 'windmove-right)

(package-initialize)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package exec-path-from-shell
  :config (when (memq window-system '(mac ns x))
	    (exec-path-from-shell-initialize)))

(use-package flycheck
  :hook (prog-mode . flycheck-mode))

(use-package flycheck-rust
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(use-package cargo
  :hook rust-mode)

(use-package flycheck-inline
  :hook (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

(use-package company
  :hook (rust-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1))

(use-package magit
  :config (global-set-key (kbd "C-x g") 'magit-status))

(setq package-selected-packages
      '(atom-one-dark-ptheme
	use-package
	rust-mode
	ensime))

(load-theme 'atom-one-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/todo.org")))
 '(package-selected-packages
   (quote
    (eglot flycheck-inline exec-path-from-shell flycheck-rust flycheck atom-one-dark-ptheme use-package magit rust-mode ensime cargo)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
