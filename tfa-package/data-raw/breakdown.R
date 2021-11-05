set.seed(563)
breakdown <- round(rnorm(236, 184, 30) + rbinom(236, 1, 0.01) * rnorm(236, 10, 10))
breakdown

usethis::use_data(breakdown, overwrite = TRUE)
