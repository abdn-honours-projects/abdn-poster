% lab-poster.cls
% Poster Template for University of Aberdeen Honours Projects
% 2017-Nov-19 Felipe Meneguzzi felipe.meneguzzi (at) abdn.ac.uk
% --- Class structure: identification part
% ---
\ProvidesClass{lab-poster}[2026/05/12 version 1.04 Lab Poster]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% Size flags — default is a0; set by the corresponding option.
\newif\if@lab@aone   \@lab@aonefalse
\newif\if@lab@atwo   \@lab@atwofalse
\newif\if@lab@athree \@lab@athreefalse

\DeclareOption{a0}{\PassOptionsToClass{a0}{a0poster}}
\DeclareOption{a1}{\@lab@aonetrue\PassOptionsToClass{a1}{a0poster}}
\DeclareOption{a2}{\@lab@atwotrue\PassOptionsToClass{a2}{a0poster}}
\DeclareOption{a3}{\@lab@athreetrue\PassOptionsToClass{a3}{a0poster}}
% Forward all other options (portrait, landscape, etc.) to a0poster.
\DeclareOption*{%
  \InputIfFileExists{\CurrentOption.min}{}{%
    \PassOptionsToClass{\CurrentOption}{a0poster}%
  }%
}

% --- Class structure: execution of options part % ---
\ProcessOptions\relax
\LoadClass{a0poster}

\RequirePackage{multicol}

% Column spacing scales with paper size (÷√2 per step from A0).
\if@lab@athree
  \columnsep=35pt
  \columnseprule=1pt
\else\if@lab@atwo
  \columnsep=50pt
  \columnseprule=1.5pt
\else\if@lab@aone
  \columnsep=70pt
  \columnseprule=2pt
\else
  \columnsep=100pt
  \columnseprule=3pt
\fi\fi\fi

% Number of columns used in \begin{multicols}{...} in the document.
% Change the argument to switch to 3 columns, etc.
\newcommand{\postercolumns}{2}


\RequirePackage{ragged2e}
\RequirePackage[utf8]{inputenc}       % Document encoding
\RequirePackage{times}
\RequirePackage{graphicx}
\RequirePackage{booktabs}
\RequirePackage[font=small,labelfont=bf]{caption}
\RequirePackage{amsfonts, amsmath, amsthm, amssymb, marvosym}
\RequirePackage{wrapfig}
\RequirePackage{enumitem}
\RequirePackage{fancyvrb}
\RequirePackage{xspace}
\RequirePackage[svgnames,usenames,dvipsnames]{xcolor}

\RequirePackage{listings}
\RequirePackage{listingsutf8}

