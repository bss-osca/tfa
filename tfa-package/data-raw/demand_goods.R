library(here)
library(readxl)
library(tidyverse)
library(lubridate)

message("Set locale: ", Sys.setlocale("LC_ALL", "English"), "\n")

dat1 <- read_excel(here("../vba/old/vba-compond-poisson-solution.xlsm"), sheet = "DataLEK51") %>%
   transmute(date = `Arrival Date`, demand = `Order size`) %>%
   mutate(product = 1)
   #mutate(between = as.numeric(date - lag(date), units="days"), product = 1) %>% print

dat2 <- read_excel(here("../vba/old/vba-compond-poisson-solution.xlsm"), sheet = "DataLEK52") %>%
   transmute(date = `Arrival Date`, demand = `Order size`) %>%
   mutate(product = 2)
   #mutate(between = as.numeric(date - lag(date), units="days"), product = 2) %>% print

demand_goods <- bind_rows(dat1, dat2) %>%
   print()

usethis::use_data(demand_goods, overwrite = TRUE)
