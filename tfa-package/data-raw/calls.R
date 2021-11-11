library(tidyverse)
library(lubridate)

callsRaw <- read_csv("../inst/extdata/311_calls.csv")
calls <- callsRaw %>%
   dplyr::select(
      date = Date,
      time = Time,
      department = `Department Abbreviation`,
      zip = `Zip Code`,
      service = `Service Name`,
      solved_how = `Call Resolution`
   ) %>%
   mutate(
      between = time - lag(time)
   ) %>%
   dplyr::filter(
      year(date) == 2014,
      between > 0,
      time >= hms("08:00:00"),
      time <= hms("17:00:00")
   ) %>%
   dplyr::select(-between)

usethis::use_data(calls, overwrite = TRUE)
