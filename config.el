;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Load other config files such as keybindings and other configs
(load! "custom.el")                                      ; Custom theme stuff
(load! "+bindings.el")                                   ; Load my custom key bindings bindings
(load! "+org.el")                                        ; Load my custom org settings
(load! "+private.el")                                    ; private configs
(load! "+dashboard.el")                                  ; Edit the doom dashboard
;; (load! "+irc.el")                                     ; Load my irc settings for Circe settings
;; (load! "+rss.el")                                     ; Load my RSS Feeds settings

;; These don't follow the typical file convention
(projectile-add-known-project "~/.local/writings")       ; My LaTeX Writings
(projectile-add-known-project "~/.local/notes")          ; My Org and Markdown Notes

;; Settings for basic Doom Emacs things
(setq projectile-project-search-path                     ; All Coding related Projects denoted by the $CODE evironment variable. Preferably a XDG directory suck as `$HOME/.local/code/`
      '( "$CODE/asm/"                                    ; All Assembly Projects
         "$CODE/C/"                                      ; All C Projects
         "$CODE/lisp/common-lisp/"                       ; All Common Lisp Related Projects
         "$CODE/lisp/elisp/"                             ; All Emacs Lisp Related Projects
         "$CODE/lisp/scheme/"                            ; All Scheme Related Projects
         "$CODE/crystal/"                                ; All Crystal Projects
         "$CODE/misc/"                                   ; Misc. Projects such as snippets and small tests
         "$CODE/php/"                                    ; All PHP Projects
         "$CODE/shell/"                                  ; All shell scripts
         "$CODE/tex/")                                   ; All TeX/LaTeX Projects
      projectile-sort-order 'recentf                     ; Sort projects by recently opened and worked on
      display-line-numbers-type t                        ; I like seeing line numbers, what can I say?
      org-directory "~/.local/notes/org/")               ; Org Directory, in the .notes dir where I like all my notes

;; Emacs fonts
(setq doom-font
      (font-spec :family "Liberation Mono"               ; Linux Liberation Mono Font
                 :size 16))                              ; Font-Size

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
  (load-theme 'doom-zenburn t)                           ; My preferred theme at the moment
  (doom-themes-visual-bell-config)
  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; Extras
(setq-default
 delete-by-moving-to-trash t                             ; Delete files to trash
 tab-width 2                                             ; Set width for tabs
 uniquify-buffer-name-style 'forward                     ; Uniquify buffer names
 window-combination-resize t                             ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                                     ; Stretch cursor to the glyph width

(setq undo-limit 80000000                                ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                              ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                                ; Nobody likes to loose work, I certainly don't
      inhibit-compacting-font-caches t                   ; When there are lots of glyphs, keep them in memory
      truncate-string-ellipsis "…"                       ; Unicode ellispis are nicer than "...", and also save /precious/ space
      line-spacing 0)                                    ; seems like a nice line spacing balance.
