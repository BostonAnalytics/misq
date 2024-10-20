% misq.cls - MIS Quarterly Class File
\NeedsTeXFormat{LaTeX2e}[2021/06/01]
\ProvidesClass{misq}[2024/10/19 MISQ Manuscript Class]

% Load KOMA-Script article class
\LoadClassWithOptions{scrartcl}

% Options for different modes
\newif\ifpreprint
\newif\ifreview
\newif\iffinal
\newif\ifdoubleblind

\def\@spacingratio{1.0} % Default line spacing

\DeclareOption{preprint}{
  \preprinttrue
  \reviewfalse
  \finalfalse
  \def\@spacingratio{1.0}
}

\DeclareOption{review}{
  \reviewtrue
  \preprinttrue
  \finalfalse
  \def\@spacingratio{1.5}
}

\DeclareOption{final}{
  \finaltrue
  \preprintfalse
  \reviewfalse
  \def\@spacingratio{1.0}
}

\DeclareOption{doubleblind}{
  \doubleblindtrue
}

% Default option
\ExecuteOptions{preprint}

\ProcessOptions\relax

% Load necessary packages
\RequirePackage[T1]{fontenc}
\RequirePackage{amsmath}    % Advanced maths commands
\RequirePackage{microtype}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{setspace}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{enumitem}
\RequirePackage{ragged2e}


% Set page layout
\geometry{letterpaper, margin=1in}

% Set line spacing
\setstretch{\@spacingratio}

% Custom commands for title, subtitle, and author
\newcommand{\misqTitle}{}
\newcommand{\misqSubtitle}{}
\newcommand{\misqAuthors}{}
\newcommand{\misqDate}{\today}

% Title command
\renewcommand{\title}[1]{\gdef\misqTitle{#1}}
\renewcommand{\subtitle}[1]{\gdef\misqSubtitle{#1}} % Define subtitle command

% Author command
\renewcommand{\author}[1]{\gdef\misqAuthors{#1}}

% Date command
\renewcommand{\date}[1]{\gdef\misqDate{#1}}
\RequirePackage{newpxtext}  % Times-like font for text
% \RequirePackage{newtxmath}  % Times-like font for math
% Maketitle command
\renewcommand{\maketitle}{
  \begin{center}
    {\LARGE \textbf{\misqTitle}\par}  % Title
    \vskip 1em
    \ifx\misqSubtitle\empty\else{\large \textit{\misqSubtitle}\par}\fi % Subtitle (if defined)
    \vskip 1em
    \ifdoubleblind
      \textbf{Anonymous Author(s)}  % Anonymous for review
    \else
      {\normalsize \misqAuthors\par}  % Authors
    \fi
    \vskip 1em
    {\normalsize \misqDate\par}  % Date
  \end{center}
  \thispagestyle{plain}
}


% Header and footer settings
\pagestyle{fancy}
\fancyhf{}

\ifreview
  \fancyhead[L]{\ifdoubleblind \textit{Confidential Review Copy} \else \textit{\misqTitle}\fi}
  \fancyfoot[R]{\textit{Review Copy -- Confidential} \hspace{1cm} \textbf{\thepage}}
\else
  \iffinal
    \fancyhead[L]{\textit{Published in MIS Quarterly}}
    \fancyfoot[C]{\textbf{\thepage}}
  \else % preprint
    \fancyhead[L]{\ifdoubleblind \textit{Preprint -- Confidential} \else \textit{\misqTitle}\fi}
    \fancyfoot[C]{\textbf{\thepage}}
  \fi
\fi

% Remove horizontal rules in header and footer
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}

% Section and subsection formatting
\renewcommand{\section}{
  \@startsection{section}{1}{0pt}{12pt}{6pt}{\bfseries\Large\centering}
}

\renewcommand{\subsection}{
  \@startsection{subsection}{2}{0pt}{12pt}{6pt}{\bfseries\large\centering}
}

\renewcommand{\subsubsection}{
  \@startsection{subsubsection}{3}{0pt}{12pt}{6pt}{\bfseries\normalsize}
}

\endinput
