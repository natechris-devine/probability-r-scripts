set.seed(16, sample.kind="Rounding")

# Generate Scores
act_scores <- rnorm(10000, 20.9, 5.7)

# 1a
mean(act_scores)
# 1b
sd(act_scores)
#1c
sum(act_scores>=36)
#1d
mean(act_scores > 30)
#1e
mean(act_scores <= 10)

# 2
x = 1:36
f_x <- dnorm(x,20.9,5.7)
plot(x, f_x)

# 3
z_scores <- (act_scores - mean(act_scores)) / sd(act_scores)
View(data.frame(act_scores, z_scores))

# 3a
mean(z_scores > 2)
# 3b
2 * sd(act_scores) + mean(act_scores)
# 3c
qnorm(.975, mean(act_scores), sd(act_scores))


# 4
cdf <- function(p) {
  mean(act_scores <= p)
}
probs <- sapply(1:36, cdf)
plot(x = 1:36, probs)

# 4a
min(which(probs >= .95))
# 4b
qnorm(.95, 20.9, 5.7)
# 4C
p <- seq(0.01, 0.99, 0.01)
sample_quantiles <- quantile(act_scores, p)
names(sample_quantiles[max(which(sample_quantiles < 26))])
# 4d
theoretical_quantiles <- qnorm(p, 20.9, 5.7)
library(ggplot2)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()
