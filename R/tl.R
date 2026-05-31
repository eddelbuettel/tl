
#' Tiny logging wrapper for 'rspdlite'
#'
#' These functions all pass on their arguments to the corresonding
#' function in the \pkg{rspdlite} package implementing them. The core
#' purpose of these functions is to provide a \sQuote{tighter} interface
#' via the \code{tl::} prefix from both R and C++, i.e.
#' \code{tl::debug("Condition met, value {}", val)} works from both.
#' See the \pkg{rspdlite} package for more.
#' @param ... Argument(s) passed along
#' @return In general, nothing is returned as the functions are invoked
#' for their side effect of logging.
#' @seealso \pkg{rspdlite}
#' @export
#' @examples
#' lvl <- tl::get_level()
#' tl::debug("This message is ignored by the default level 'info'.")
#' tl::info("This message is show by the default level.")
#' tl::set_level("warn")
#' tl::info("Now this message at 'info' is ignored too.")
#' tl::warn("A warning messages passes at level warning. {}", 42L)
#' tl::set_name("my_logger")
#' tl::error("Error messages also pass, and see the name set")
#' tl::set_level(lvl) # rever to prior level
trace <- function(...) { rspdlite::log_trace(...) }

#' @rdname trace
#' @export
debug <- function(...) { rspdlite::log_debug(...) }

#' @rdname trace
#' @export
info <- function(...) { rspdlite::log_info(...) }

#' @rdname trace
#' @export
warn <- function(...) { rspdlite::log_warn(...) }

#' @rdname trace
#' @export
error <- function(...) { rspdlite::log_error(...) }

#' @rdname trace
#' @export
critical <- function(...) { rspdlite::log_critical(...) }

#' @rdname trace
#' @export
set_level <- function(...) { rspdlite::set_level(...) }

#' @rdname trace
#' @export
get_level <- function() { rspdlite::get_level() }

#' @rdname trace
#' @export
set_name <- function(...) { rspdlite::set_name(...) }

#' @rdname trace
#' @export
get_name <- function() { rspdlite::get_name()  }

.onAttach <- function(libname, pkgname) {
    txt <- paste0("\nThe 'tl' package is not meant for interactive work following 'library(tl)'.\n",
                  "Rather, just call its functions directly (e.g. 'tl::info(\"Some message\")')\n",
                  "without attaching the package, and/or use the C++ header from compiled code.\n")
    packageStartupMessage(txt)
}
