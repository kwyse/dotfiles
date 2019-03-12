(global-display-line-numbers-mode)

(package-initialize)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(setq package-selected-packages
      '(material-theme))

(load-theme 'material t)
