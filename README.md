# esubdemo

<!-- badges: start -->
[![R build status](https://github.com/elong0527/esubdemo/workflows/R-CMD-check/badge.svg)](https://github.com/elong0527/esubdemo/actions)
[![R-CMD-check](https://github.com/elong0527/esubdemo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/elong0527/esubdemo/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

`esubdemo` is a demo project to illustrate how to organize analysis scripts
in an R package folder structure.

The demo project follows the concepts discussed in:

- [Marwick, B., Boettiger, C., & Mullen, L. (2018). Packaging data analytical work reproducibly using R (and friends). The American Statistician, 72(1), 80-88.](https://peerj.com/preprints/3192/)
- [Wu, P., Palukuru, U. P., Luo, Y., Nepal, S., & Zhang, Y. (2021) Analysis and reporting in regulated clinical trial environment using R. PharmaSUG 2021](https://www.pharmasug.org/proceedings/2021/AD/PharmaSUG-2021-AD-079.pdf)
- [R for Clinical Study Reports and Submission](https://r4csr.org)

## Folder Structure

By using an R package folder structure and the associated development tools,
we are able to achieve:

- Consistency
- Automation
- Reproducibility
- Compliance

Below are the minimal sufficient folders and files leveraging the
R package folder structure.

- `*.Rproj`: RStudio project file for opening the project.
- `DESCRIPTION`: Metadata for a package including authors, license, dependencies, etc.
- `vignettes/`: Analysis scripts using R Markdown.
- `R/`: Project-specific R functions.
- `man/`: Manual of project-specific R functions.

There are additional folders and files required in this demo for an analysis project.

> People may use different folder names as it is not a standard R package folder.
> These folders and files often need to be added in `.Rbuildignore` to pass
> automated checking.

- `vignettes/data-adam/`: ADaM datasets in `.sas7bdat` format.
  - One may also put it in `inst/extdata/` following [R package convention](https://r-pkgs.org/data.html)
  - In reality, we suggest to have real data saved outside of this project (e.g., in a database)
- `vignettes/tlf/`: TLF outputs
- `renv.lock` and `renv/`: R package management using the `renv` package ([introduction](https://rstudio.github.io/renv/articles/renv.html)).
- `_pkgdown.yml`: [pkgdown](https://pkgdown.r-lib.org/articles/pkgdown.html) configuration file
- `.Rprofile`: Project startup file to setup running environment including R version, package repository, folder paths, etc.
  - We further use `inst/startup.R` and `R/zzz.R` to ensure the startup file is executed both when running `devtools::load_all()` and running regular build & reload.
