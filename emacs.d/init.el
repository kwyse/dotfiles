; init.el

; Package initialization
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  (add-to-list 'package-archives
	       '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

; Configuration
(menu-bar-mode 0)
(column-number-mode 1)
(setq version-control 1)
(setq backup-directory-alist (quote ((".*" . "~/.backups/emacs/"))))

; Packages
(use-package monokai-theme :ensure t)
(use-package hlinum :ensure t)
(use-package linum-relative :ensure t
  :config
    (linum-relative-global-mode)
    (setq linum-relative-format " %2s ")
    (setq linum-relative-current-symbol ""))
