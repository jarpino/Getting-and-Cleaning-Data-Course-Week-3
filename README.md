---
title: "README"
output: html_document
---

This repository contains the code and files necessary for the course project for Getting and Cleaning Data.

In order for this code to properly run please follow the steps below:

1. Download the raw data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

2. Unizip the file into your working directory, all of the files and folders should be in a parent directory called "UCI HAR Dataset"

3. Put the "run_analysis.R" into the same parent directory for the "UCI HAR Dataset" directory.

4. Ensure your working directory is the directory with the "run_analysis.R" file and the "UCI HAR Dataset" folder 

5. Run source(run_analysis.R)

6. You should get two files created in your working directory, one with the raw tidy data (tidyData.txt) and one with the averages of the data (tidy_data_with_averages.txt)
