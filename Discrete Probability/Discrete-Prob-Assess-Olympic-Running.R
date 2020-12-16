library(gtools)
medals <- permutations(8,3)
nrow(medals)

jamaica <- permutations(3,3)
nrow(jamaica)

nrow(jamaica)/nrow(medals)


runners <- c("Jamaica", "Jamaica", "Jamaica", "USA", "Ecuador", "Netherlands", "France", "South Africa")

B <- 10000
set.seed(1)
results <- replicate(B, {
  winners <- sample(runners, 3)
  winners[1] == "Jamaica" && winners[2] == "Jamaica" && winners[3] == "Jamaica"
  #
})
mean(results)