(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package rust-mode
  :init
  (setq rust-format-on-save t))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package atom-one-dark-theme)

(defun get-shell-path-contents ()
  "Returns the contents of $PATH based on the user's shell"
  (replace-regexp-in-string "\n+$" "" (shell-command-to-string "$SHELL -c 'echo $PATH'")))

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(menu-bar-no-scroll-bar)
(column-number-mode)
(tool-bar-mode 0)

(setenv "PATH" (get-shell-path-contents))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(setq exec-path (append exec-path (split-string (getenv "PATH") ":")))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
