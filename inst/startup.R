# Project level setup

# Set up project R version
R_version <- "4.2.1"
# Set up snapshot date
snapshot <- "2022-09-01"
# Set up repository based on snapshot
repos <- "https://packagemanager.rstudio.com/all/2022-09-01+Y3JhbiwyOjQ1MjYyMTU7OUI4REVGREM"

# Define repo URL for project specific package installation
options(repos = repos)

# Check R Version
if (paste(R.version$major, R.version$minor, sep = ".") != R_version) {
  warning("The current R version is not the same with the current project in ", R_version)
}

# Repository
message("Current project R package repository:")
message(paste0("    ", getOption("repos")))
message(" ")

# Display R Session Status
# message("R packages were installed from repo: ", options('repo'), "\n")
# message("Below R package path are searching in order to find installed R packages in this R session:", "\n",
#         paste(paste0("    ", .libPaths()), collapse = "\n"))
# message("\n")

rm(R_version, repos, snapshot)
