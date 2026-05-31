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
}
\arguments{
\item{...}{Argument(s) passed along}
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
tl::set_level(lvl) # rever to prior level
}
\seealso{
\pkg{rspdlite}
}
