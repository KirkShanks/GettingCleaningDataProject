Read me file

Course 3 - Getting and Cleaning Data
Project

Steps for loading, combining, subsetting, and aggregating the data

Loading the data
I use read.table() to load the data into R.
There are three tables for each cohort (test and train) that need to be 
combined. They each have the same number of observations respectively. 
They have 1, 561, and 1 variables each, so the final tables will have 563 
variables. 
        1. Subject (number indicating the subject)
        2. x (raw data)
        3. y (number indicating each activity)

I use cbind() to combine the three tables into train and test.

I then use rbind() to combine the two data sets together so that the number of
variables remains at 563.

I then change the column names using the "features" table.

Next, I subset the data by searching for column names that contain
"mean()" or "std()".

Factor labels are added for the activities.
And the data is aggregated by subject and activity using the mean.
        