;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Load other config files such as keybindings
(load! "custom.el")                                      ; Custom theme stuff
(load! "+bindings.el")                                   ; Load my custom key bindings bindings
(load! "+org.el")                                        ; Load my custom org settings
;; (load! "+irc.el")                                        ; Load my irc settings for Circe settings
;; (load! "+rss.el")                                        ; Load my RSS Feeds settings

;; These don't follow the typical file convention
(projectile-add-known-project "~/.local/writings")       ; My LaTeX Writings
(projectile-add-known-project "~/.local/notes")          ; My Org and Markdown Notes

;; Settings for basic Doom Emacs things
(setq projectile-project-search-path                     ; All Coding related Projects denoted by the $CODE evironment variable. Preferably a XDG directory suck as `$HOME/.local/code/`
      '( "$CODE/asm/"                                    ; All Assembly Projects
         "$CODE/C/"                                      ; All C Projects
         "$CODE/lisp/"                                   ; All Lisp-Related Projects
         "$CODE/crystal/"                                ; All Crystal Projects
         "$CODE/misc/"                                   ; Misc. Projects such as snippets and small tests
         "$CODE/php/"                                    ; All PHP Projects
         "$CODE/ruby/"                                   ; All Ruby and Rails Projects
         "$CODE/shell/"                                  ; All shell scripts
         "$CODE/tex/")                                   ; All TeX/LaTeX Projects
      projectile-sort-order 'recentf                     ; Sort projects by recently opened and worked on
      display-line-numbers-type t                        ; I like seeing line numbers, what can I say?
      org-directory "~/.local/notes/org/")               ; Org Directory, in the .notes dir where I like all my notes

;; Emacs fonts
(setq doom-font (font-spec                               ; Customizing Doom Emacs' Fonts
                 :family "Liberation Mono"               ; Linux Liberation Mono Font
                 :size 18))                              ; Font-Size

;; Aspell/ispell stuff to fix errors for some
(setq ispell-program-name "aspell"
      ispell-dictionary "english")

;; GNU TRAMP Configuration
(setq tramp-default-method "ssh"                         ; Default to SSH, that's what I primarily use
      tramp-terminal-type "tramp"                        ; Let other terminal know what client I'm connecting with (might need to configure server)
      tramp-auto-save-directory "$XDG_CACHE_HOME/tramp/" ; Send Tramp info into XDG Cache directory on machine
      tramp-chunksize 2000)                              ; Resonable Chunk size for speed and disk space in mind

;;; Activate Packages defined in packages.el
(use-package doom-themes                                 ; Doom themes, so I can have my nice themes :)
  :config
  (setq doom-themes-enable-bold t                        ; if nil, bold is universally disabled
        doom-themes-enable-italic t)                     ; if nil, italics is universally disabled
  (load-theme 'doom-outrun-electric t)
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))
