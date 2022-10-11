---
output:
  html_document: default
  pdf_document: default
---




# Week 7: Plotting means and SEs

> Written by Tom Beesley & John Towse

Today we will continue to develop our skills in **data visualisation** with the `ggplot()` commands.  We will look at plotting means and standard errors, and at how geoms can share aesthetic mappings. We will explore our data on the famous "Stroop Task" and calculate

## Pre-lab work: online tutorial

**Online tutorial**: To access the [**pre-lab tutorial click here**](https://ma-rconnect.lancs.ac.uk/Week_7_LabPrep){target="_blank"} (on campus, or VPN required)

**Getting ready for the lab class** 

1. Create a folder and a Project for Week 7. [Click here for the instructions](#creating_project) from last week if you are unsure.

2. Download the [Week_7.zip](files/Week_7/Week_7.zip) and upload it into this new folder in RStudio Server. If you need them, [here are the instructions](#uploading_zip) from Week 2.

## RStudio Task 1: 

The "Stroop Effect" is a classic demonstration of automaticity of behaviour. Participants have to say the colour a word is printed in, which is an easy task for a "compatible" stimulus like \textcolor{green}{GREEN}, and a much more difficult task for an "incompatible" stimulus like \textcolor{red}{BLUE}. We can't help but read the text - it has seemingly become an automatic process.

![](files/Week_7/stroop.png)

In this task we will calculate the means and standard errors of the means. We will then plot them using ggplot(). 

1. Open the script "Week_7_Tasks.R" (if you've missed them, see the pre-lab steps above). **Important!** Use this script to complete the task. You should edit this as you go through the tasks, add comments to the code (#) and save this as a record of your completed lab work 

2. Run the first two lines of code `library(tidyverse)` and `data <- read_csv("data_stroop.csv")`

3. View the data with `view(data)`. You will see that the data are a little different from the data we have worked with previously. We have an ID variable, which gives a unique number for each person. Each person has 3 rows. This is because the different conditions of the stroop task is a *within-subjects* variable. For data like this it is often useful to have them arranged in what is referred to as "long format", with multiple rows for each response the participant provided. For the current data that means we have a variable called *stroop_condition*, which is our IV, and one called *stroop_time* which is our DV. 

4. Return to the Week_8_Tasks.R script. You will see we have provided you with the "scaffold" of a complete analysis process for the Stroop data. The raw data will be grouped and then summarised as means and SEs, and then plotted with columns and error bars. This is very similar to the commands used at the end of the learnr tutorial, and you can refer to that analysis if you get stuck here. **Your job is to carefully work through the code and fill in the parts that are marked MISSING**. By the end, you should have a graph with 3 columns, with the standard error of the means plotted on top.

5. Add a `labs()` layer to the plot to change the axis titles, and the title of the plot.

6. Change the theme of the plot

7. Map the fill aesthetic to the variable *stroop_condition*

8. Manually change the colours of the columns with (e.g.) `scale_fill_manual(values = c("darkgreen", "darkblue", "darkred"))`. Open the RColor.pdf in the Week 8 files for more colours than you'll probably ever want!

9. Click Export->Save as Image. Then show it off to the world (i.e., the Teams channel)

