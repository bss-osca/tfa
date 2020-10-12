
## ------------------
## Basics
age <- c(12, 56, 34)  # assignment to object
name <- c("Hans", "Sille", "Bo")  # character vector
people <- data.frame(Name = name, Age = age)  # data frame
people  # print object
people[1,]  # subsetting
people$Name  # column Name
lst <- list(p = people, status = 0, log = "Okay")  # a list (most abstract object)
lst

## Your turn - Solution
people$Age
people[1, 2] # or
people[people$Name == "Hans", "Age"]
class(lst$p)
# R is case sensitive
list(v = c(1,2), n = 3, s = "foo", l = TRUE)

## -------------------
## Pipes
library(tidyverse)   # define the pipe operator
x <- 16
x %>% sqrt() %>% log2()

x <- c(1:4, NA, 34)
x <- x^2
x <- sum(x, na.rm = TRUE)
x <- sqrt(x)
x

## Your turn - Solution
x <- c(1:4, NA, 34)^2 %>% sum(na.rm = TRUE) %>% sqrt() # or
x
x <- c(1:4, NA, 34) %>% `^`(2) %>% sum(na.rm = TRUE) %>% sqrt()
x

