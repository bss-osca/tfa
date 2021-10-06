## ---- child = "setup.Rmd", echo=FALSE-------------------------------------------------------------

## ----setup, include=FALSE-------------------------------------------------------------------------
# Common setup for all the slides

# R options
options(
  htmltools.dir.version = FALSE,
  dplyr.print_min = 6, 
  dplyr.print_max = 6,
  width = 100
  )
# figure height, width, dpi
# figure height, width, dpi
knitr::opts_chunk$set(echo = TRUE, 
                      fig.width = 6, 
                      fig.asp = 0.5,
                      fig.path="img/",
                      out.width = "100%",
                      fig.align = "center",
                      dpi = 300,
                      message = FALSE)
# set seed
set.seed(1234)
# fontawesome
htmltools::tagList(rmarkdown::html_dependency_font_awesome())
# magick
dev.off <- function(){
  invisible(grDevices::dev.off())
}
# countdown
library(countdown)   # devtools::install_github("gadenbuie/countdown")
# conflicted
library(conflicted)
conflict_prefer("filter", "dplyr")
library(icons)

file.copy("../book/links.md", "links.md", overwrite = T)



## ----include=FALSE--------------------------------------------------------------------------------
# use xaringan::inf_mr(cast_from = ".") to preview


## ----echo=FALSE, out.width="80%", fig.align="center"----------------------------------------------
knitr::include_graphics("img/rstudio-anatomy.png")


## -------------------------------------------------------------------------------------------------
8738787213 / 1653   # as a calculator
"Lars"  # a character/string
c(1,4)  # a vector
1:4 # a vector (sequence)


## -------------------------------------------------------------------------------------------------
age <- c(12, 56, 34)  # assignment to object 
name <- c("Hans", "Sille", "Bo")  # character vector
people <- data.frame(Name = name, Age = age)  # data frame
people  # print object
people[1,]  # subsetting 1. row
people$Name  # column Name


## -------------------------------------------------------------------------------------------------
lst <- list(p = people, status = 0, log = "Okay")  # a list (most abstract object)
lst


## ----echo=FALSE-----------------------------------------------------------------------------------
countdown(minutes = 5, top = "0")


## -------------------------------------------------------------------------------------------------
people$Age
people[1, 2] # or
people[people$Name == "Hans", "Age"]
class(lst$p)
# R is case sensitive
list(v = c(1,2), n = 3, s = "foo", l = TRUE)


## ----eval=FALSE-----------------------------------------------------------------------------------
## do_this(to_this)
## do_that(to_this, to_that, with_those)


## ----echo=FALSE-----------------------------------------------------------------------------------
countdown(minutes = 5)


## -------------------------------------------------------------------------------------------------
library(tidyverse)   # define the pipe operator
x <- 16
x %>% sqrt() %>% log2()


## -------------------------------------------------------------------------------------------------
x <- c(1:4, NA, 34)
x <- x^2
x <- sum(x, na.rm = TRUE)
x <- sqrt(x)
x


## ----echo=FALSE-----------------------------------------------------------------------------------
countdown(minutes = 5)


## -------------------------------------------------------------------------------------------------
x <- c(1:4, NA, 34)^2 %>% sum() %>% sqrt() # or
x
x <- c(1:4, NA, 34) %>% `^`(2) %>% sum() %>% sqrt()
x


## ----copy to docs, include=FALSE------------------------------------------------------------------
file.copy(list.files(pattern = ".html"), "../docs/slides/", overwrite = T)
file.copy("./slides.css", "./libs/", overwrite = T)
file.copy("libs", "../docs/slides/", recursive = T)
file.copy("img", "../docs/slides/", recursive = T)
system2("Rscript", args = "-e 'rmarkdown::render(\"index.Rmd\", quiet = TRUE)'")


## ----links, child="links.md", include=FALSE-------------------------------------------------------



