# Old Sat Lol
n <- 44 # number of questions
a <- 1 # correct points
b <- -0.25 # incorrect points

# 1a Prob of guessing question correctly
p_correct <- 1/5
p_incorrect <- 4/5

# 1b Expect Val of guessing
mu <- p_correct*1 + (-0.25)*p_incorrect

# 1c expected score of guessing all questions
n * mu

# 1d Standard Error of guessing all questions
sigma <- abs(b-a) * sqrt(p_correct*p_incorrect)
sigma * sqrt(44)

# 1e Prob scores 8 or higher using CLT
1-pnorm(8, mu*n, sigma * sqrt(n))

# 1f Monte Carlo
B <- 10000
set.seed(21, sample.kind = "Rounding")
test <- replicate(B, {
  res <- sample(c(a,b), n, prob = c(p_correct, p_incorrect), replace = TRUE)
  sum(res)
})
mean(test >= 8)

# New SAT
n <- 44 # number of questions
a <- 1 # correct points
b <- 0 # incorrect points

p_correct <- 1/4
p_incorrect <- 1 - p_correct

# 2a Expected Score when guessing on this test
mu <- p_correct*a + (b)*p_incorrect
n * mu

sigma <- abs(b-a) * sqrt(p_correct*p_incorrect)

# 2b Lowest p such that probability of scoring over 35 exceeds 80%
p <- seq(0.25, 0.95, 0.05) # range of correct answer probabilities
exp_val <- sapply(p, function(x){
  mu <- n * a*x + b*(1-x)
  sigma <- sqrt(n) * abs(b-a) * sqrt(x*(1-x))
  1-pnorm(35, mu, sigma)
})

min(p[which(exp_val > 0.8)])
