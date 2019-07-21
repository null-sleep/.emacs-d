;; -*- coding: utf-8 -*-
;; -*- lexical-binding: t -*-

;; Set default font
(set-face-attribute 'default t
                    :family "Terminus-9"
                    :height 170
                    :weight 'normal
                    :width 'normal)

(setq-default cursor-type 'bar) ;; Change how the cursor looks
(column-number-mode) ;; Show line number and column in mode bar
(show-paren-mode 1) ;; Visually match all kinds of parens
;; (global-hl-line-mode 1) ;; Highlight the line you are currently on

;; Keeps all window configs in buffer for easy access
(winner-mode t) ;; C-c [left_arrow | right_arrow]
;; Easy and directed navigation of windows instead of C-x o
;; https://www.emacswiki.org/emacs/WindMove
(windmove-default-keybindings) ;; Shift + Arrow Keys
(provide 'editor)
