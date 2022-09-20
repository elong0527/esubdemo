library("pkglite")

# Prepare Propritory R package pack file 
"." %>%
  collate(file_ectd(), file_auto("inst")) %>%
  pack(output = "inst/r0pkgs.txt")

# Prepare Analysis Program 
input_path <- "vignettes/"
output_path <- "inst/"

convert_rmd <- function(filename, input_dir, output_dir) {
  knitr::purl(
    file.path(input_dir, paste0(filename, ".Rmd")),
    output = file.path(output_dir, paste0(filename, ".txt"))
  )
}

"tlf-01-disposition" %>% convert_rmd(input_path, output_path)
"tlf-02-population" %>% convert_rmd(input_path, output_path)
"tlf-03-baseline" %>% convert_rmd(input_path, output_path)
"tlf-04-efficacy" %>% convert_rmd(input_path, output_path)
"tlf-05-ae-summary" %>% convert_rmd(input_path, output_path)
"tlf-06-ae-spec" %>% convert_rmd(input_path, output_path)

# Unpack package and install
pkglite::unpack("inst/r0pkgs.txt", output = tempdir(), install = TRUE)
