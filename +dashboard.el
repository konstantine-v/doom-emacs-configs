;;; +dashboard.el -*- lexical-binding: t; -*-
;;; Yak shaving at it's finest

;; Custom icon to replace the Doom scii image
(setq fancy-splash-image "~/Media/Pictures/icons/sel-knights-01.jpg")

;;
(custom-set-faces!
  '(doom-dashboard-banner :foreground "white" :background "black" :weight bold)
  '(doom-dashboard-footer :inherit font-lock-constant-face)
  '(doom-dashboard-loaded :inherit font-lock-warning-face)
  '(doom-dashboard-menu-desc :inherit font-lock-string-face)
  '(doom-dashboard-menu-title :inherit font-lock-function-name-face))

(setq +doom-dashboard-functions
  '(doom-dashboard-widget-banner
    ;; doom-dashboard-widget-loaded
    doom-dashboard-widget-shortmenu
    doom-dashboard-widget-footer))

;; Change the Menu items a bit
(setq +doom-dashboard-menu-sections
  '(("Reload last session"
     :icon (all-the-icons-octicon "history" :face 'doom-dashboard-menu-title)
     :when (cond ((featurep! :ui workspaces)
                  (file-exists-p (expand-file-name persp-auto-save-fname persp-save-dir)))
                 ((require 'desktop nil t)
                  (file-exists-p (desktop-full-file-name))))
     :face (:inherit (doom-dashboard-menu-title bold))
     :action doom/quickload-session)
    ("Open org-agenda"
     :icon (all-the-icons-octicon "calendar" :face 'doom-dashboard-menu-title)
     :when (fboundp 'org-agenda)
     :action org-agenda)
    ;; ("Open Circe"
    ;;  :icon (all-the-icons-octicon "comment-discussion" :face 'doom-dashboard-menu-title)
    ;;  :action circe)
    ("Open Elpher Gemini Browser"
     :icon (all-the-icons-octicon "ruby" :face 'doom-dashboard-menu-title)
     :action elpher)
    ("Open project"
     :icon (all-the-icons-octicon "briefcase" :face 'doom-dashboard-menu-title)
     :action projectile-switch-project)
    ("Jump to bookmark"
     :icon (all-the-icons-octicon "bookmark" :face 'doom-dashboard-menu-title)
     :action bookmark-jump)
    ;; ("Open documentation"
    ;;  :icon (all-the-icons-octicon "book" :face 'doom-dashboard-menu-title)
    ;;  :action doom/help)
    ("Open private configuration"
     :icon (all-the-icons-octicon "tools" :face 'doom-dashboard-menu-title)
     :when (file-directory-p doom-private-dir)
     :action doom/open-private-config)))


;; Change the footer icons to go to what I want
(defun doom-dashboard-widget-footer ()
  (insert
   "\n"
   (+doom-dashboard--center
    (- +doom-dashboard--width 2)
    (with-temp-buffer
      (insert-text-button (or (all-the-icons-material "wb_sunny" :face 'doom-dashboard-footer-icon :height 1.3 :v-adjust -0.15)
                              (propertize "wttr" 'face 'doom-dashboard-footer))
                          'action (lambda (_) (browse-url "https://wttr.in/"))
                          'follow-link t
                          'help-echo "Check the weather - wttr.in")
      (buffer-string)))
    "\n"))
