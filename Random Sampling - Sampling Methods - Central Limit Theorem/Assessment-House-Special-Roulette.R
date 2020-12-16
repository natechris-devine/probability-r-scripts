a <- 6 # Winning bet payout
b <- -1 #Losing bet payout

p_win <- 5/38 
p_lose <- 1 - p_win

# 3a
mu <- a*p_win + b*p_lose
mu

# 3b
sigma <- abs(b-a) * sqrt(p_win*p_lose)
sigma

# 3c Expected val of average payout of 500 bets
n <- 500
mu # Exp. Val. of Average of n draws same as exp. val. of one draw from urn

# 3d Standard Error of average payout of 500 bets
sigma/sqrt(n)

# 3e Exp. Va. of Sum of 500 bets
mu * n

# 3f Sta. Err. sum of 500 bets
sigma * sqrt(n)

# 3g Prob losing money over 500 bets
pnorm(0, n*mu, sqrt(n)*sigma)
