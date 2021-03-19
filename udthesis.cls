%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simple Article
% Integrated article template with simple for make4ht
% LaTeX Class
% Version 1.0 (10/11/20)
%
% This class originates by:
% Vel and  Nicolas Diaz
%
% Authors:
% Muhammad Uliah Shafar
%
%
% Free License:
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{udthesis}[2021/01/03 Udthesis Class v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{report} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------
% PREAMBLE OF ENGLISH LANGUAGE HYPHENATION
% Malay happen to replace bahasai command
%\usepackage[english]{babel} %PdfLatex Compiler Engine
\usepackage{polyglossia} %LuaLatex Compiler Engine
\setmainlanguage[variant=indonesian]{malay}
\setotherlanguages{english}
\PolyglossiaSetup{malay}{indentfirst=true}


% Rename caption's command for bahasai
\addto\captionsmalay{
    \renewcommand{\abstractname}{ABSTRAK}
    \renewcommand{\contentsname}{DAFTAR ISI}
    \renewcommand{\listfigurename}{DAFTAR GAMBAR}
    \renewcommand{\listtablename}{DAFTAR TABEL}
    \renewcommand{\bibname}{DAFTAR PUSTAKA}
}
% Rename caption's command for english
\addto\captionsenglish{
    \renewcommand{\abstractname}{ABSTRACT}
%    \renewcommand{\figurename}{Gambar}
%    \renewcommand{\tablename}{Tabel}
%    \renewcommand{\abstractname}{ABSTRACT}
}

\usepackage{comment}
%----------------------------------------------------------------------------------------
%	DOCUMENT MARGINS
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=3cm, % Top margin
	bottom=3cm, % Bottom margin
	left=4cm, % Left margin
	right=3cm, % Right margin
%	headheight=0.75cm, % Header height
	footskip=1.5cm, % Space from the bottom margin to the baseline of the footer
%	headsep=0.75cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}
%----------------------------------------------------------------------------------------
%	TABLE OF CONTENTS
%----------------------------------------------------------------------------------------
\usepackage[titles]{tocloft}
\setlength{\cftbeforechapskip}{3pt}
\renewcommand{\cftchapfont}{\normalfont}%change chap to normal
\renewcommand{\cftchappagefont}{\normalfont}%change num page to normal
\renewcommand{\cftchapleader}{\cftdotfill{\cftsecdotsep}}%add dots and change dots to normal
\renewcommand\cftchappresnum{BAB }

\renewcommand{\cfttabpresnum}{\tablename\enspace}
\renewcommand{\cftfigpresnum}{\figurename\enspace}
\newlength{\mylen}
\settowidth{\mylen}{\cftfigpresnum\cftfigaftersnum}
\addtolength{\cftfignumwidth}{\mylen}
\settowidth{\mylen}{\cfttabpresnum\cfttabaftersnum}
\addtolength{\cfttabnumwidth}{\mylen}

\settowidth\mylen{BAB 1\ }
\cftsetindents{chap}{0pt}{\mylen}

\renewcommand{\thefigure}{\arabic{chapter}.\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}.\arabic{table}}

\setlength{\cftfigindent}{0pt}%remove indentation
\setlength{\cfttabindent}{0pt}%remove indentation
%----------------------------------------------------------------------------------------
%	TITLE SECTION
%----------------------------------------------------------------------------------------
%\setcounter{secnumdepth}{3}% number subsubsection in report class

