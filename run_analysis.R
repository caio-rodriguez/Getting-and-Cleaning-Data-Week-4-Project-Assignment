# 1) Download dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/galaxydata.zip", method = "curl")

# 2) Unzip dataset
unzip(zipfile = "./data/galaxydata.zip", exdir = "./data")

# 3) Merging the training and the test sets to create one data set
#   3.1) Reading files
#    3.1.1) Reading train files
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#    3.1.2) Reading test files
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#    3.1.3) Reading features and labels
features <- read.table("./data/UCI HAR Dataset/features.txt")

#  3.2 Assigning variable names
colnames(x_train) <- features[,2]
colnames(y_train) <- "activityID"
colnames(subject_train) <- "subjectID"

colnames(x_test) <- features[,2]
colnames(y_test) <- "activityID"
colnames(subject_test) <- "subjectID"

#  3.3 Merging all datasets
train <- cbind(y_train, subject_train, x_train)
test <- cbind(y_test, subject_test, x_test)
data <- rbind(train, test)

# 4) Extracting only the measurements on the mean and sd for each measurement
library(dplyr)
data %>%
     select(activityID, subjectID, contains("mean"), contains("std"))

# 5) Using descriptive activity names to name the activities in the data set
activityLabels = read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(activityLabels) <- c("activityID", "activity")
data <- merge(activityLabels, data, by = "activityID", all.x = TRUE) %>%
     select(-activityID)

# 6) Creating a second, independent tidy data set with the average of each variable for each activity and each subject
tidyData <- data %>%
     group_by(activity, subjectID) %>%
     summarize_all(funs(mean))

# 7) Exporting tidy dataset
write.table(tidyData, "./data/UCI HAR Dataset/tidydata.txt", row.names = FALSE)
