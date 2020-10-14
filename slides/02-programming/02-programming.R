

## Slide 3 ----
x <- c(1, 2, 45, NA, -1)
x > 0
x > -100
any(x > 0)
all(x > -100)


## Slide 11 ----
library(tidyverse)

## Hint
# dice <- 1:6
# card_suit <- c("clubs", "diamonds", "hearts", "spades")
# card_number <- c("ace", 2:10, "jack", "queen", "king")
# ite <- expand_grid(Dice = dice,
#                    Card_suit = ___,
#                    ___)
# for (r in 1:nrow(ite)) { # iterate over rows
#    cat("Dice = ", ___, " and card = ", ___, " (", ___, ").\n", sep="")
# }




## Slide 17 ----

## Hint
# get_combinations <- function(dice, card) {
#   ite <- expand_grid(___)
#   found <- FALSE
#   for (i in 1:nrow(ite)) {
#     ___
#   }
#   return(found)
# }
# get_combinations(dice = c(2,3), card = c("2-spade", "ace-dimond"))
# get_combinations(dice = c(3,1), card = c("10-heart", "king-dimond"))



## Slide 18

# get_PV <- function(FV, r = 0.1, n, round = FALSE) {
#  ---
# }
# get_PV(100, n = 7)
# get_PV(100, n = 7, round = TRUE)
# get_PV(100, n = 7, r = 0.5)

