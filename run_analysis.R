setwd("C:/Users/KundziczA/Desktop/Inne/do naUki/Data Science/Getting and Cleaning Data/CourseProject/GaCD_CP")

dir()
dir("./UCI HAR Dataset/test")
dir("./UCI HAR Dataset/train")


      ## READ DATA

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
head(subject_test)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", header=FALSE)

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", header=FALSE)

library(dplyr)

dim(subject_test)
dim(subject_train)
dim(X_test)
dim(X_train)
dim(y_test)
dim(y_train)


      ## Appropriately label the data set with descriptive variable names.

names(subject_test)
subject_test <- rename(subject_test, subject=V1)
names(subject_train)
subject_train <- rename(subject_train, subject=V1)
names(X_test)
names(X_train)
names(y_test)
y_test <- rename(y_test, y=V1)
names(y_train)
y_train <- rename(y_train, y=V1)

      ## Merge the training and the test sets to create one data set.

test <- cbind(subject_test, X_test, y_test)
dim(test)
train <- cbind(subject_train, X_train, y_train)
dim(train)

ready_set <- rbind(test, train)
dim(ready_set)
head(ready_set)
names(ready_set)


      ## Extract only the measurements on the mean and standard deviation for each measurement. 

ready_set$mean <- rowMeans(ready_set)
ready_set$mean
ready_set$SD <- apply(ready_set, 1, sd)
ready_set$SD
only_MEAN_SD <- cbind(ready_set$mean, ready_set$SD)
colnames(only_MEAN_SD) <- c("Mean", "SD")
head(only_MEAN_SD)


write.table(ready_set, file="ready_dataset.txt", row.name=FALSE)
