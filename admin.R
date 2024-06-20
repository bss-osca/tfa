#### When start course again ####

## Prepare
# - Copy previous course at Brightspace
# - Make a copy of the pref sheet https://docs.google.com/spreadsheets/d/14LOGGBGnriLFOAOxXPMsmjruxlMoN2Acl1Xf2FE5nnY/edit?usp=sharing (so can clean and use the current)
# - Delete the prefs (so the same link is valid) in sheet https://docs.google.com/spreadsheets/d/14LOGGBGnriLFOAOxXPMsmjruxlMoN2Acl1Xf2FE5nnY/edit?usp=sharing
# - Signin to datacamp using Econ email and create a new classroom "Tools for Analytics YYYY" at https://www.datacamp.com/universities#classroom-form (valid from 1 Sep, students 150)
# - Add todo to your calendar 1/9 (add assignments and change signup link in link.md line 9)
# - At Posit Cloud update the 'Tools for Analytics' workspace (R and packages)


## Update slides
# This is done without GitHub actions. Just Knit and push afterwards


## Update packages
renv::restore()   # restore packages
bookdown::serve_book(dir = "book", output_dir = "_book", preview = FALSE, in_session = TRUE, quiet = FALSE)  # knit book to see if works
renv::update()
renv::snapshot()
icons::download_fontawesome()
# Restart R
bookdown::serve_book(dir = "book", output_dir = "_book", preview = FALSE, in_session = TRUE, quiet = FALSE)  # knit book to see if works
# Check github actions: commit, pull and push and check if GHA works


## Update exams
# - Copy missing exams to the exams folder
# - Convert exams to exercises
bookdown::serve_book(dir = "book", output_dir = "_book", preview = FALSE, in_session = TRUE, quiet = FALSE)  # knit book to see if works
# Check github actions: commit, pull and push and check if GHA works



#### Install packages (if missing) ####
# TFA package
devtools::install("../tfa-package", quick = T, force = T)   # local
remotes::install_github("bss-osca/tfa-package", upgrade = FALSE)      # github
remotes::install_github("bss-osca/tfa-package", upgrade = TRUE, build = FALSE)      # github
# non CRAN packages
remotes::install_github("rstudio/gradethis")
remotes::install_github("lmullen/genderdata")
remotes::install_github("mitchelloharawild/icons")
remotes::install_github("rstudio-education/dsbox")
