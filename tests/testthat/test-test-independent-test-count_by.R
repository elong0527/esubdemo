library(dplyr)
adsl <- r2rtf::r2rtf_adsl

test_that("test count_by can summarize number of subjects", {
  x <- count_by(adsl, grp = "TRT01P", var = "SEX")
  y <- adsl %>% 
    subset(TRT01P == "Placebo") %>% 
    count(SEX)
  expect_equal(as.numeric(x$n_Placebo), y$n)  
})