\lstset{literate=
	{ã}{{\~a}}1 {ẽ}{{\~e}}1 {ĩ}{{\~i}}1 {õ}{{\~o}}1 {ũ}{{\~u}}1
	{Ã}{{\~A}}1 {Ẽ}{{\~E}}1 {Ĩ}{{\~I}}1 {Õ}{{\~O}}1 {Ũ}{{\~U}}1
	{á}{{\'a}}1 {é}{{\'e}}1 {í}{{\'i}}1 {ó}{{\'o}}1 {ú}{{\'u}}1
	{Á}{{\'A}}1 {É}{{\'E}}1 {Í}{{\'I}}1 {Ó}{{\'O}}1 {Ú}{{\'U}}1
	{à}{{\`a}}1 {è}{{\`e}}1 {ì}{{\`i}}1 {ò}{{\`o}}1 {ù}{{\`u}}1
	{À}{{\`A}}1 {È}{{\'E}}1 {Ì}{{\`I}}1 {Ò}{{\`O}}1 {Ù}{{\`U}}1
	{ä}{{\"a}}1 {ë}{{\"e}}1 {ï}{{\"i}}1 {ö}{{\"o}}1 {ü}{{\"u}}1
	{Ä}{{\"A}}1 {Ë}{{\"E}}1 {Ï}{{\"I}}1 {Ö}{{\"O}}1 {Ü}{{\"U}}1
	{â}{{\^a}}1 {ê}{{\^e}}1 {î}{{\^i}}1 {ô}{{\^o}}1 {û}{{\^u}}1
	{Â}{{\^A}}1 {Ê}{{\^E}}1 {Î}{{\^I}}1 {Ô}{{\^O}}1 {Û}{{\^U}}1
	{œ}{{\oe}}1 {Œ}{{\OE}}1 {æ}{{\ae}}1 {Æ}{{\AE}}1 {ß}{{\ss}}1
	{ű}{{\H{u}}}1 {Ű}{{\H{U}}}1 {ő}{{\H{o}}}1 {Ő}{{\H{O}}}1
	{ç}{{\c c}}1 {Ç}{{\c C}}1 {ø}{{\o}}1 {å}{{\r a}}1 {Å}{{\r A}}1
	{€}{{\EUR}}1 {£}{{\pounds}}1
}

\lstdefinestyle{codeStyle}{
	commentstyle=\color{black},
	basicstyle=\ttfamily\footnotesize,
	breakatwhitespace=false,
	breaklines=true,
	captionpos=b,
	keepspaces=true,
	numbers=left,
	numbersep=5pt,
	showspaces=false,
	showstringspaces=false,
	showtabs=false,
	tabsize=2
}

\RequirePackage{iflang}

% ================
% = Poster Title =
% ================

\global\let\@supervisor\@empty
\newcommand{\supervisor}[1]{\def\@supervisor{#1}}

\global\let\@major\@empty
\newcommand{\major}[1]{\def\@major{#1}}

\global\let\@email\@empty
\newcommand{\email}[1]{\def\@email{#1}}

% ======================
% = Font Size Commands =
% ======================

\newcommand{\showfontsize}{\f@size{} pt}
% Baseline skip is set to 1.2× the font size throughout.
% Sizes scale by 1/√2 per paper step down from A0.

\if@lab@athree
  % A3 sizes
  \renewcommand{\tiny}{\fontsize{5}{6}\selectfont}
  \renewcommand{\scriptsize}{\fontsize{5}{6}\selectfont}
  \renewcommand{\footnotesize}{\fontsize{6}{7.2}\selectfont}
  \renewcommand{\small}{\fontsize{7}{8.4}\selectfont}
  \renewcommand{\normalsize}{\fontsize{9}{10.8}\selectfont}
  \renewcommand{\large}{\fontsize{11}{13.2}\selectfont}
  \renewcommand{\Large}{\fontsize{13}{15.6}\selectfont}
  \renewcommand{\LARGE}{\fontsize{16}{19.2}\selectfont}
  \renewcommand{\huge}{\fontsize{18}{21.6}\selectfont}
  \renewcommand{\Huge}{\fontsize{22}{26.4}\selectfont}
  \renewcommand{\veryHuge}{\fontsize{26}{31.2}\selectfont}
\else\if@lab@atwo
  % A2 sizes
  \renewcommand{\tiny}{\fontsize{6}{7.2}\selectfont}
  \renewcommand{\scriptsize}{\fontsize{7}{8.4}\selectfont}
  \renewcommand{\footnotesize}{\fontsize{9}{10.8}\selectfont}
  \renewcommand{\small}{\fontsize{10}{12}\selectfont}
  \renewcommand{\normalsize}{\fontsize{13}{15.6}\selectfont}
  \renewcommand{\large}{\fontsize{15}{18}\selectfont}
  \renewcommand{\Large}{\fontsize{18}{21.6}\selectfont}
  \renewcommand{\LARGE}{\fontsize{21}{25.2}\selectfont}
  \renewcommand{\huge}{\fontsize{26}{31.2}\selectfont}
  \renewcommand{\Huge}{\fontsize{31}{37.2}\selectfont}
  \renewcommand{\veryHuge}{\fontsize{37}{44.4}\selectfont}
\else\if@lab@aone
  % A1 sizes
  \renewcommand{\tiny}{\fontsize{9}{10.8}\selectfont}
  \renewcommand{\scriptsize}{\fontsize{10}{12}\selectfont}
  \renewcommand{\footnotesize}{\fontsize{13}{15.6}\selectfont}
  \renewcommand{\small}{\fontsize{14}{16.8}\selectfont}
  \renewcommand{\normalsize}{\fontsize{18}{21.6}\selectfont}
  \renewcommand{\large}{\fontsize{21}{25.2}\selectfont}
  \renewcommand{\Large}{\fontsize{26}{31.2}\selectfont}
  \renewcommand{\LARGE}{\fontsize{31}{37.2}\selectfont}
  \renewcommand{\huge}{\fontsize{37}{44.4}\selectfont}
  \renewcommand{\Huge}{\fontsize{44}{52.8}\selectfont}
  \renewcommand{\veryHuge}{\fontsize{52}{62.4}\selectfont}
\else
  % A0 sizes (default)
  \renewcommand{\tiny}{\fontsize{12}{14.4}\selectfont}
  \renewcommand{\scriptsize}{\fontsize{14}{16.8}\selectfont}
  \renewcommand{\footnotesize}{\fontsize{18}{21.6}\selectfont}
  \renewcommand{\small}{\fontsize{20}{24}\selectfont}
  \renewcommand{\normalsize}{\fontsize{26}{31.2}\selectfont}
  \renewcommand{\large}{\fontsize{30}{36}\selectfont}
  \renewcommand{\Large}{\fontsize{36}{43.2}\selectfont}
  \renewcommand{\LARGE}{\fontsize{43}{51.6}\selectfont}
  \renewcommand{\huge}{\fontsize{52}{62.4}\selectfont}
  \renewcommand{\Huge}{\fontsize{62}{74.4}\selectfont}
  % \veryHuge is not a standard LaTeX command; it is defined by a0poster.
  \renewcommand{\veryHuge}{\fontsize{74}{88.8}\selectfont}
\fi\fi\fi


% =======================
% = Sectioning Commands =
% =======================
\def\@themecolor{NavyBlue}
\newcommand{\themecolor}[1]{\def\@themecolor{#1}}

\renewcommand\section{\@startsection{section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus .2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\huge\bfseries\color{\@themecolor}}}

% ============================
% = Lab and University Logos =
% ============================
\global\let\@lablogo\@empty
\newif\if@hasLabLogo
\@hasLabLogofalse
\newcommand{\lablogo}[1]{\def\@lablogo{#1}\@hasLabLogotrue}

\global\let\@unilogo\@empty
\newcommand{\unilogo}[1]{\def\@unilogo{#1}}


\def\@maketitle{%
\begin{minipage}[c]{\linewidth}%
	\vspace{0.1cm}%
	\noindent\makebox[\textwidth][c]{%
	\begin{minipage}[c]{0.55\linewidth}%
		\raggedright%
		\veryHuge \color{\@themecolor}%
		\textbf{\@title}\\%
		%
		\color{Black}%
		\huge \textbf{\@author}\\%
		\ifx\@supervisor\@empty%
			\relax%
		\else%
		\Large \textbf{Supervisor: \@supervisor}\\%
		\fi%
		\ifx\@major\@empty%
		\relax%
		\else%
		\@major\\%
		\fi%
		\ifx\@email\@empty%
			\relax%
		\else%
		\Large \Letter ~ \texttt{\@email}\\%
		\fi%
	\end{minipage}%
%
	\begin{minipage}[c]{0.45\linewidth}%
		\begin{flushleft}%
		\ifx\@unilogo\@empty%
			\relax%
		\else%
			\if@hasLabLogo%
				\includegraphics[width=0.48\linewidth]{\@unilogo}\hfill%
				\includegraphics[width=0.48\linewidth]{\@lablogo}%
			\else%
				\includegraphics[width=\linewidth]{\@unilogo}%
			\fi%
		\fi%
		\end{flushleft}%
	\end{minipage}}%
	\\[0.1cm]%
% A bit of extra whitespace between the header and poster content
\end{minipage}%
%
\vspace{1cm}}

\AtBeginDocument{%
\IfLanguageName{brazil}{%
\renewcommand{\lstlistingname}{Listagem}%
}{}%
}

\endinput
