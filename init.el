;; -*- coding: utf-8 -*-
;; -*- lexical-binding: t -*-
(setq debug-on-error t) ;; Produce backtraces when errors occur
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *is-a-mac* (eq system-type 'darwin))

;; Adjust garbage collection thresholds
(setq gc-cons-threshold 100000000)

;; Setup customization file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

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

(require 'init-utils)
(require 'init-exec-path) ;; Set up $PATH

