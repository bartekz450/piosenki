\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{songbook}[2020/05/01 Example LaTeX class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage[top=10mm,bottom=10mm,inner=10mm,outer=25mm]{geometry}

\usepackage[sfdefault]{roboto}
\usepackage[T1]{fontenc}

\RequirePackage{fancyhdr}
\RequirePackage{tikzpagenodes}

\pagestyle{fancy}

\fancyhf{}
\fancyfoot[LE,RO]
{
    \begin{tikzpicture}[remember picture, overlay]     
        \fill[lightgray] (current page marginpar area.east |- current page.north) rectangle (current page marginpar area.west |- current page.south);
        \node[anchor = north] at (current page marginpar area.center |- current page header area.south) {\includegraphics[width = 15mm]{exlibris.png}};
        \node[anchor = south] at (current page marginpar area.center |- current page footer area.north) {\bfseries\thepage};
    \end{tikzpicture}
}

\renewcommand\headrulewidth\z@

\def\songtitle#1{\gdef\@songtitle{#1}}
\def\@songtitle{\@latex@error{No \noexpand\@songtitle given}\@ehc}

\def\songauthor#1{\gdef\@songauthor{#1}}
\def\@songauthor{\@latex@error{No \noexpand\@songauthor given}\@ehc}

\newenvironment{flushinner}
{
    \def\@flushinner{\ifodd\c@page flushleft\else flushright\fi}
    \expandafter\begin\expandafter{\@flushinner}
}
{
    \expandafter\end\expandafter{\@flushinner}
}

\newcommand\songmaketitle
{
    \begin{center}
        \bfseries\large\@songtitle
    \end{center}
    
    \begin{flushinner}
        \itshape\@songauthor
    \end{flushinner}
}

\RequirePackage{longtable}

\renewenvironment{verse}
{
    \setlength\LTleft\z@
    \setlength\LTright\z@
    \setlength\LTpre\lineskip
    
    \begin{longtable}{@{\extracolsep{\fill}}lr@{}}
}
{
    \end{longtable}
}

\newenvironment{chorus}
{
    \setlength\LTleft{2.5em}
    \setlength\LTright\z@
    \setlength\LTpre\lineskip
    
    \noindent\textit{Ref.:}
    
    \begin{longtable}{@{\extracolsep{\fill}}lr@{}}
}
{
    \end{longtable}
}
