set.seed(563)
lottery <- rnbinom(56, 20, 0.34)
lottery

usethis::use_data(lottery, overwrite = TRUE)
