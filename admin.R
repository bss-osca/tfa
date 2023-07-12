## When start course again
renv::restore()   # restore packages
bookdown::serve_book(dir = "book", output_dir = "_book", preview = FALSE, in_session = TRUE, quiet = FALSE)  # knit book to see if works
renv::update()
renv::snapshot()

icons::download_fontawesome()

## Install packages
devtools::install("tfa-package", quick = T, force = T)   # local
remotes::install_github("bss-osca/tfa-package", upgrade = FALSE)      # github
remotes::install_github("bss-osca/tfa-package", upgrade = TRUE, build = FALSE)      # github

renv::snapshot(prompt = FALSE, force = TRUE)

remotes::install_github("rstudio/gradethis")
remotes::install_github("lmullen/genderdata")
remotes::install_github("mitchelloharawild/icons")
remotes::install_github("rstudio-education/dsbox")
