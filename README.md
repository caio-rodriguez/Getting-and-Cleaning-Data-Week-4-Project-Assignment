# Getting and Cleaning Data - Week 4 Assignment
Repo for Coursera's "Getting and Cleaning Data" Week 4 Assignment.

The goal of the project is to create a R script to collect and clean a data by performing all the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Files
 - CodeBook.md explains what the code does, the steps and the variables.
 - run_analysis.R contains all the code to perform the steps described above. It can be run in RStudio by importing the file. The code uses some functions from the `dplyr` package and will install it automatically.
 - tidydata.txt is the final output of the code