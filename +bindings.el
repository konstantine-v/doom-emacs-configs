;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; Global Keys
(global-set-key [f7] 'eshell) ; eshell is nice and soes what I need
(global-set-key [f8] 'dired)  ; dired, works well with eshell, better than neotree

;; Leader key
(map! :leader
      :desc "M-x"                       "SPC" #'execute-extended-command
      :desc "Org agenda"                  "a" #'org-agenda
      :desc "Org agenda today"            "A" (lambda () (interactive) (org-agenda nil "a"))
      :desc "Org Journal"                 "J" (lambda () (interactive) (org-capture nil "j"))
      :desc "Org capture"                 "C" #'org-capture
      :desc "Expand region"               "<" #'er/expand-region
      :desc "Toggle popup window"         "`" #'+popup/toggle)

;; Prefix map
(map! :leader
      (:prefix ("b" . "buffer")         ; Emacs Buffer Bindings
        :desc "Previous buffer"         "TAB" #'previous-buffer
        :desc "Switch buffer"             "b" #'switch-to-buffer
        :desc "Delete buffer"             "d" #'kill-this-buffer ; SPC-b-d makes more sense than SPC-b-d, but both are still there
        :desc "Recent files"              "r" #'recentf-open-files
        :desc "Switch to home"            "h" #'+doom-dashboard/open)) ; Reference doc for me to find info regarding my machiness' software

;; Keybinds for Webpaste.el
(map! :leader
      (:prefix ("k" . "Webpaste")         ; Emacs Buffer Bindings
        :desc "Paste Buffer"          "TAB" #'webpaste-paste-buffer
        :desc "Paste Region"            "b" #'webpaste-paste-buffer
        :desc "Paste Buffer or Region"  "d" #'webpaste-paste-buffer))
