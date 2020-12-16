#Libraries
library(gtools)
library(tidyverse)

head(esoph)
summary(esoph)
str(esoph)
nrow(esoph)

all_cases <- sum(esoph$ncases)
all_controls <- sum(esoph$ncontrols)

# 4A
esoph %>%
  filter(alcgp == "120+") %>%
  summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
  mutate(p_case = ncases / (ncases + ncontrols)) %>%
  pull(p_case)

# 4B
esoph %>%
  filter(alcgp == "0-39g/day") %>%
  summarize(ncases = sum(ncases), ncontrols = sum(ncontrols)) %>%
  mutate(p_case = ncases / (ncases + ncontrols)) %>%
  pull(p_case)

# General Use 4A, 4B
esoph %>% 
  group_by(alcgp) %>% 
  summarize(ncontrols=sum(ncontrols),ncases=sum(ncases)) %>%
  arrange(desc(alcgp)) %>%
  mutate(prob=ncases/(ncontrols+ncases))

# 4C
esoph %>%
  group_by(tobgp) %>%
  filter(!tobgp == "0-9g/day") %>%
  summarize(ncontrols=sum(ncontrols), ncases=sum(ncases)) 

# Kinda got there
tob_cases <- esoph %>%
  filter(tobgp != "0-9g/day") %>%
  pull(ncases) %>%
  sum()

tob_cases/all_cases

# 4D
tob_control <- esoph %>%
  filter(!tobgp == "0-9g/day") %>%
  pull(ncontrols) %>%
  sum()

tob_control/all_controls

# 5A For cases, prob in highest alcohol group
p_case_high_alc <- esoph %>% 
  filter(alcgp == "120+") %>%
  pull(ncases) %>%
  sum()/all_cases
p_case_high_alc

# 5B For cases, prob in highest tobacco group
p_case_high_tob <- esoph %>% 
  filter(tobgp == "30+") %>%
  pull(ncases) %>%
  sum()/all_cases
p_case_high_tob

# 5C For cases, prob highest tobacco & highest alcohol
p_case_high_alc_tob <- esoph %>%
  filter(tobgp == "30+" & alcgp == "120+") %>%
  pull(ncases) %>%
  sum()/all_cases
p_case_high_alc_tob

# 5D For cases, prob highest tobacco or highest alcohol
p_case_either_highest <- esoph %>%
  filter(tobgp == "30+" | alcgp == "120+") %>%
  pull(ncases) %>%
  sum()/all_cases
p_case_either_highest
# OR - if I had been storing the probabilities above
# p_case_either_highest <- p_case_high_alc + p_case_high_tob - p_case_high_alc_tob
# p_case_either_highest

#6A For control, prob highest alcohol
p_control_high_alc <- esoph %>% 
  filter(alcgp == "120+") %>%
  pull(ncontrols) %>%
  sum()/all_controls
p_control_high_alc

# 6B How many times more likely cases than controls to be in highest alcoholic group
p_case_high_alc/p_control_high_alc

# 6C For control, prob highest tobacco
p_control_high_tob <- esoph %>% 
  filter(tobgp == "30+") %>%
  pull(ncontrols) %>%
  sum()/all_controls
p_control_high_tob

#6D For control, prob highest tobacco & highest alcohol
p_control_high_alc_tob <- esoph %>%
  filter(tobgp == "30+" & alcgp == "120+") %>%
  pull(ncontrols) %>%
  sum()/all_controls
p_control_high_alc_tob

# 6E For control, prob highest tobacco or highest alcohol
p_control_either_highest <- p_control_high_alc + p_control_high_tob - p_control_high_alc_tob
p_control_either_highest

# 6F
p_case_either_highest/p_control_either_highest
