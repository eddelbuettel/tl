
trace <- function(...) { rspdlite::log_trace(...) }
debug <- function(...) { rspdlite::log_debug(...) }
info <- function(...) { rspdlite::log_info(...) }
warn <- function(...) { rspdlite::log_warn(...) }
error <- function(...) { rspdlite::log_error(...) }
critical <- function(...) { rspdlite::log_critical(...) }

set_level <- function(s) { rspdlite::set_level(s) }
get_level <- function() { rspdlite::get_level() }
set_name <- function(s) { rspdlite::set_name(s) }
get_name <- function() { rspdlite::get_name()  }
