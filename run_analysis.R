
#Load required packages
library(dplyr)

filename <- "getdata_UCI_HAR_Dataset.zip"

#Download the dataset and extract the files
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

#Load the datasets
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Read train data and assign names using features data and activity labels
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

colnames(train) <- features$V2
train$activity <- y_train$V1
train$subject <- factor(subject_train$V1)

#Read test data and assign names using features data and activity labels
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

colnames(test) <- features$V2
test$activity <- y_test$V1
test$subject <- factor(subject_test$V1)


#Merge the training and the test sets and add labels
dataset <- rbind(test, train)
col_names <- colnames(dataset)

#Extract the data only on mean and standard deviation
col_names_filtered <- grep("std\\(\\)|mean\\(\\)|activity|subject", col_names, value=TRUE)
data_filtered <- dataset[, col_names_filtered]

#Add descriptive values for activity labels
data_filtered$activitylabel <- factor(data_filtered$activity, labels= c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))

features.colnames = grep("std\\(\\)|mean\\(\\)", column.names, value=TRUE)

data_melted <-melt(data_filtered, id = c('activitylabel', 'subject'), measure.vars = features.colnames)
data_mean <- dcast(data_melted, subject + activitylabel ~ variable, mean)

#Creating a tidy dataset file  
write.table(data_mean, file = "tidydata.txt", row.names = FALSE, quote = FALSE)
