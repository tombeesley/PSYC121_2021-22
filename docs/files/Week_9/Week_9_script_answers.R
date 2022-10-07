library(tidyverse)
library(pwr)
library(rstatix)

data_w9 <- read_csv("music_smedia.csv") # read in the data

# TASK 1 - data visualisation and cleaning

data_w9 %>% 
  ggplot() +
  geom_jitter(aes(x = rock_score, y = pop_score, colour = music_pref))

# draw a histogram of the instagram followers data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes(x = instagram_followers))

# draw a histogram of the facebook friends data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes(x = facebook_friends))

data_w9 <- 
  data_w9 %>% 
  mutate(z_FF = scale(facebook_friends), # z-transform of facebook friends
         z_IF = scale(instagram_followers)) # z-transform of instagram followers

# descriptive stats
mean(data_w9$z_FF) # for example - also sd(), min(), max()

# removing outliers
data_w9_f <- 
  data_w9 %>% 
  filter(z_FF < 2.5 & z_IF < 2.5) # 


# TASK 2 - Testing differences with a t-test

#optional plot - probably remove
data_w9_f %>% 
  ggplot() +
  geom_point(aes(x = instagram_followers, y = facebook_friends, colour = music_pref))

# summarise the data
data_w9_f %>% 
  group_by(music_pref) %>% 
  summarise(meanFF = mean(facebook_friends),
            meanIF = mean(instagram_followers),
            N = n()) # how many in each group - no need to edit this

# collect the relevant data for t-test

# test for equality of variances
var.test(data = data_w9_f, facebook_friends ~ music_pref)

# perform the t-test
t.test(data = data_w9_f, 
       facebook_friends ~ music_pref, 
       paired = FALSE, 
       var.equal = TRUE) # change this based on the results of your levene test


# TASK 3 - Power calculations

data_stroop <- read_csv("data_stroop.csv")

# this code removes the control condition from the Stroop data
data_stroop <- 
  data_stroop %>% 
  filter(condition == "compatible" | condition == "incompatible")

# find the effect size (d) for the Stroop effect
cohens_d(data = data_stroop, 
         time ~ condition)

pwr.t.test(n = 20, d = .92, type = "paired") # what power would we achieve?

pwr.t.test(power = .8, d = .92, type = "paired") # what N would we need?

pwr.t.test(power = .9, n = 40, type = "paired") # what effect size could we detect?








