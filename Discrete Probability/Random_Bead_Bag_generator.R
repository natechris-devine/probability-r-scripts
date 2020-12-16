beads <- rep(c("green", "orange"), times= c(5,3)) # create 'jar' with 5 green and 3 orange beads
beads
sample(beads, 1)

B <- 10000 # how many times to draw 1 bead
events <- replicate(B, sample(beads, 1)) # draw 1 bead, B times
tab <- table(events) # make a table of outcome events
tab # view count tables 
prop.table(tab) #view table of outcome proportions

mean(beads=="green") # can be used to get probability
