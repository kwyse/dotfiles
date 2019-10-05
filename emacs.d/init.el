(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(require 'subr-x)

(eval-when-compile
  (require 'use-package))

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package rust-mode
  :init
  (setq rust-format-on-save t))

(add-hook 'rust-mode-hook (lambda() (subword-mode)))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package magit
  :bind ("C-x v" . magit-status))

(use-package markdown-mode
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode))
  :init
  (setq markdown-command "pandoc"))

(add-hook 'markdown-mode-hook (lambda ()
				(markdown-toggle-math)
				(flyspell-mode)
				(abbrev-mode)
				(setq fill-column 100)
				(auto-fill-mode t)))

(use-package helm
  :config
  (setq helm-google-suggest-search-url "https://duckduckgo.com/?q=%s"))

(use-package pdf-tools
  :init
  (pdf-tools-install))

(use-package password-store)

(use-package haskell-mode)

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$")

(add-hook 'scala-mode-hook
	  (lambda ()
	    (add-hook 'before-save-hook 'lsp-format-buffer nil 'make-it-local)
	    (projectile-mode +1)))

(use-package flycheck
  :hook (scala-mode . flycheck-mode)
  :hook (rust-mode . flycheck-mode))

(use-package lsp-mode
  :hook (scala-mode . lsp)
  :hook (rust-mode . lsp)
  :config (setq lsp-prefer-flymake nil
		lsp-enable-snippet nil))

(use-package lsp-ui)

(use-package company-lsp)

(use-package projectile
  :bind (("C-c p" . projectile-command-map)))

(add-hook 'git-commit-setup-hook 'git-commit-turn-on-flyspell)

(setq org-special-ctrl-a/e t
      org-special-ctrl-k t
      org-ctrl-k-protect-subtree 'error)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (haskell . t)))

(use-package atom-one-dark-theme)

(defun get-shell-path () (shell-command-to-string "$SHELL --login -c 'echo ${PATH}'"))
(defun trim-trailing-space (string) (replace-regexp-in-string "[\t\s\n]+$" "" string))
(defun not-empty (string) (> (length string) 0))
(defun split-path-string (path) (seq-filter #'not-empty (split-string path ":")))
(defun join-path-list (paths) (string-join paths ":"))
(defun normalize-path (path) (split-path-string (trim-trailing-space path)))
(defun combine-env-paths ()
  (seq-map #'normalize-path (list (getenv "PATH") (get-shell-path))))
(defun combine-env-and-exec-paths ()
  (apply #'append (append (combine-env-paths) (list exec-path))))
(defun get-unique-full-path () (seq-uniq (combine-env-and-exec-paths)))

(defun fix-path ()
  (let ((paths (get-unique-full-path)))
  (setenv "PATH" (join-path-list paths))
  (setq exec-path paths)))

(fix-path)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(menu-bar-no-scroll-bar)
(column-number-mode)
(tool-bar-mode 0)

(when (member "Inconsolata" (font-family-list)) (set-frame-font "Inconsolata 13" nil t))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)
(setq shift-select-mode nil)

(setq tramp-default-method "ssh")
(setq apropos-sort-by-scores t)
(setq ispell-program-name "aspell")
(setq ido-enable-flex-matching t)
(ido-mode "both")

(windmove-default-keybindings)
(global-set-key (kbd "C-x w k") 'windmove-up)
(global-set-key (kbd "C-x w j") 'windmove-down)
(global-set-key (kbd "C-x w h") 'windmove-left)
(global-set-key (kbd "C-x w l") 'windmove-right)

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c b") 'org-switchb)

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(global-visual-line-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(ert-deftest trim-trailing-space-test ()
  (should (equal (trim-trailing-space "") ""))
  (should (equal (trim-trailing-space "string") "string"))
  (should (equal (trim-trailing-space "string\n") "string"))
  (should (equal (trim-trailing-space "string \t\n ") "string")))

(ert-deftest split-path-string-test ()
  (should (equal (split-path-string "") nil))
  (should (equal (split-path-string "foo") '("foo")))
  (should (equal (split-path-string "foo:") '("foo")))
  (should (equal (split-path-string "foo:bar") '("foo" "bar"))))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun sudo()
  "Use TRAMP to access the current buffer as the root user"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
	     buffer-file-name))))

(require 'dired-x)
