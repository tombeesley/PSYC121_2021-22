library(tidyverse) # load the tidyverse functions

# Week_6_Task_2
# this is a command to read in the data - 
# note that this is (pretty much) the same as using the "Import Dataset" button
data_w6 <- read_csv("data_phone.csv") # read in the data

# Note here that a line of code can be split across multiple lines
# It's good practice to break the lines in logical places (e.g., after a pipe)

# draw a graph Q1-7
data_w6 %>%
  ggplot() + 
  geom_point(aes(y = screen_time_actual, x = screen_time_estimate), colour = "red") # this is the line of code you eventually need to edit


# draw a graph Q8
data_w6 %>%
  ggplot() + 
  geom_point(aes(y = screen_time_actual, 
                 x = screen_time_estimate, 
                 colour = phone_type)) # answer to Q8

# draw a graph Q9
data_w6 %>%
  ggplot() + 
  geom_jitter(aes(y = screen_time_actual, 
                 x = screen_time_estimate, 
                 colour = phone_type)) # answer to Q8

# Week_6_Task_3 - Do people underestimate or overestimate their phone time use?

# create a new column (mutate) to reflect the difference
data_phone_diff <- # note: assigning the output to a new object (data_phone_diff)
  data_w6 %>%
  mutate(est_diff = screen_time_actual - screen_time_estimate)

# remove the 0s and count how many positives and negatives
data_phone_diff %>%
  filter(est_diff != 0) %>% # remove the 0s
  count(est_diff > 0) # count how many positive and negatives

# conduct a binomial test to see whether people underestimated or overestimated phone usage

binom.test(61,99) # they can also use (38, 99) to get the same result (probabilities are symmetrical)
