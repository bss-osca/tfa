devtools::install("tfa-package", quick = T, force = T)   # local
remotes::install_github("bss-osca/tfa/tfa-package", upgrade = FALSE)      # github
renv::snapshot(prompt = FALSE, force = TRUE)

remotes::install_github("rstudio/gradethis")
