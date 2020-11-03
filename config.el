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
      '( "~/Code/asm/"                                   ; All Assembly Projects
         "~/Code/C/"                                     ; All C Projects
         "~/Code/clisp/"                                 ; All Common Lisp Projects
         "~/Code/cloj/"                                  ; All Clojure Projects
         "~/Code/crystal/"                               ; All Crystal Projects
         "~/Code/haskell/"                               ; All Haskell Projects
         "~/Code/js/"                                    ; All Javascript Projects
         "~/Code/misc/"                                  ; Misc. Projects such as snippets and small tests
         "~/Code/php/"                                   ; All PHP Projects
         "~/Code/ruby/"                                  ; All Ruby and Rails Projects
         "~/Code/shell/"                                 ; All shell scripts
         "~/Code/tex/"                                   ; All TeX/LaTeX Projects
         "~/Code/_sites/" )                              ; All SSG Sites
      projectile-sort-order 'recentf                     ; Sort projects by recently opened and worked on
      doom-font (font-spec                               ; Customizing Doom Emacs' Fonts
                 :family "ProggyCleanTTSZBP"             ; Proggy font, pretty universal for all screen types
                 :size 16)                               ; Font-Size
      display-line-numbers-type t                        ; I like seeing line numbers, what can I say?
      org-directory "~/.local/notes/org/")               ; Org Directory, in the .notes dir where I like all my notes

;; Aspell/ispell stuff to fix errors for some
(setq ispell-program-name "aspell"
      ispell-dictionary "english")

;; GNU TRAMP Config
(setq tramp-default-method "ssh"                         ; Default to SSH, that's what I primarily use
      tramp-terminal-type "tramp"                        ; Let other terminal know what client I'm connecting with (might need to configure server)
      tramp-auto-save-directory "~/.cache/tramp/"        ; Send Tramp info into XDG Cache directory on machine
      tramp-chunksize 2000)                              ; Resonable Chunk size for speed and disk space in mind

;;; Activate Packages defined in packages.el
(use-package! rtags)                                     ; Rtags support, for gcc and c projects mostly I believe
(use-package doom-themes                                 ; Doom themes, so I can have my nice themes :)
  :config
  (setq doom-themes-enable-bold t                        ; if nil, bold is universally disabled
        doom-themes-enable-italic t)                     ; if nil, italics is universally disabled
  (load-theme 'doom-spacegrey t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
