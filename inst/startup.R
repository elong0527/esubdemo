# Project Level Setup 

R_version <- "4.1.0"																                  # set up project R version
snapshot  <- "2021-08-06" 									                          # set up snapshot date
repos     <- paste0("https://mran.microsoft.com/snapshot/", snapshot)  # set up repository based on snapshot

# Define repo URL for project specific package installation
options(repos = repos)

# Check R Version
if(paste(R.version$major, R.version$minor, sep = ".") != R_version){
 warning("The current R version is not the same with the current project in ", R_version)
}

# Repository
message("Current project R package repository:")
message(paste0("    ", getOption("repos")))
message(" ")

# Display R Session Status
#message("R packages were installed from repo: ", options('repo'), "\n")
# message("Below R package path are searching in order to find installed R pacakges in this R session:", "\n",
#         paste(paste0("    ", .libPaths()), collapse = "\n"))
# message("\n")

rm(R_version, repos, snapshot)