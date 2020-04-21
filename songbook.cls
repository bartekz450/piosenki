\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{songbook}[2020/05/01 Example LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage[pass]{geometry}

\usepackage[sfdefault]{roboto}
\usepackage[T1]{fontenc}

\def\SBtitle#1{\gdef\@SBtitle{#1}}
\def\@SBtitle{\@latex@error{No \noexpand\@SBtitle given}\@ehc}

\def\SBauthor#1{\gdef\@SBauthor{#1}}
\def\@SBauthor{\@latex@error{No \noexpand\@SBauthor given}\@ehc}

\RequirePackage{changepage}
\strictpagecheck

\newenvironment{song}
{
    \setlength\parindent\z@
    \begin{center}
        \bfseries\large\@SBtitle
    \end{center}
    \checkoddpage
    \ifoddpage
    \begin{flushleft}
        \itshape\@SBauthor
    \end{flushleft}
    \else
    \begin{flushright}
        \itshape\@SBauthor
    \end{flushright}
    \fi
}
{
    
}

\newenvironment{chorus}
{
    \par
    \textit{Ref.:}
    \begin{adjustwidth}{2.5em}{\z@}
}
{
    \end{adjustwidth}
    \par
}
