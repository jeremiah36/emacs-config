;; -*- lexical-binding: t; -*-

;; Set up package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Set font
(set-face-attribute 'default nil :font "Fira Code-12")

;; Basic UI tweaks
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(global-display-line-numbers-mode 1)

;; Performance tweaks
(setq package-quickstart t)

;; Install and configure a theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-one t))

;; Install and configure which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; Git related things
;; Git gutter to show changes in the buffer
(use-package diff-hl
  :ensure t
  :config
  (global-diff-hl-mode 1))

;; Projectile for project management (works well with Git repos)
(use-package projectile
  :ensure t
  :config
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~/")) ;; Search for projects in home directory
  (setq projectile-enable-caching t)) ;; Cache for faster project switching

;; Magit for Git integration
(use-package magit
  :ensure t
  :bind (("C-c g" . magit-status)))

;; Dired tweaks for better file navigation
(use-package dired
  :ensure nil ;; Built-in package
  :config
  (setq dired-listing-switches "-alh") ;; Human-readable file sizes
  (add-hook 'dired-mode-hook 'dired-hide-details-mode)) ;; Hide details by default
;; Save customizations to a seperate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file)
  (load custom-file))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(doom-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
