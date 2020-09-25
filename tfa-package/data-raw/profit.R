library(tidyverse)
message("Set locale: ", Sys.setlocale("LC_ALL", "English"), "\n")
profit <- read_csv("../inst/extdata/profit_full.csv")

usethis::use_data(profit, overwrite = TRUE)

