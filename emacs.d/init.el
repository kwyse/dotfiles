;;; package -- Summary
;;;
;;; Commentary:
;;; init.el file
;;;
;;; Code:
;;; [nothing]
;;;

; Package initialization
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

; Configuration
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(column-number-mode t)
(setq version-control t)
(setq backup-directory-alist `((".*" . "~/.backups/emacs/")))
(auto-save-mode -1)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(set-frame-font "Inconsolata Bold 11")
(add-to-list 'default-frame-alist '(font . "Inconsolata-11:bold"))
(add-to-list 'default-frame-alist '(alpha 95 50))

; Packages
(setq use-package-always-ensure t)
(use-package hlinum)
(use-package linum-relative
  :config
  (linum-relative-global-mode)
  (setq linum-relative-format " %2s ")
  (setq linum-relative-current-symbol ""))
(use-package helm
  :config
  (global-set-key (kbd "M-x") 'helm-M-x)
  (helm-mode 1))
(use-package company
  :config
  (add-hook 'c-mode-hook 'company-mode-on)
  (add-hook 'c++-mode-hook 'company-mode-on))
(use-package company-quickhelp
  :config
  (add-hook 'c-mode-hook 'company-quickhelp-mode t)
  (add-hook 'rust-mode-hook 'company-quickhelp-mode t))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
;  (add-to-list 'company-c-headers-path-system (getenv "CPP_VERSION")))
(use-package company-irony :defer t)
(use-package company-racer)
(use-package racer

  :config
  (setq racer-cmd (getenv "RACER_BIN_PATH")
	racer-rust-src-path (getenv "RUST_SRC_PATH")))
(use-package view
  :config
  (global-set-key "\C-v" 'View-scroll-half-page-forward)
  (global-set-key "\M-v" 'View-scroll-half-page-backward))
(use-package flycheck
  :config
  (global-flycheck-mode))
(use-package flycheck-rust)
(use-package rust-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook #'company-quickhelp-mode t)
  (global-set-key (kbd "TAB") #'company-indent-or-complete-common)
  (setq company-tooltip-align-annotations t))
(use-package geiser)
(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))
(use-package irony
  :defer t
  :init
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  :config
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))
(use-package evil)
(use-package base16-theme
  :init
  (load-theme 'base16-flat-dark t))

(add-hook 'java-mode-hook 'subword-mode)
(setq gdb-many-windows t
      gdb-show-main t)

(provide 'init)
;;; init.el ends here
