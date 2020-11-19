#Sheldon Maschmeyer
#Coursera Getting and Cleaning Data Project
#This script:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.

if(!file.exists("dataset.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "dataset.zip")
}

if(!file.exists("./.data")) {
  unzip(zipfile = "dataset.zip")
  file.rename("UCI HAR Dataset", ".data") #don't like files/dir with spaces. Hidden dir in gitignore 
}

#Good hygiene is important
cleanup <- function() {
  cleanupData
  cleanupZip
}
cleanupData <- function() unlink(".data", recursive = TRUE)

cleanupZip <- function() unlink("dataset.zip")