---
title: "CodeBook"
output: html_document
---

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Use the "run_analysis.R" file contained within to perform the following analysis on the above datasets:


Part 1: Merges the training and the test sets to create one data set.

* mergest the training and test datasets:
  * X_Train, X_Test
  * Y_Train, Y_Test
  * subject_Train, subject_Test

Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.

* Using the "features.txt" file extract the mean and standard deviation for each measurement.

Part 3: Uses descriptive activity names to name the activities in the data set

* Using the "activity_labels.txt" file to apply the appropriate names to the activities in the dataset: 
```
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
```

Part 4: Appropriately labels the data set with descriptive variable names.

* Ensured readability merged the features, activities and subject table frames. 

* Variable names are as follows:
```
"subjectId" 
"activityId" 
"tBodyAcc-mean-X"
"tBodyAcc-mean-Y"
"tBodyAcc-mean-Z"
"tBodyAcc-std-X"
"tBodyAcc-std-Y"
"tBodyAcc-std-Z"
"tGravityAcc-mean-X"
"tGravityAcc-mean-Y"
"tGravityAcc-mean-Z"
"tGravityAcc-std-X"
"tGravityAcc-std-Y"
"tGravityAcc-std-Z"
"tBodyAccJerk-mean-X"
"tBodyAccJerk-mean-Y"
"tBodyAccJerk-mean-Z"
"tBodyAccJerk-std-X"
"tBodyAccJerk-std-Y"
"tBodyAccJerk-std-Z"
"tBodyGyro-mean-X"
"tBodyGyro-mean-Y"
"tBodyGyro-mean-Z"
"tBodyGyro-std-X"
"tBodyGyro-std-Y"
"tBodyGyro-std-Z"
"tBodyGyroJerk-mean-X"
"tBodyGyroJerk-mean-Y"
"tBodyGyroJerk-mean-Z"
"tBodyGyroJerk-std-X"
"tBodyGyroJerk-std-Y"
"tBodyGyroJerk-std-Z"
"tBodyAccMag-mean"
"tBodyAccMag-std"
"tGravityAccMag-mean"
"tGravityAccMag-std"
"tBodyAccJerkMag-mean"
"tBodyAccJerkMag-std"
"tBodyGyroMag-mean"
"tBodyGyroMag-std"
"tBodyGyroJerkMag-mean"
"tBodyGyroJerkMag-std"
"fBodyAcc-mean-X"
"fBodyAcc-mean-Y"
"fBodyAcc-mean-Z"
"fBodyAcc-std-X"
"fBodyAcc-std-Y"
"fBodyAcc-std-Z"
"fBodyAccJerk-mean-X"
"fBodyAccJerk-mean-Y"
"fBodyAccJerk-mean-Z"
"fBodyAccJerk-std-X"
"fBodyAccJerk-std-Y"
"fBodyAccJerk-std-Z"
"fBodyGyro-mean-X"
"fBodyGyro-mean-Y"
"fBodyGyro-mean-Z"
"fBodyGyro-std-X"
"fBodyGyro-std-Y"
"fBodyGyro-std-Z"
"fBodyAccMag-mean"
"fBodyAccMag-std"
"fBodyBodyAccJerkMag-mean" 
"fBodyBodyAccJerkMag-std" 
"fBodyBodyGyroMag-mean" 
"fBodyBodyGyroMag-std"
"fBodyBodyGyroJerkMag-mean"
"fBodyBodyGyroJerkMag-std"
```

Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

* This section will create a second tidy dataset that instead of the raw data averages each of the variables for each activity and subject. 

* To do this the code get unique set of subjects, the count of activities and variables and loops through the data table from part 4. 

* For each subject loop through the activities and get an average of those values

* Write second tidy dataset with averages to a files.


