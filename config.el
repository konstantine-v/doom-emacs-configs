;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Load other config files such as keybindings
(load! "+bindings.el")                                   ; Load my custom key bindings bindings
(load! "+org.el")                                        ; Load my custom org settings
(load! "+irc.el")                                        ; Load my irc settings for Circe settings
(load! "+rss.el")                                        ; Load my RSS Feeds settings
(load! "custom.el")                                      ; Custom theme stuff
(load! "secret.el")                                      ; Secret stuff not to be commited

;; These don't follow the typical file convention
(projectile-add-known-project "~/.local/writings")       ; My LaTeX Writings
(projectile-add-known-project "~/.local/notes")          ; My Org and Markdown Notes

;; Settings for basic Doom Emacs things
(setq projectile-project-search-path                     ; All the code related stuff that I work on
      '( "~/Code/crystal"                                ; All Crystal Projects
         "~/Code/_sites"                                 ; All SSG Sites
         "~/Code/C"                                      ; All C Projects
         "~/Code/clisp"                                  ; All Common Lisp Projects
         "~/Code/cloj"                                   ; All Clojure Projects
         "~/Code/ruby"                                   ; All Ruby and Rails Projects
         "~/Code/php"                                    ; All PHP/Laravel Projects
         "~/Code/js"                                     ; All  Projects
         "~/Code/tex"                                    ; All TeX/LaTeX Projects
         "~/Code/misc"                                   ; Misc. Projects such as snippets and small tests
         "~/Code/shell")                                 ; All shell scripts
      projectile-sort-order 'recentf                     ; Sort projects by recently opened and worked on
      doom-font (font-spec :family "ProggyCleanTTSZBP" :size 16) ; Proggy font ftw, pretty universal for all screen types
      display-line-numbers-type t                        ; I like seeing line numbers, what can I say?
      org-directory "~/.local/notes/org/")                     ; Org Directory, in the .notes dir where I like all my notes

;; Aspell/ispell stuff to fix errors for some
(setq ispell-program-name "aspell"
      ispell-dictionary "english")

;; GNU TRAMP Config
(setq tramp-default-method "ssh"                         ; Default to SSH, that's what I primarily use
      tramp-terminal-type "tramp"                        ; Let other terminal know what client I'm connecting with (might need to configure server)
      tramp-auto-save-directory "~/.tramp/"
      tramp-chunksize 2000)

;;; Activate Packages defined in packages.el
;; Rtags support, for gcc and c projects mostly I believe
(use-package! rtags)

;; Doom themes, so I can have my nice themes :)
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t                        ; if nil, bold is universally disabled
        doom-themes-enable-italic t)                     ; if nil, italics is universally disabled
  (load-theme 'doom-spacegrey t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'    ; use this for
;;   presentations or streaming.

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.
