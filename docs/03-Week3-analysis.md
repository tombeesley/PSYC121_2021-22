---
output:
  html_document: default
  pdf_document: default
---

# Week 3: DVs and IVs in R Studio

> Written by John Towse & Tom Beesley

## Pre-lab work

Last week we asked you to

-   Complete the teaching dataset survey
-   Prepare for the lab class with the learnr tutorial
-   Complete some R Studio exercises working with data and a script to get some descriptives and some data

This week - again, there's a learnr tutorial to follow and help prep for this week's activties : <https://ma-rconnect.lancs.ac.uk/W3_LabPrep/>

About 1/3 of students at the time of writing this had yet to complete the teaching survey. We'd really appreciate more completions so we can work with a good sample of data this term, and as a reminder, the data are here: <https://lancasteruni.eu.qualtrics.com/jfe/form/SV_6rLPbl1YI8Y2WXj>

Since we've got less data than we would expect, we can't yet use the data in this term's activities.

## R Studio tasks

For the "penelope21" data in week 2, we provided you with estimates data, and you were able to generate descriptive statistics for the estimates (if not, please go back and work through that part of the week 2 lab sheet again). You also found the weight estimates for the female and non-female guesses, right?

However, in order to find the estimates separately for gender identity, we needed to have a column for each gender category. Whilst that worked, it could get cumbersome over time always to work with data created like that.

*There is a better way*

### Task 1 - penelope21 data

Download the [week3.zip](files/Week_3/Week_3.zip) file and upload it into R Studio server. If you need them, [here are the key instructions](#uploading_zip) from Week 2.

Import the "penelope21" data using the `read.csv()` command (if unsure, see here in [Week 2](#basic_script)), and launch the R script.

This week, we want to explore commands from the tidyverse library (toolkit) which can help us do more powerful things more elegantly. So let's get R to work with the tidyverse library

`library(tidyverse)`

(Nb. This command is the accompanying R script. You can access it from there.)

This time, let's ask for the estimate data arranged by identity:

`aggregate(x = penelope21$estimate, by = list(penelope21$identity), FUN = mean)`

First, let's try this! What do you get? Does this match what we did last week when we calculated the mean for the female and for the other group?

Second, let's look at what is happening here:

`aggregate` This is a command to get descriptive statistics 
Remember we can use help to find more about this command!

`x=`\
This defines what column we are analyzing

`by=list`\
Now we tell R how to group the estimate data, and which column does that

`FUN=mean`\
Specifies which descriptive function is being asked for
Can you explore whether you can call on alternate measures?)

### group_by() {#group_by}

There's another way that also allows us to group scores by a (nominal) variable. This is explored in the learnr tutorial, which should help you create the command the get weight estimates broken down by gender identity. You need to define the data frame for the estimates data, and the gender IV and the estimates DV

`*MISSING* %>% group_by(*MISSING*) %>% summarise(mean_estimate = mean(*MISSING*))`

First, try this command and see what you get. If you run this command as entered, it won't work. So now use your experience at skills from the above and the learnr tutorial to work out what is required.

Note

`%>%`\
This is a "pipe operator", basically take the output from the left and feed it into the requests on the right. `Summarise`\
Provide summary statistics information for the specified variable as specified (whether mean, median etc)

### The assignment operator

As well as learning about the pipe operator, we want to introduce another important element of the R command line syntax: the assignment operator.

Probably without knowing about it, we've been using this already! When a dataset is imported into R Studio from the menu, a command is created such as

penelope21 \<- read.csv("\~/penelope21.csv")

What this does is look for the csv datafile called 'penelope21', and assign it to an object / variable called 'penelope21'

We could create any object name we wanted (within limits of names already known to R Studio). If we wanted to work with something called "week_3\_data" we could use

week_3\_data \<- read.csv("\~/penelope21.csv")

In R Studio, we would call on "week_3\_data" rather than "penelope21" in the command lines.

### Task 2 - Salary20 data

Using aggregate and summarise may not seem like much progress, because they are just replicating what we had already done with mean() is week 2. However (a) this emphasizes that there are often several ways to get at the same thing in R (b) now we know about grouping, we can start to do more efficient and informative things.

Now, let's turn to the guesses made about median salary in the UK. We can get the data (created in 2020) from the file "salary20" in the week 3.zip file;

Let's take a peek at the dataset with

`glimpse(salary20)`

Glimpse pretty much does what you might think from the meaning of the word -- it just gives us a data sample (handy because this is a much bigger dataset) and shows that we have 3 columns; UK_region (where someone lives, note 'other' probably equals Northern Ireland, Europe, China, etc, family_position (age relationship with siblings), and median_salary guess.

By the way, the govt statistics say the actual median income in 2019 was approx. £30,350 <https://www.statista.com/statistics/1002964/average-full-time-annual-earnings-in-the-uk/>

A)  Can you use the "aggregate" command from task 1 to find out the salary guesses as a function of where someone lives? That is, can you adapt that code for this problem?
B)  Can you use the aggregate command to find out salary guess as a function of family relationships? (if you are the youngest child maybe you have older siblings earning money that changes your evaluation?)
C)  Can you get a breakdown of guess as a function of BOTH UK region AND family relationship together?
D)  Can you adapt the "summarise" command to display salary guesses as a function of where someone lives?
E)  Use R Studio to figure out the overall mean salary estimate and the standard deviation. Calculate by hand what salary estimate would have a z score of z=-1.5?
