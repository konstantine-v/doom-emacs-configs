;;; ~/.doom.d/org.el -*- lexical-binding: t; -*-

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
