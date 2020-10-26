library(tidyverse)
message("Set locale: ", Sys.setlocale("LC_ALL", "English"), "\n")
world_pop <- read_csv("../inst/extdata/world_pop.csv")

usethis::use_data(world_pop, overwrite = TRUE)

