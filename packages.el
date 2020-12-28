;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; MELPA Packages Used
;; Package specific Configurations included below

(package! doom-themes)
(package! rtags)    ; Rtags support, for gcc and c projects mostly I believe
(package! org-roam) ; My favorite way to organize org notes
(package! circe)    ; The best IRC package
(package! theme-magic) ; Change system theme to whatever emacs theme is, works best with tiling wms
(package! webpaste)
(package! ansible)
(package! elfeed)

(package! elpher)
(package! csv-mode)
(package! tracking)
(package! rg)
(package! org-roam)
(package! markdown-mode)
(package! cl-libify)

;; Package Configs
;; Doom Theme configs
(use-package doom-themes                                 ; Doom themes, so I can have my nice themes :)
  :config
  (setq doom-themes-enable-bold t                        ; if nil, bold is universally disabled
        doom-themes-enable-italic t)                     ; if nil, italics is universally disabled
  (load-theme 'doom-outrun-electric t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Webpaste Configs
(use-package webpaste
  :config
  (progn
    (setq webpaste-provider-priority
          '("ix.io"
            "dpaste.org"))
    (setq webpaste-paste-raw-text t)            ;Only paste raw pastes
    (setq webpaste-paste-confirmation t)        ;Require confirmation before doing paste
    (setq webpaste-max-retries 5)               ;Max out at 5 retries
  ))
