# Getting and Cleaning Data Course Project

The purpose of this project is to prepare a tidy data that can be used for later analysis. Data used - [UCI HAR Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This repository contains the following files:

1. CodeBook.md - the code book that describes the contents of the data set and transformations used to generate the data.
2. run_analysis.R - the R script used to create the tidy data set includes the following steps:
	* Download the dataset and extract the files
	* Merge the training and the test sets to create one data set
	* Extract only the measurements on the mean and standard deviation for each measurement
	* Use descriptive activity names to name the activities in the data set
	* Appropriately label the data set with descriptive variable names
	* Create a second, independent tidy data set with the average of each variable for each activity and each subject

3. tidydata.txt - Final data extracted after going through all the steps described above.