\usepackage{titlesec}
\makeatletter
% reformat chapter number
\renewcommand{\thechapter}{\Roman{chapter}}
\renewcommand \thesection{\arabic{chapter}.\arabic{section}}
\renewcommand \thesubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}}
\renewcommand \thesubsubsection{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

\titleformat{\chapter} %command
[display]%shape
{\normalfont\fontsize{12}{15}\filcenter\bfseries}%format
{BAB \thechapter}%label
{0pt}%sep
{\vspace{0pt}}%before-title
[]%after-title

\titleformat{\section} %command
{\normalfont\fontsize{12}{15}\bfseries}%format
{\thesection}%label
{12pt}%sep
{\vspace{0pt}}%before-title
[]%after-title

\titleformat{\subsection} %command
%shape
{\normalfont\fontsize{12}{15}\bfseries}%format
{\thesubsection}%label
{2pt}%sep
{}%before-title
[]%after-title

%\titleformat{\subsubsection} %command
%shape
%{\normalfont\fontsize{12}{15}\bfseries}%format
%{\thesubsubsection}%label
%{12pt}%sep
%{}%before-title
%[]%after-title

\titlespacing*{\chapter}{0pt}%left
{0pt plus 4pt minus 2pt}%before
{30pt plus 2pt minus 2pt}%after
\titlespacing\section{0pt}
{12pt plus 4pt minus 2pt}
{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}
{12pt plus 4pt minus 2pt}
{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}
{12pt plus 4pt minus 2pt}
{0pt plus 2pt minus 2pt}


%----------------------------------------------------------------------------------------
% PREAMBLE OF FIGURES

\usepackage{graphicx}

\graphicspath{{figures/}{../figures/}}% Specifies where to look for included images (trailing slash required)
%\graphicspath{{figures/}{./}}

\usepackage{wrapfig} % Allows in-line images
%\usepackage{subcaption} %Subfigure component
%\usepackage[labelformat=parens,labelsep=quad, skip=3pt]{caption}  %Subcaption in 2 column img

\usepackage[labelsep=space,
labelfont={bf},
font={it,small,onehalfspacing}]{caption}%Use \caption* for add source
\setlength\belowcaptionskip{-10pt} %Reduce spacing caption figures


%\setkeys{Gin}{draft} %Render image for draft

%----------------------------------------------------------------------------------------
% PREAMBLE OF TABLE AND LIST

\usepackage{tabularx}
\usepackage{booktabs} % Required for better horizontal rules in tables
%\usepackage{multirow}

\usepackage{paralist} %Inline list(inparaenum), always on top of enumitem
%\usepackage{longtable} % Enable table cross multiple page
%\usepackage{array} %Mostly formatting columns and spacing
\usepackage{enumitem} % Required for list customisation

\setlist{noitemsep} % No spacing between list items
\setlist[itemize]{label=\textbullet, nosep, topsep=0pt, partopsep=0pt, parsep=0pt} % No spacing between itemize
\setlist[enumerate]{nosep, topsep=0pt, partopsep=0pt, parsep=0pt} % No spacing between enumerate

% Remove spacing between itemize env. inside table env., first column type for enumerate(e), second coulmn type for itemize(i)
%\makeatletter
%\newcolumntype{e}[1]{%
%    >{\minipage[t]{\linewidth}\let\\\tabularnewline
%      \enumerate
%      \addtolength{\rightskip}{0pt plus 50pt}% for raggedright
%      \setlength{\itemsep}{-\parsep}}%
%    p{#1}%
%    <{\@finalstrut\@arstrutbox\endenumerate\endminipage}}
%
%\newcolumntype{i}[1]{%
%    >{\minipage[t]{\linewidth}\let\\\tabularnewline
%      \itemize
%      \addtolength{\rightskip}{0pt plus 50pt}% for raggedright
%      \setlength{\itemsep}{-\parsep}}%
%    p{#1}%
%    <{\@finalstrut\@arstrutbox\enditemize\endminipage}}
%\makeatother

%----------------------------------------------------------------------------------------
% CONFIGURATION OF TIKZ
\usepackage{tikz}
\usetikzlibrary{shapes.geometric, arrows}

% Configuration of Tikz FlowChart
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black]

\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{doublearrow} = [densely dotted,<->,>=stealth]
\tikzstyle{dotted} = [loosely dotted,>=stealth]

%----------------------------------------------------------------------------------------
% CONFIGURATION OF SUBFILE
\usepackage{subfiles}
\newcommand{\onlyinsubfile}[1]{#1}
\newcommand{\notinsubfile}[1]{}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------
% LUALATEX FONT
\usepackage{fontspec}
\setmainfont{Arial} %Altex main font documents, default= Modern

%----------------------------------------------------------------------------------------
% CONFIGURATION OF TEXT(PARAGRAPH, SECTION, DATE, OTHERS)


\usepackage{lipsum} % Add  dummy text
\usepackage[hidelinks]{hyperref}
\usepackage{setspace} %Alter spacing in paragraph
\onehalfspacing %Specify spacing of setspace

\setlength{\parindent}{1cm} %Alter indentation

%\usepackage{indentfirst} %Indent the first paragraph
%\providecommand{\keywords}[1]{\textbf{\textit{Keywords---}} #1} %Insert Keyword Command

\usepackage[bahasai, calc]{datetime2} %Formating date or DTMtoday command, files ldf needs customization. Removes showdayofweek.

%----------------------------------------------------------------------------------------
% PREAMBLE OF BIBLIOGRAPHY
\usepackage[round]{natbib}
\setcitestyle{open={(},close={)}}
%\def\biblio{\bibliographystyle{apalike}\bibliography{references.bib}} % bliography in subfile use with onlysubfile

%\makeatletter
%\renewcommand\@biblabel[1]{\textbf{#1.}} % Remove the square brackets from each bibliography item ('[1]' to '1.')
%\makeatother


%----------------------------------------------------------------------------------------
%	LaTeX MACROS AND COMMANDS
%----------------------------------------------------------------------------------------
\renewenvironment{abstract}{%
    \clearpage
    \chapter*{\bfseries\abstractname\vspace{\z@}}%
%    \quotation
    }
{
%\endquotation
\vspace{\baselineskip}}

\newenvironment{prakata}
 {\small
 \null\vfil
 \quotation
  \list{}{%
%    \setlength{\leftmargin}{1cm}% <---------- CHANGE HERE
%    \setlength{\rightmargin}{\leftmargin+1cm}%
    \singlespacing
  }%
  \item\relax}
 {\endquotation\null\vfil\endlist}
