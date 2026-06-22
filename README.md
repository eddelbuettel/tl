# tl: A tiny logger using spdlite via rspdlite

[![CI](https://github.com/eddelbuettel/tl/actions/workflows/ci.yaml/badge.svg)](https://github.com/eddelbuettel/tl/actions/workflows/ci.yaml)
[![License](https://img.shields.io/badge/license-GPL%20%28%3E=%202%29-brightgreen.svg?style=flat)](https://www.r-project.org/Licenses/GPL-2)
[![CRAN](https://www.r-pkg.org/badges/version/tl)](https://cran.r-project.org/package=tl)
[![Dependencies](https://tinyverse.netlify.app/badge/tl)](https://cran.r-project.org/package=tl)
[![r-universe](https://eddelbuettel.r-universe.dev/badges/tl)](https://eddelbuettel.r-universe.dev/tl)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/tl)](https://github.com/eddelbuettel/tl)

### About

The [rspdlite][rspdlite] packages provides the _tiny, fast, capable_ logger [spdlite][spdlite],
implemented as a small C++20 header-only library, for use by R. It is related to its larger and more
featureful cousing [spdlog][spdlog] which we provide via [RcppSpdlog][rcppspdlog] -- and the
wrapping frontend [spdl][spdl] which polishes and unifies some user-interface aspects for the
discerning R user and/or package developer.

[tl][tl] does the same for [rspdlite][rspdlite]: It offers an _entirely optional_ interface
consistently using namespaced calling convention _for both R and C++_. In other words, one can added
debugging informations such as `tl::info("Entering section foo")` the same way in both R and C++
(with an added semicolon, or course, and by adding a header for declarations).

### Examples

We can revisit the examples from the [rspdlite][rspdlite] package:

#### From C++

We can use the same C++ example from the [spdlite][spdlite] docs, but now accessing via the `tl`
namespace:

```c++
tl::critical("-- level to warn");
tl::set_level("warn");

tl::error("Some error message with arg: {}", 1);
tl::warn("Easy padding in numbers like {:08d}", 12);
tl::critical("Support for int: {0:d};  hex: {0:x};  oct: {0:o}; bin: {0:b}", 42);
tl::info("Support for floats {:03.2f}", 1.23456);
tl::info("Positional args are {1} {0}..", "too", "supported");
tl::info("{:<30}", "left aligned");
```

The default logging level is 'info' so all these message would appear by default but as we alter the
logging level dynamically to 'warn' fewer messages appear.


#### From R

Following the nice user experience offered by [spdl][spdl], we similarly provide access via the
'package name colon colon' patter from R:

```r
tl::critical("-- level to debug")
tl::set_level("debug")

tl::info("Some more at info")
tl::error("Some error message with arg: {}", 1)
tl::error("Some error message with more args: {} and {}", 1, "abc")

tl::log_critical("-- level to error and calling example1 and example2")
tl::set_level("error")
```

As for its cousin R packages, the format string here 'resembles' the full C++ format string, but
remains simpler. As we convert each argument directly to a character (then passed on to the C++
layer) we do not offer the extra formatting options available directly from C++. We have not found
this to be an issue.

#### Package `tlexample`

The package [tlexample][tlexample] offers a complete example of integrated logging from both C++ and
R. After installing [rspdlite][rspdlite] and [tl][tl] (along with their one dependency [Rcpp][rcpp])
one can run the provided demo.  So for example in an [r2u][r2u] container (such as `rocker/r2u`
where we rely on the GitHub installation helper also pulling in dependencies [Rcpp][rcpp] and
[rspdlite][rspdlite] as binaries)

```sh
root$ installGithub.r eddelbuettel/tl eddelbuettel/tlexample
root$ Rscript -e 'demo(ex, package="tlexample")'
```

or alternatively install [Rcpp][rcpp] and these package from source or as binary from [my
r-universe][r-universe].  This [tlexample][tlexample] package is very lightweight and therefore a
good playground to experiment with logging via [tl][tl], [rspdlite][rspdlite] and [spdlite][spdlite].

### Author

Dirk Eddelbuettel

### License

tl is released under the GNU GPL, version 2 or later, just like R itself.


[tl]: https://github.com/eddelbuettel/tl
[spdlog]: https://github.com/gabime/spdlog
[rcppspdlog]: https://github.com/eddelbuettel/RcppSpdlog
[spdl]: https://github.com/eddelbuettel/spdl
[spdlite]: https://github.com/gabime/spdlite
[fmt]: https://github.com/fmtlib/fmt
[rspdlite]: https://github.com/eddelbuettel/rspdlite
[ex]: inst/examples/example.cpp
[exR]: inst/examples/example.R
[tlexample]: https://github.com/eddelbuettel/tlexample
[rcpp]: https://www.rcpp.org
[r2u]: https://eddelbuettel.github.io/r2u/
[r-universe]: https://eddelbuettel.r-universe.dev/builds
