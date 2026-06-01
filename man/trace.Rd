% tinyrox says don't edit this manually, but it can't stop you!
\name{trace}
\alias{trace}
\alias{debug}
\alias{info}
\alias{warn}
\alias{error}
\alias{critical}
\alias{set_level}
\alias{get_level}
\alias{set_name}
\alias{get_name}
\alias{set_format}
\title{Tiny logging wrapper for 'rspdlite'}
\usage{
trace(...)

debug(...)

info(...)

warn(...)

error(...)

critical(...)

set_level(...)

get_level()

set_name(...)

get_name()

set_format(utc = FALSE, show_date = TRUE, show_thread_id = FALSE,
           precision = "ms")
}
\arguments{
\item{...}{Argument(s) passed along}

\item{utc}{Boolean flag to select display of current time in UTC rather than local,
default is off}

\item{show_date}{Boolean flag to select display of date part of current, default is on}

\item{show_thread_id}{Boolean flag to select display of current thread, default is off}

\item{precision}{Character value for selected time precision: one of \dQuote{ms}
(the default format), \dQuote{us}, \dQuote{ns} or \dQuote{none}}
}
\value{
In general, nothing is returned as the functions are invoked
for their side effect of logging.
}
\description{
These functions all pass on their arguments to the corresonding
function in the \pkg{rspdlite} package implementing them. The core
purpose of these functions is to provide a \sQuote{tighter} interface
via the \code{tl::} prefix from both R and C++, i.e.
\code{tl::debug("Condition met, value {}", val)} works from both.
See the \pkg{rspdlite} package for more.
}
\examples{
lvl <- tl::get_level()
tl::debug("This message is ignored by the default level 'info'.")
tl::info("This message is show by the default level.")
tl::set_level("warn")
tl::info("Now this message at 'info' is ignored too.")
tl::warn("A warning messages passes at level warning. {}", 42L)
tl::set_name("my_logger")
tl::error("Error messages also pass, and see the name set")
tl::set_format(show_thread_id=TRUE, precision="ns")
tl::error("Warning message under changed formatting")
tl::set_level(lvl) # revert to prior level
tl::set_name("") # revert to no name
tl::set_format() # revert to default format
}
\seealso{
\pkg{rspdlite}
}
