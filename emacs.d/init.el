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

(setq exec-path (append exec-path '("/Users/krishanwyse/.cargo/bin")))

; Packages
(setq use-package-always-ensure t)

; Common packages
(use-package hlinum)
(use-package linum-relative
  :config
  (linum-relative-global-mode)
  (setq linum-relative-format " %2s ")
  (setq linum-relative-current-symbol ""))
(use-package helm
  :bind ("M-x" . helm-M-x))
(use-package company
  :config
  (add-hook 'c-mode-hook 'company-mode-on)
  (add-hook 'c++-mode-hook 'company-mode-on)
  ;; (add-hook 'rust-mode-hook 'company-mode-on)
  (use-package company-quickhelp
    :config
    (add-hook 'c-mode-hook 'company-quickhelp-mode 1)))
    ;; (add-hook 'rust-mode-hook 'company-quickhelp-mode 1)))
(use-package flycheck
  :config
  (add-hook 'c-mode-hook 'global-flycheck-mode)
  (add-hook 'c++-mode-hook 'global-flycheck-mode)
  (add-hook 'rust-mode-hook 'global-flycheck-mode))
(use-package magit
  :bind ("C-x g" . magit-status))
(use-package evil
  :config
  (evil-mode t)
  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
  (use-package evil-commentary
    :config
    (evil-commentary-mode t)))
(use-package base16-theme
  :init
  (load-theme 'base16-flat t))
(use-package projectile
  :init
  (projectile-global-mode)
  (use-package helm-projectile
    :init
    (helm-projectile-on)))
(use-package golden-ratio
  :config
  (golden-ratio-mode 1))
(use-package exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

; C packages
(use-package irony
  :mode ("\\.c\\'" . c-mode)
  :mode ("\\.h\\'" . c-mode)
  :mode ("\\.cpp\\'" . c++-mode)
  :mode ("\\.hpp\\'" . c++-mode)
  :config
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (defun my-irony-mode-hook ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-irony-mode-hook)
  (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
  (company-mode)
  (company-quickhelp-mode 1)
  (setq company-tooltip-align-annotations t
	company-minimum-prefix-length 1
	company-idle-delay 0.1)
  (use-package company-irony
    :config
    (add-to-list 'company-backend 'company-irony))
  (use-package company-c-headers
    :config
    ; (add-to-list 'company-c-headers-path-system (getenv "CPP_VERSION")))
    (add-to-list 'company-backends 'company-c-headers))
  (use-package flycheck-irony
    :config
    '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))

; Rust packages
(use-package rust-mode
  :mode ("\\.rs\\'" . rust-mode)
  :config
  (add-hook 'rust-mode-hook #'company-quickhelp-mode t)
  (use-package cargo
    :init
    (add-hook 'rust-mode-hook 'cargo-minor-mode))
  (use-package flycheck-rust
    :config
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  (use-package racer
    :init
    (setq racer-rust-src-path (getenv "RUST_SRC_PATH"))
    (add-hook 'rust-mode-hook #'racer-mode)
    (add-hook 'racer-mode-hook #'eldoc-mode)
    (add-hook 'racer-mode-hook #'company-mode)
    (company-quickhelp-mode 1)
    (define-key rust-mode-map (kbd "TAB") #'company-indent-or-complete-common)
    (setq company-tooltip-align-annotations t
          company-minimum-prefix-length 1
          company-idle-delay 0.1)))

; Other language packages
(use-package markdown-mode
  :mode ("\\.md\\'" . markdown-mode))
(use-package web-mode
  :mode ("\\.hbs\\'" . web-mode)
  :mode ("\\.scss\\'" . web-mode)
  :config
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))

(setq c-basic-style "k&r"
      c-basic-offset 4)

(add-hook 'java-mode-hook 'subword-mode)
(setq gdb-many-windows t
      gdb-show-main t)

(provide 'init)
;;; init.el ends here
