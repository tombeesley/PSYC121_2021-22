---
output:
  html_document: default
  pdf_document: default
---




# Week 9: [DRAFT - do not complete yet]

> Written by Tom Beesley & John Towse

## Pre-lab work: online tutorial

**Online tutorial**: You must make every attempt to complete this before the lab! To access the [**pre-lab tutorial click here**](https://ma-rconnect.lancs.ac.uk/Week_9_LabPrep){target="_blank"} (on campus, or VPN required)

**Getting ready for the lab class** 

1. Create a folder and a Project for Week 9. [Click here for the instructions](#creating_project) from Week 6 if you are unsure.

2. Download the [Week_9.zip](files/Week_9/Week_9_new.zip) file and upload it into this new folder in RStudio Server. If you need them, [here are the instructions](#uploading_zip) from Week 2.

## RStudio Task 1: Data visualisation and cleaning

In this class we will be exploring some data on music preferences and social media use. In our survey we asked people to rate how much they liked various music artists out of 5. There were some "pop" artists like Beyonce and Taylor Swift, and some "rock" artists like Coldplay and Nirvana. In the data we have grouped the ratings for pop artists together, and similarly for the rock artists: each respondent therefore gets a *pop_score* and a *rock_score*. We've also turned these ratings into a *categorial variable*, which reflects whether someone liked pop more than rock ("pop-tastic"), or not ("rock-on" - either they preferred rock, or they had no preference).

The other variables relate to social media use. We have the *instagram_followers*  and *facebook_friends*, which provide a (fairly crude) measure of how much someone engages with these social media platforms. 

1. Let's first take a look at the data on music preferences. We might think that people who like rock music are less likely to be in to pop music (and vice versa). To look at this *relationship* we can plot one score on the x axis and one on the y axis. Read in the data (make sure it's called "data_w9") and complete the `geom_jitter()` code to do this (we use `geom_jitter()` here because there are overlapping points. 

2. Consider the pattern of data you see. In general, do people who really like pop (high scores) like or dislike rock? Conversley, do those who like rock like or dislike pop? What pattern would you expect for these different relationships in preference? Talk about it with your table.

3. Next you can add a mapping between *music_pref* and *colour* to show our boundaries for the three levels of the categorical variable

4. Let's take a look at the two social media variables. Complete the code for the two histogram plots to view the data on facebook friends and instagram followers.

5. You'll see that for both variables, there are some extreme values (some people have >1000 friends and > 2000 followers). These outlier values can be problematic when we run our statistical tests, so (like last week) we probably want to control their influence by removing them. As you saw in your online tutorial, we can convert the data to z scores, and then remove z values above and below certain values.

6. Let's create two "z-transform columns". Complete the code by adding the two variable (column) names to the code. View the *data_w9* object to check these have been created correctly. Like in the online tutorial, you should calculate some descriptive statistics for these new columns if you like (e.g., `mean()`, `sd()`, `min()` and `max()`).

7. We know from our lectures on the z distribution that values of greater than 2 (or less than -2) reflect around 5% of the distribution, and values greater than 3 (or less than -3) represent less than 1% of the distribution:

![](files/Week_9/z_score_figure.png)
8. Let's consider an outlier any value that has a z of 2.5. Complete the filter command to remove the data where the z value is greater than 2.5 for both the *z_FF* column and the *z_IF* column. Note you only need to look at positive values: our histogram has already shown that these data are positively skewed with outliers only at the positive end (you cannot have fewer than 0 friends/followers; these are ratio scales with a true 0 value). Complete the filter command to remove the positive z values above 2.5. When completing this, note the use of the AND (&) symbol: We want to KEEP z values that are below 2.5 for *z_FF* and for *z_IF* the variables. 

## RStudio TASK 2: Summarising and testing for differences

9.  Let's have a look at whether people's music preferences relate to their social media use. To do this, let's use our category variable *music_pref*. Complete the `group_by()` and `summarise()` commands to give the mean values of *facebook_friends* (meanFF) and *instagram_followers* (meanIF) for each level of the *music_pref* variable.  You don't need to edit the `N = n()` line - this provides the number of participants at each level of the *music_pref* variable

10. What do the means suggest? Are those rock-grandads stuck in the last decade on Facebook? Are the pop-divas insta-addicts? 

11. Let's test if these differences are real. First, note that most people liked pop music more than rock music. We have unequal sample sizes, and potentially unequal variances. Run the `var.test()` code to check if the variances of the two samples are similar (homogeneity of variance). If this test produces a p value less that .05, then the variances in the two samples are unequal. That will have consequences for how we run the `t-test()` in the next step. 

12. Now let's run the t-test. This week we are comparing data from different samples of participants (those who preferred pop and those who preferred rock). We need to tell the t-test that the data are NOT paired (`paired = FALSE`). The result of the `var.test()` in the last step will tell you whether the `var.equal` value should be `TRUE` or `FALSE`.  Set `var.equal = FALSE` or `var.equal = TRUE` depending on whether the variances are equal. When you're happy with the values, run the t-test. What result did you get and what does this mean? Discuss this with your table, or with the staff in the lab.

13. In that t-test we looked at the *facebook_friends* variable, but what about the *instagram_followers* variable? Copy the code to run another `var.test()` and `t.test()`, for the *instagram_followers* variable. Note the t and p values; What do these tell us about the relationship between music preference and social media use?

## RStudio TASK 3: Power














