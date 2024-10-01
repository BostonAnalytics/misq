%%
%% Updated template for KOMA-Script’s `scrartcl` class.
%% Uses newtxtext and newtxmath with \Bbbk conflict suppressed.
%%
\NeedsTeXFormat{LaTeX2e}[2021/06/01]
\ProvidesClass{scrartcl}
              [2022/10/04 v3.36 KOMA-Script Article Class]

%% Load KOMA-Script and define options
\LoadClassWithOptions{scrartcl}

%% Declare options
\DeclareOption{a4paper}{\KOMAoptions{paper=a4}}
\DeclareOption{letterpaper}{\KOMAoptions{paper=letter}}
\DeclareOption{11pt}{\KOMAoptions{fontsize=11pt}}
\DeclareOption{12pt}{\KOMAoptions{fontsize=12pt}}
\DeclareOption{twoside}{\KOMAoptions{twoside=true}}
\DeclareOption{oneside}{\KOMAoptions{twoside=false}} %% Corrected the `oneside` option

%% Set default options
\ExecuteOptions{letterpaper,10pt,twoside,onecolumn,final}

\ProcessOptions

%% KOMA-Script specific settings
\KOMAoptions{
    parskip=half,          % Add half-line space between paragraphs
    headings=normal,       % Normal font for headings
    abstract=on,           % Include abstract environment
    DIV=12,                % Page layout optimization (DIV factor)
}

%% Use Times-like fonts: newtxtext for text and newtxmath for math
\let\Bbbk\relax % Suppress previous \Bbbk definition to avoid conflict

\RequirePackage[utf8]{inputenc} % Assuming the source is in UTF-8
\RequirePackage[T1]{fontenc} % T1 font encoding

\RequirePackage{newpxtext}
\RequirePackage{xcolor}

\addtokomafont{disposition}{\rmfamily}

%% Page style definitions
\pagestyle{plain}
\pagenumbering{arabic}

%% Load KOMA-Script dependencies for spacing and layout
\RequirePackage{scrlayer-scrpage}
\RequirePackage{geometry}
\RequirePackage{microtype}
\RequirePackage{xcolor}

%% Support for conditional structures like `if`
\newcommand\@ifdefinition[3]{\ifdefined#1#2\else#3\fi} % Custom if structure

%% Example: A placeholder for using if-statements and loops (you can modify according to your variables)
\newcommand\authorTemplate[4]{
    \textbf{\normalsize $it.name.literal$} % Author name in bold and normal size
    $if(it.orcid)$~\orcidlink{$it.orcid$}$endif$ % ORCID link if available
    $for(it.affiliations)$\\\normalsize $it.name$$endfor$ % Affiliations in normal size and normal font
    \\$if(it.email)$\href{mailto:$it.email$}{\textit{$it.email$}}$endif$ % Email in italic
}

%% Redefine the maketitle command for the titlepage option (customized for KOMA-Script)

\renewcommand\maketitle{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\parindent 1em\noindent
              \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
      \newpage
        \global\@topnum\z@   % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \thispagestyle{plain}\@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty          % Remove date from the title
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }

%% Define default environment settings and style
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}

\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}

%% Page switching to single-sided for appendix
\newcommand\switchToOneSided{
    \KOMAoptions{twoside=false}    % Switch to one-sided mode
}

%% Example appendix (can be expanded as needed)
\newcommand\addAppendix{
    \switchToOneSided              % Activate one-sided mode before appendix
    \appendix                      % Start appendix
    \section{Appendix Title}
    % Additional appendix content here...
}

%% Load default language settings
\RequirePackage[english]{babel}

%% Bibliography using KOMA-Script's default bibliography handling
%% Example usage:
%% \bibliographystyle{plain}
%% \bibliography{references}  % Use your .bib file here

\endinput
%%
%% End of file for KOMA-Script's `scrartcl.cls` with newtxtext and newtxmath fonts and conflict fix.
