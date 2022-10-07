library(tidyverse)

# TASK 1 - data processing

data_w8 <- read_csv("data_stroop.csv")

view(data_w8) # view the data

data_w8 %>% 
  ggplot() +
  geom_density(aes(x = time, fill = condition), alpha = .5) # you need to EDIT this for Q4

# create a new column which is the average time
data_w8 <- 
  data_w8 %>% 
  group_by(pID) %>% # for each participant...
  mutate(avg_time = mean(time)) # create a new average time from the mean of the time column

view(data_w8) # view the data

# distribution of average times
data_w8 %>% 
  ggplot() +
  geom_histogram(aes(avg_time)) # you need to EDIT this for Q6

# Do we need to filter out outliers?
# hint: you'll probably want to use an OR which is this symbol: |
data_w8_f <- 
  data_w8 %>% 
  filter(avg_time > 2 & avg_time < 15) # you need to EDIT this for Q7 - these are suggested values - could vary

# TASK 2 - conducting related samples t-tests

# calculate the means for the 3 levels of the condition IV
data_w8_f %>%
  group_by(condition) %>% # you need to EDIT this for Q1
  summarise(stroop_mean = mean(time)) # you need to EDIT this for Q1
 
# filter is used to select two levels of the IV - Q3-5

# COMPARISON 1
stroop_comparison <-
  data_w8_f %>%
  filter(condition == "compatible" | condition == "incompatible")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, time ~ condition, paired = TRUE)

# COMPARISON 1
stroop_comparison <-
  data_w8_f %>%
  filter(condition == "compatible" | condition == "control")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, time ~ condition, paired = TRUE)

# COMPARISON 1
stroop_comparison <-
  data_w8_f %>%
  filter(condition == "incompatible" | condition == "control")

# run the t-test comparing the means of these two levels
t.test(data = stroop_comparison, time ~ condition, paired = TRUE)

# TASK 3 - summarising and visualisation 

# calculate the means for the 3 levels of the condition IV
data_w8_summary <-# Notice we are creating/overwriting this object here 
  data_w8_f %>%
  group_by(condition) %>% # you need to EDIT this for Q1
  summarise(stroop_mean = mean(time),
            stroop_SE = sd(time)/sqrt(n())) # you need to EDIT the sd() for Q1 

view(data_w8_summary) # if you've done the above step correctly, you should have different means and SEs for each condition

# let's first plot the means
data_w8_summary %>%
  ggplot(aes(x = condition, y = stroop_mean)) + # map variables to x and y for Q3
  geom_col(size = 2)

# let's do the same again, but now with error bars
data_w8_summary %>%
  ggplot(aes(x = condition, y = stroop_mean)) + # map variables to x and y
  geom_col(size = 2) +
  geom_errorbar(aes(ymin = stroop_mean - stroop_SE, # edit this for Q5
                    ymax = stroop_mean + stroop_SE), # edit this for Q5
                width = .2)

# adding more colour to the figure!
data_w8_summary %>%
  ggplot(aes(x = condition, y = stroop_mean, fill = condition)) + # map variables to x and y
  geom_col(size = 1, 
           colour = "black") +
  geom_errorbar(aes(ymin = stroop_mean - stroop_SE, # edit this for Q5
                    ymax = stroop_mean + stroop_SE), # edit this for Q5
                width = .2,
                size = 1) +
  scale_fill_manual(values = c("gold", "dark green", "dark red")) +
  theme_classic()



