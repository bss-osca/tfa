devtools::install("tfa-package", quick = T, force = T)   # local
remotes::install_github("bss-osca/tfa-package", upgrade = FALSE)      # github
remotes::install_github("bss-osca/tfa-package", upgrade = TRUE, build = FALSE)      # github

renv::snapshot(prompt = FALSE, force = TRUE)

remotes::install_github("rstudio/gradethis")
remotes::install_github("lmullen/genderdata")
