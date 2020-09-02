;;; ~/.doom.d/org.el -*- lexical-binding: t; -*-

;; Org-Roam
(use-package org-roam
      :ensure t
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/.local/notes/org/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-graph-show))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))
              (("C-c n I" . org-roam-insert-immediate))))

;; Org Calendar Mode
(defun my-open-calendar ()
  (interactive)
  (cfw:open-calendar-buffer
   :contents-sources
   (list
    ;; (cfw:howm-create-source "Blue")  ; howm source
    ;; (cfw:cal-create-source "Orange") ; ical sources
    (cfw:org-create-source "Purple"))))  ; orgmode source
;;;###autoload
(defun cfw:open-org-calendar-with-cal1 ()
  (interactive)
  (let ((org-agenda-files '("~/.local/notes/org/" "~/Documents/Personal/")))
    (call-interactively #'+calendar/open-calendar)))

;; Latex stuff
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

(add-to-list 'org-latex-classes
             '("article" "\\documentclass[9pt,a4paper]{article}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{fixltx2e}
\\usepackage{graphicx}
\\usepackage{longtable}
\\usepackage{float}
\\usepackage{wrapfig}
\\usepackage{rotating}
\\usepackage[normalem]{ulem}
\\usepackage{amsmath}
\\usepackage{textcomp}
\\usepackage{marvosym}
\\usepackage{wasysym}
\\usepackage{amssymb}
\\usepackage{hyperref}
\\usepackage{mathpazo}
\\usepackage{color}
\\usepackage{enumerate}
\\usepackage{geometry}
\\geometry{a4paper,left=43mm,right=43mm,top=51mm,bottom=17mm}
\\definecolor{bg}{rgb}{0.95,0.95,0.95}
\\addtolength{\\oddsidemargin}{-1in}
\\addtolength{\\evensidemargin}{-0.5in}
\\addtolength{\\textwidth}{2in}
\\addtolength{\\topmargin}{-1.5in}
\\addtolength{\\textheight}{1.0in}
\\tolerance=1000
  [NO-DEFAULT-PACKAGES]
  [PACKAGES]
  [EXTRA]
\\linespread{1.1}
\\hypersetup{pdfborder=0 0 0}"
  ("\\section{%s}" . "\\section*{%s}")
  ("\\subsection{%s}" . "\\subsection*{%s}")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")))
