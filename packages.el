;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; MELPA Packages To Use
(package! doom-themes) ; Fance themes for Emacs/Doom
(package! rtags)       ; Rtags support, for gcc and c projects mostly I believe
(package! org-roam)    ; My favorite way to organize org notes
(package! theme-magic) ; Change system theme to whatever emacs theme is, works best with tiling wm
(package! webpaste)    ; Paste buffer and lines over to online paste service
(package! elpher)      ; Gemini Client for Emacs
(package! rg)          ; Search based on ripgrep
(package! csv-mode)    ; Look at csv files nicely
(package! tracking)    ; Better tracking of buffer activities
(package! cl-libify)   ; Alternative to cl package - "package cl is depricated"
(package! markdown-mode)
(package! circe)    ; The best IRC package for Emacs

;; Doom Theme configs
(use-package doom-themes :config         ; Doom themes, so I can have my nice themes :)
  (setq doom-themes-enable-bold t        ; if nil, bold is universally disabled
        doom-themes-enable-italic t)     ; if nil, italics is universally disabled
  (load-theme 'doom-outrun-electric t)
  (doom-themes-visual-bell-config))

;; Webpaste Configs
(use-package webpaste :config
  (progn
    (setq webpaste-provider-priority
          '("ix.io" "dpaste.org"))
    (setq webpaste-paste-raw-text t)     ;Only paste raw pastes
    (setq webpaste-paste-confirmation t) ;Require confirmation before doing paste
    (setq webpaste-max-retries 5)))      ;Max out at 5 retries
