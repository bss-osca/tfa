library(tidyverse)
message("Set locale: ", Sys.setlocale("LC_ALL", "English"), "\n")
zips <- as_tibble(read_csv2("../inst/extdata/zip_jutland.csv")) # , locale = locale(encoding = "ISO-8859-1")
# iconv(zips$Area, from = "UTF-8", to = "UTF-8")
# Encoding(zips$Area)

usethis::use_data(zips, overwrite = TRUE)

