# About the source data
This data refer to the Human Activity Recognition Using Smartphones Data Set, available at the UCI Machine Learning Repository: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# About the R Script
The R file "run_analysis.R" will first download and unzip the data into the working directory of R Studio and then perform the 7 following steps (based on the task list of the course work):

1. Download dataset in working directory of R Studio
2. Unzip the files
 3. Merges the training and test data to create one data set
  3.1. Read the files
   3.1.1. Read train files
   3.1.2. Read test files
   3.1.3. Read labels
  3.2. Assign variable names
  3.3. Merge all data in one set
4. Extract only mean and standard deviation measurements
5. Add descriptitve labels to the activities variable
6. Create a second, independent tidy data set with the average of each variable for each activity and each subject
7. Export tidy data set in .txt file

# About the variables
* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the original data from the downloaded files
* `data` is a merge of the all the data sets above
* `features`contains the correct labels for the variables 
* `activityLabels` contains the labels for the activity variable
