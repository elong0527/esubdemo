# Modify with care!
# The file loads the startup file automatically when the package is loaded.

.onLoad <- function(libname, pkgname) {
  startup <- system.file("startup.R", package = pkgname)

  if (file.exists(startup)) {
    source(startup)
  } else {
    stop("Cannot find", startup)
  }

  invisible(startup)
}

globalVariables(c("n", "tot", "pct", "npct"))
