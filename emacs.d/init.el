(add-to-list 'default-frame-alist '(font . "Inconsolata Medium" ))
(set-face-attribute 'default t :font "Inconsolata Medium 11")
(set-face-attribute 'default nil :height 110)
(set-default-font "Inconsolata Medium 11")

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default fill-column 80)

(require 'linum-relative)
(linum-on)
(global-linum-mode t)

(require 'solarized-theme)
(load-theme 'solarized-dark t)

(require 'tex)
(setq Tex-PDF-moode t)
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))
