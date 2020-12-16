# checking for duplicated birthdays in one 50 person group
n <- 50
bdays <- sample(1:365, n, replace = TRUE) # generate n random birthdays
any(duplicated(bdays)) # check if any birthdays duplicated

# Monte Carlo simulation 
B <- 10000
results <- replicate(B, {
  bdays <- sample(1:365, n, replace = TRUE)
  any(duplicated(bdays))
})
mean(results)

# rm(list=ls()) #clear all variables