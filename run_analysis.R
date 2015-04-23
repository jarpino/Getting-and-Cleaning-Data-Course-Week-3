#### R Script for the course project for Getting and Cleaning Data (Coursera) ####
#### Source of data:: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ####


## Part 1: Merges the training and the test sets to create one data set. ##

# get the X axis training and test data
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt");

xTest <- read.table("UCI HAR Dataset/test/X_test.txt");

# merge the data
xTable <- rbind(xTrain, xTest);

# get the subject training and test data
sTrain <- read.table("UCI HAR Dataset/train/subject_train.txt");

sTest <- read.table("UCI HAR Dataset/test/subject_test.txt");

# merge the data
sTable <- rbind(sTrain, sTest);

# get the Y axis training and test data
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt");

yTest <- read.table("UCI HAR Dataset/test/y_test.txt");

# merge the data
yTable <- rbind(yTrain, yTest);

## Part 2: Extracts only the measurements on the mean and standard deviation for each measurement. ##

features <- read.table("UCI HAR Dataset/features.txt");

indexOfMeanStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2]);

xTable <- xTable[, indexOfMeanStd];

names(xTable) <- features[indexOfMeanStd, 2];

names(xTable) <- gsub("\\(|\\)", "", names(xTable));

## Part 3: Uses descriptive activity names to name the activities in the data set ##

activityLabelTable <- read.table("UCI HAR Dataset/activity_labels.txt");

yTable[,1] = activityLabelTable[yTable[,1], 2];

## Part 4: Appropriately labels the data set with descriptive variable names. ##

names(yTable) <- "activityId";

names(sTable) <- "subjectId";

cleanedMergedTable <- cbind(sTable, yTable, xTable);

## Write the first tidy dataset 
write.table(cleanedMergedTable, "tidyData.txt");

## Part 5: From the data set in step 4, creates a second, independent tidy data set ##
## with the average of each variable for each activity and each subject. ##

##get unique set of subjects
subjects = unique(sTable)[,1];

##get count of subjects
subjectCount = length(unique(sTable)[,1]);

##get count of activities
activityCount = length(activityLabelTable[,1]);

## get count of columns
colCount = dim(cleanedMergedTable)[2];

##get the data from Part 4 and select out all of the activies for all subjects
resultTable = cleanedMergedTable[1:(subjectCount*activityCount), ];

## counter for the number of rows

rowCount = 0;

## loop through the subjects

for (s in 1:subjectCount) {
  
  ## for each subject loop through the activities
  
  for (a in 1:activityCount) {
    
    ## set the row to the current row
    rowCount = rowCount + 1;
    
    ## Get the subjects
    resultTable[rowCount, 1] = subjects[s];
    
    ## Get the activities
    resultTable[rowCount, 2] = activityLabelTable[a, 2];
    
    ## create temp table that contains data for the subject and activity combination
    tempTable <- cleanedMergedTable[cleanedMergedTable$subjectId==s 
                              & cleanedMergedTable$activityId==activityLabelTable[a, 2], ];
    
    ## get the column mean for the for the activity and add it to the result table
    resultTable[rowCount, 3:colCount] <- colMeans(tempTable[, 3:colCount]);
  }
}

##write second tidy dataset with averages
write.table(resultTable, "tidy_data_with_averages.txt", row.name=FALSE);