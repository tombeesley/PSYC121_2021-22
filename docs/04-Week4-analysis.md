---
output:
  html_document: default
  pdf_document: default
---

# Week 4: Z-score calculations and DVs/IVs again

> Written by John Towse & Tom Beesley

## Pre-lab work

This week - again, there's a learnr tutorial to follow and help prep for what we are covering: <https://ma-rconnect.lancs.ac.uk/W4_LabPrep/>

## R Studio tasks

Last week we introduced two different ways to get a variable / column of scores investigated as a function of a separate column of data. In others words, describe the DV a function of an IV

Those two approaches involved

`aggregate(x = DV, by = list(IV), FUN = mean)`

and

`data.frame %>% group_by(IV) %>% summarise(mean_estimate = mean(DV))`

Use the [week 3 learnr tutorial](https://ma-rconnect.lancs.ac.uk/W3_LabPrep/) from last week to get more hints and practice with this, if you need to, alongside the week 4 tutorial.

### Task 1 - Climate change data

1. Download the [week4.zip](files/Week_4/Week_4.zip) file and upload it into R Studio server. If you need them, [here are the key instructions](#uploading_zip) from Week 2. This week the data is called "climate". Launch the week_4 R script as before.

Step 2. Once again, we're gong to be using commands from the tidyverse library (the pipe operator is one example) so we need to ensure that it's active. Run the command:

`library(tidyverse)`

(Nb. This command is the accompanying R script. You can access it from there.)

In the climate data frame, there are the following variables:

*human_CC* - A response to the question: How much do you think human activity contributes to climate change, as a percentage of overall climate change? Please enter a value between 0 (humans do not contribute to climate change at all) and 100 (human contribute entirely to climate change).

*UK_region* - where in the UK you used to live

*country_visits* - the number of countries you have visited

*visit_category* - a number between 1-3

-   1 means you have visited 1-4 countries

-   2 means you have visited 5-9 countries

-   3 means you have visited more than 9 countries

Step 3. Maybe belief in human activity as a contributor to climate change varies across the UK? Find out which region of the UK has the highest and the lowest belief in the relative role of human activity in climate change. Change the following command based on what was learnt last week and the current data described above

`Data_frame_name %>% group_by(IV) %>% summarise(mean_estimate = mean(DV))`

Step 4. Maybe views about climate change are affected by how well travelled you are? Because you see the global impacts of clmate change, or because travel (often producing carbon emissions) is a sign of not being worried. So use the climate_change_category to look at whether there are differences in rating of human contribution to climate change.

### Extra activity.

Come back to this afterwards for some extra practice if you want: Use the learnr activities to think about visualisation of the climate data. What graph(s) would be useful? How can you customise them?

## Z-scores

> Hint / Reminder: Sketch a normal (z score) distribution and mark the mean/mode, and mark off the relevant parts of the question so you know what you are trying to achieve and how to interpret any calculations you make.

> Hint/ Reminder 2. For questions 6 & 7, remember that from the week 4 lecture material, typically in psychology we use the 5% level as a cutoff to decide, in broadly described terms, whether something is extreme or unlikely vs. at least somewhat plausible or likely.

### z-scores 1: distributions

Q1. What is the relationship between the sign of a z-score and its position in a distribution?

Q2. If a distribution has a mean of 100 and a standard deviation of 10, what is the raw score equivalent to a z-score of 1.96?

Q3. If a distribution has a mean of 157 and a standard deviation of 19, what is the raw score equivalent to a z-score of 1?

### z-scores 2: Using z-score tables

Q4. What proportion of scores lie between the mean and a z-score of 0.5?

Q5. What is the combined proportion of scores lying between z=-1.2 and z=.85?

### z-scores 3: Applying z-scores to inferential problems

Q6. A Neuropsychologist has presented a test of face recognition to 200 neurotypical participants and finds that the scores are normally distributed with a mean of 85 and the standard deviation of 12. Two brain-damaged patients are also given the test. The one with right hemisphere brain damage scored 58 and the one with left hemisphere damage scored 67.

1.  What is the z score of the right hemisphere patient when compared to the neurotypical group?

2.  What proportion of neurotypical participants score lower that this patient?

3.  Is this patient likely to belong to the population of neurotypical participants? (justify your answer)

4.  What is the z score of the left hemisphere patient when compared to the neurotypical group?

5.  What proportion of neurotypical participants score lower than this patient?

6.  Is this patient likely to belong to the population of neurotypical participants? (justify your answer)

### Extra activity

Come back to this afterwards for some extra practice if you want:

Q7. Tim Bizzley has measured the foot size of men and women and found each to be normally distributed. The men have a mean size of 55 with a standard deviation of 5 and the women a mean of 33 and a standard deviation of 5. Joanna Toes has foolishly measured two individuals but forgotten to note their gender. These have foot sizes of 37 and 47. To which gender is each more likely to belong? What evidence is there for this?
