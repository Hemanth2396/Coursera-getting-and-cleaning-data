# Getting and Cleaning Data Course Project

The purpose of this project is to prepare a tidy data that can be used for later analysis. Data used - [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This repository contains the following files:

* CodeBook.md - the code book that describes the data fields and transformations applied to create the tidy data
* run_analysis.R - the R script used to create the tidy data set includes the following steps:
	1. Download the dataset and load the files
	2. Merge the training and the test sets to create one data set
	3. Extract only the measurements on the mean and standard deviation for each measurement
	4. Use descriptive activity names to name the activities in the data set
	5. Appropriately label the data set with descriptive variable names
	6. Create a second, independent tidy data set with the average of each variable for each activity and each subject

* tidydata.txt - Final data extracted after going through all the steps described above
