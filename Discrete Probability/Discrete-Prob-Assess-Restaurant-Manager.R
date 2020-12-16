library(gtools)
entrees <- 1:6
sides <- 1:6
drinks <- 1:2

# 2A: number of combinations
6 * nrow(combinations(6,2)) * 2

# 2B
6 * nrow(combinations(6,2)) * 3

# 2C
6 * nrow(combinations(6,3)) * 3

# 2D
entreeCalc <- function(num_e = 6) {
  num_e * nrow(combinations(6,2)) * 3
}

sapply(1:12, entreeCalc)
# -- Orr
# library(tidyverse)
# # 
# entree_choices <- function(x){
#   x * nrow(combinations(6,2)) * 3
# }
# 
# combos <- sapply(1:12, entree_choices)
# 
# data.frame(entrees = 1:12, combos = combos) %>%
#   filter(combos > 365) %>%
#   min(.$entrees)
# rm(list=c("entree_choices", "combos"))

# 2E
side_choices <- function(x) {
  6 * nrow(combinations(x,2)) * 3
}

data.frame(sides = 2:12, combos = sapply(2:12, side_choices))

# OR
# side_choices <- function(x){
#   6 * nrow(combinations(x, 2)) * 3
# }
# 
combos <- sapply(2:12, side_choices)

data.frame(sides = 2:12, combos = combos) %>%
  filter(combos > 365) %>%
  min(.$sides)


