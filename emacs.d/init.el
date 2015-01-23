;;; package --- Summary
;;; Commentary:
;;; Code:



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
(setq Tex-PDF-mode t)
(setq LaTeX-command-style '(("" "%(PDF)%(latex) -shell-escape %S%(PDFout)")))

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/.cask/dict")
(ac-config-default)
(setq ac-ignore-case nil)

(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/../include/c++/v1"))

(add-hook 'c-mode-hook 'my:ac-c-headers-init)
(add-hook 'c++-mode-hook 'my:ac-c-headers-init)

(define-key global-map (kbd "C-;") 'iedit-mode)

(add-hook 'after-init-hook #'global-flycheck-mode)
(defun my:flycheck-google-init ()
  (require 'flycheck-google-cpplint)
  (flycheck-google-cpplint-load))
;;(add-hook 'c-mode-hook 'my:flymake-google-init)
;;(add-hook 'c++-mode-hook 'my:flymake-google-init)

(semantic-mode 1)
(defun my:add-semantic-to-auto-complete ()
  (add-to-list 'ac-sources 'ac-source-semantic))
(add-hook 'c-mode-common-hook 'my:add-semantic-to-auto-complete)

(global-ede-mode 1)
(global-semantic-idle-scheduler-mode 1)

(setenv "LD_LIBRARY_PATH" "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/")

(require 'irony)
;; (irony-enable 'ac)
;; (defun my:irony-mode-init ()
;;  (when (member major-mode irony-known-modes)
;;    (irony-mode 1)))
;;(add-hook 'c-mode-hook 'my:irony-mode-init)
;;(add-hook 'c++-mode-hook 'my:irony-mode-init)

(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(provide 'init)
;;; init.el ends here
