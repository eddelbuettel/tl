\name{NEWS}
\title{News for Package \pkg{tl}}
\newcommand{\ghpr}{\href{https://github.com/eddelbuettel/tl/pull/#1}{##1}}
\newcommand{\ghit}{\href{https://github.com/eddelbuettel/tl/issues/#1}{##1}}

\section{Changes in version 0.0.2 (2025-06-30)}{
  \itemize{
    \item Added badges to README now that package is on CRAN, add NEWS file
    \item Condition the provided header on C++20 use, offer fallback
    \item Add an exported initialization function picking up a logging level
    from either an environment variable or a global option, see '?init'
  }
}

\section{Changes in version 0.0.1 (2025-06-17)}{
  \itemize{
    \item Initial CRAN upload
  }
}
