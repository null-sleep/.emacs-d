;; -*- coding: utf-8 -*-
;; -*- lexical-binding: t -*-
(setq debug-on-error t) ;; Produce backtraces when errors occur
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *is-a-mac* (eq system-type 'darwin))

(setq gc-cons-threshold (expt 2 24)) ; 16 MiB
;; (setq load-prefer-newer t) ;; Avoid outdated byte-compiled elisp files

;; Keep emacs Custom-settings in separate file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(setq inhibit-startup-screen t)

;; Setup package installation suite
(require 'package)
(setq package-enable-at-startup nil)
;; Unsafe hack till I figure out gnu-tls on osx
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))
(require 'benchmark-init)
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))
(use-package auto-package-update
   :ensure t
   :config
   (setq auto-package-update-delete-old-versions t
         auto-package-update-interval 4)
   (auto-package-update-maybe))

;; (require-package 'diminish)

(load-theme 'wombat) ;; Temporary
(require 'editor)

(benchmark-init/show-durations-tree)
