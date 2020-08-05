library(tidyverse)
zips <- as_tibble(read.csv2("../inst/extdata/zip_jutland.csv", stringsAsFactors = F))
usethis::use_data(zips, overwrite = TRUE)
