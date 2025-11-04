#### When start course again ####

## Prepare
# - Copy previous course at Brightspace
# - Make a copy of the pref sheet https://docs.google.com/spreadsheets/d/14LOGGBGnriLFOAOxXPMsmjruxlMoN2Acl1Xf2FE5nnY/edit?usp=sharing (so can clean and use the current)
# - Delete the prefs (so the same link is valid) in sheet https://docs.google.com/spreadsheets/d/14LOGGBGnriLFOAOxXPMsmjruxlMoN2Acl1Xf2FE5nnY/edit?usp=sharing
# - Delete the old answers in the Google Form (under responses click ...)
# - Sign in to datacamp using Econ email and create a new classroom "Tools for Analytics YYYY" at https://www.datacamp.com/universities#classroom-form (valid from 1 Sep, students 150)
# - Add todo to your calendar 1/9 (add assignments and change signup link in link.md line 9). Set end date of a course to 01/03/20xx.
# - At Posit Cloud update the 'Tools for Analytics' workspace (R and packages) using `update.packages(ask = F)`. You may also need to install packages using:
if (!requireNamespace("tidyverse", quietly = TRUE)) {
   install.packages("tidyverse")
} else {
   update.packages("tidyverse", ask = FALSE)  # ask=FALSE updates without prompting
}
remotes::install_github("bss-osca/tfa-package", upgrade = TRUE, build = FALSE)


## Update slides
# This is done without GitHub actions. Just Knit and push afterwards


## Update packages
renv::restore()   # restore packages
bookdown::serve_book(dir = "book", output_dir = "_book", preview = FALSE, in_session = TRUE, quiet = FALSE)  # knit book to see if works
renv::update(prompt = F)
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


## Render book with warnings as errors
# Modify line 22 in common.R and knit the book


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




