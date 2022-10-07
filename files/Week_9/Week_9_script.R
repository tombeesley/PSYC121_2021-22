library(tidyverse)
library(pwr)
library(rstatix)

data_w9 <- read_csv("music_smedia.csv") # read in the data

# TASK 1 - data visualisation and cleaning

data_w9 %>% 
  ggplot() +
  geom_jitter(aes()) # EDIT for Q1-3

# draw a histogram of the instagram followers data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes()) # EDIT for Q4

# draw a histogram of the facebook friends data
data_w9 %>% 
  ggplot() +
  geom_histogram(aes()) # EDIT for Q4

# z-transform of facebook friends and instagram followers
data_w9 <- 
  data_w9 %>% 
  mutate(z_FF = scale(), # EDIT for Q6
         z_IF = scale()) # EDIT for Q6

# You can add descriptive statistics below - Q6

# removing outliers
data_w9_f <- 
  data_w9 %>% 
  filter(z_FF  & z_IF ) # EDIT for Q8


# TASK 2 - Testing differences with a t-test

# summarise the data
data_w9_f %>% 
  group_by() %>% # EDIT for Q9
  summarise(meanFF = , # EDIT for Q9
            meanIF = , # EDIT for Q9
            N = n()) # how many in each group - no need to edit this

# collect the relevant data for t-test

# test for equality of variances
var.test(data = data_w9_f, facebook_friends ~ music_pref) 

# perform the t-test
t.test(data = data_w9_f, 
       facebook_friends ~ music_pref, 
       paired = FALSE, 
       var.equal = ) # EDIT for Q12

# add another var.test and t.test for Q13

# TASK 3 - Power calculations

data_stroop <- read_csv("data_stroop.csv")

# this code removes the control condition from the Stroop data
data_stroop <- 
  data_stroop %>% 
  filter(condition == "compatible" | condition == "incompatible")

# find the effect size (d) for the Stroop effect
cohens_d(data = data_stroop, 
         time ~ condition)

# what power would we achieve?
pwr.t.test(n = , d = , type = "paired") # EDIT for Q18

# what N would we need?
pwr.t.test(power = , d = , type = "paired") # EDIT for Q19

# what effect size could we detect?
pwr.t.test(power = , n = , type = "paired") # EDIT for Q20








