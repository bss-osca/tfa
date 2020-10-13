
## ------------------
## Basics - Slide 11
age <- c(12, 56, 34)  # assignment to object
name <- c("Hans", "Sille", "Bo")  # character vector
people <- data.frame(Name = name, Age = age)  # data frame
people  # print object
people[1,]  # subsetting
people$Name  # column Name
lst <- list(p = people, status = 0, log = "Okay")  # a list (most abstract object)
lst

## Your turn - Slide 13

# - Extract column `Age` from `people`.
# - Extract the age of Hans from `people`.
# - Use `class` to find the data type of `p` in `lst`.
# - Why does this code not work?
#   ```r
# x <- 2
# Y <- 4
# x + y
# ```
# - Define a list with a vector, a number, a string and a boolean.


## Your turn - Solution
people$Age
people[1, 2] # or
people[people$Name == "Hans", "Age"]
class(lst$p)
# R is case sensitive
list(v = c(1,2), n = 3, s = "foo", l = TRUE)




## -------------------
## Functions - Slide 15

# - Create a vector `v` with numbers 2, 4, 6, 8 [see the help for function `seq` by writing `?seq` in the console and having a look at the examples].
# - What is the sum of `v`?
#   - What is the sum of the numbers in `x <- c(1:4, NA)` [see `?sum`]?
#   - Does `x` contain a missing value (`NA`) [see `?is.na`]
# - Convert `s <- "1.2"` to a number [see `?as.numeric`].
# - What is the return value of `class(x)`?
#   - Set `y <- NULL` and check if `y` is null [see `?NULL`].
# - Set `lst <- list(x = 3, y = "foo")` and check if `lst` contains an object `z` [use `is.null`].

## Your turn - Solution
v <- seq(2, 8, by = 2)
sum(v)
x <- c(1:4, NA)
sum(x)
sum(x, na.rm = TRUE)
is.na(x)
any(is.na(x))
s <- "1.2"
s <- as.numeric(s)
y <- class(x)
class(y)
lst <- list(x = 3, y = "foo")
is.null(lst$x)
is.null(lst$z)



## -------------------
## Pipes - Slide 17
library(tidyverse)   # define the pipe operator
x <- 16
x %>% sqrt() %>% log2()

x <- c(1:4, NA, 34)
x <- x^2
x <- sum(x, na.rm = TRUE)
x <- sqrt(x)
x

## Your turn - Slide 18

# Use pipes to calculate
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

