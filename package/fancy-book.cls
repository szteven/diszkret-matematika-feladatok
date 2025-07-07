\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fancy-book}[2021/03/11 Fancy Book]
\LoadClass[a4paper,oneside]{book}

\RequirePackage[
backend=biber,
style=numeric,
citestyle=numeric-comp ,
sorting=none 
]{biblatex}
\RequirePackage{csquotes}
\RequirePackage{graphicx} %% for inserting images
\RequirePackage{graphics, float} %% for forcing the image to be at the same place as defined
\RequirePackage{wrapfig} %% for wrapping it around text
\RequirePackage[breaklinks]{hyperref}
\RequirePackage{lmodern}
\RequirePackage[magyar]{babel}
\RequirePackage{geometry}
\geometry{margin=1.0in}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=magenta,      
	urlcolor=cyan,
}

\makeatletter
% 1. First fix the TOC issue at its root
\def\magyar@activedot{*} % Fixes the asterisk in TOC
\def\magyar@dot{*} % Another layer of protection

% 2. Create a robust chapter command that preserves all functionality
\let\oldchapter\chapter
\renewcommand{\chapter}{%
	\@ifstar{\@chapterstar}{\@dblarg{\@@chapter}}%
}
\def\@chapterstar#1{%
	\oldchapter*{#1}%
	\def\@currentlabelname{#1}%
}
\def\@@chapter[#1]#2{%
	\oldchapter[{#1}]{#2}%
	\def\@currentlabelname{#2}%
}
\makeatother

\RequirePackage{fancyhdr}  %% fancy footnotes and headers
\RequirePackage{fourier-orns}
\renewcommand{\footnoterule}{\vspace{-0.5em}\noindent\textcolor{darkgray}{\floweroneright ~ \raisebox{2.9pt}{\line(1,0){100}} \leafNE} \vspace{.5em} }

\RequirePackage{xpatch}
\RequirePackage{blindtext}
\RequirePackage{xcolor}

%\renewcommand{\chaptermark}[1]{\uppercase{\markboth{#1}{#1}}}

\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields

% Header: chapter number and title, left-aligned, uppercase
\fancyhead[L]{\leftmark} % L = left-aligned

% Footer: page number centered
\fancyfoot[C]{\thepage}

% Optional: header line
\renewcommand{\headrulewidth}{0.4pt}

% Custom chapter mark: "1. TITLE"
\renewcommand{\chaptermark}[1]{%
	\markboth{\textsc{\thechapter. #1}}{}%
}

\makeatletter
\def\@seccntformat#1{\@ifundefined{#1@cntformat}%
	{\csname the#1\endcsname\quad}%      default
	{\csname #1@cntformat\endcsname}}%   individual control
\newcommand{\section@cntformat}{\S\thesection\quad}
\newcommand{\subsection@cntformat}{\S\thesubsection\quad}
\newcommand{\subsubsection@cntformat}{\S\thesubsubsection\quad}
\makeatother


