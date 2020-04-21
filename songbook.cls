\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{songbook}[2020/05/01 Example LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage[pass]{geometry}

\usepackage[sfdefault]{roboto}
\usepackage[T1]{fontenc}

\def\SBtitle#1{\gdef\SB@title{#1}}
\def\SB@title{\@latex@error{No \noexpand\SB@title given}\@ehc}

\def\SBlyrics#1{\gdef\SB@lyrics{#1}}
\def\SB@lyrics{\@latex@error{No \noexpand\SB@lyrics given}\@ehc}

\def\SBmusic#1{\gdef\SB@music{#1}}
\def\SB@music{\@latex@error{No \noexpand\SB@music given}\@ehc}

\newenvironment{song}
{
    \setlength\parindent\z@
    \begin{center}\bfseries\large\SB@title\end{center}
}
{
    
}

\RequirePackage{changepage}

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
