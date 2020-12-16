B <- 10000
stick_or_switch <- function(stick=TRUE) {
  results <- replicate(B, {
    doors <- as.character(1:3)
    prize <- sample(c("car", "goat", "goat")) # puts prizes in random order
    prize_door <- doors[prize == "car"] # note which door has prize
    my_pick <- sample(doors, 1) # note which door is chosen
    show <- sample(doors[!doors %in% c(my_pick, prize_door)],1)
    if (stick) {
      choice <- my_pick
    } else {
      choice <- doors[!doors %in% c(my_pick, show)]
    }
    choice == prize_door
  })
  mean(results) #probability of selected strategy working
}
stick_or_switch()

cat("Stick: ", stick_or_switch())
cat("Switch: ", stick_or_switch(stick=FALSE))
