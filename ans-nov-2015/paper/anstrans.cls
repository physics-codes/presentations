%  American Nuclear Society Transaction template
%  by Seth R. Johnson, based on the ANS transaction template and Edward W.
%  Larsen
%
% Usage: \documentclass{anstrans}
% define \title and \author as usual, and also define \institute and \email

\NeedsTeXFormat{LaTeX2e}[1995/12/01]

\ProvidesClass{anstrans}[2008/01/14 v1.1 ANS Transaction class]

%%%%%%%%%%% TYPE AND GEOMETRY %%%%%%%%%%%
\LoadClass[twocolumn,10pt]{article}

\pagestyle{empty}						%no page numbering

\RequirePackage[text={7in,9in},centering]{geometry}

%%use times for math font
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}

%%%%%%%%%%% INCLUDE PACKAGES %%%%%%%%%%%
\RequirePackage{cuted} % for single column in a multicolumn doc
\RequirePackage{indentfirst}	% indent the leading paragraph
\RequirePackage{amsmath}

%%%%%%%%%%% REQUIRED VARIABLES %%%%%%%%%%%
\newif\if@institutedefined
\@institutedefinedfalse
\def\@institute{\PackageWarning{anstrans}{No institute has been defined.}}
\newcommand{\institute}[1]{\def\@institute{#1}\@institutedefinedtrue}

\newif\if@emaildefined
\@emaildefinedfalse
\def\@email{\PackageWarning{anstrans}{No email address has been defined.}}
\newcommand{\email}[1]{\def\@email{#1}\@emaildefinedtrue}

%%%%%%%%%%% SECTIONING %%%%%%%%%%%
\setcounter{secnumdepth}{-2} %hide all section heading numbers

\renewcommand\section{\@startsection
	{section}{1}{0pt}%		%name, level, indent
	{-\baselineskip}%		%beforeskip
	{.75\baselineskip}%		%afterskip
	{\reset@font\bf\MakeUppercase}%
}

\renewcommand\subsection{\@startsection
	{subsection}{1}{0pt}%		%name, level, indent
	{-\baselineskip}%		%beforeskip
	{.75\baselineskip}%		%afterskip
	{\reset@font\bf}%
}

\renewcommand\subsubsection{\@startsection
	{subsubsection}{1}{-1em}%		%name, level, indent
	{-.75\baselineskip}%		%beforeskip
	{.5\baselineskip}%		%afterskip
	{\reset@font\emph}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% BIBLIOGRAPHY %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\@biblabel[1]{#1.} %change from [x] to x.

%% reduce spacing in bibliography; thanks to Jose Carlos Santos.
\let\@oldthebibliography=\thebibliography
\let\@endoldthebibliography=\endthebibliography
\let\@olditemsep=\itemsep
\renewenvironment{thebibliography}[1]{%
	\begin{@oldthebibliography}{#1}%
		\setlength{\itemsep}{-\@olditemsep}%
}%
{%
	\@endoldthebibliography%
	\end{@oldthebibliography}%
}
%%%%%%%%%%% CHANGE TABLE/FIGURE STYLE %%%%%%%%%%%
\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{TABLE}

\setlength{\abovecaptionskip}{0.25\baselineskip}
\setlength{\belowcaptionskip}{0.25\baselineskip}
\setlength{\textfloatsep}{0.5\baselineskip}
\setlength{\intextsep}{0.5\baselineskip}

\renewcommand{\bottomfraction}{0.5}

%%%%%%%%%%% GENERATE PORTIONS OF THE DOCUMENT %%%%%%%%%%%
\renewcommand{\maketitle}{
  \begin{strip} \vspace*{-35pt}
    \begin{center}
      %title
      \textbf{\@title}\par 
      \vspace{1em}
      %author
      \begin{tabular}[t]{c}
        \@author
      \end{tabular}
      %institute (optional?)
      \if@institutedefined 
        \par 
        {\let\and\par \itshape \@institute} 
      \fi
      %email (optional?)
      \if@emaildefined
        \par 
        {\itshape
        \begin{tabular}[t]{c}
          \@email
        \end{tabular}
        }
      \fi
    \end{center}
    \vspace*{-1em}
  \end{strip}
}

\AtBeginDocument{
  \maketitle
}
