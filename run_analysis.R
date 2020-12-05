#Sheldon Maschmeyer
#Coursera Getting and Cleaning Data Project
#This script:
#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
library(data.table)

print("Working....")
#Download from datasource
if(!file.exists("dataset.zip")) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileUrl, destfile = "dataset.zip")
}
print("10%")
#Unzip data
dataDir = ".data"
if(!file.exists(paste("./", dataDir, sep=""))) {
  unzip(zipfile = "dataset.zip")
  file.rename("UCI HAR Dataset", dataDir) #don't like files/dir with spaces. Hidden dir in gitignore 
}
print("20%")
#Good hygiene is important, disk cleanup when done with program
cleanup <- function() {
  cleanupData()
  cleanupZip()
  detach("package:data.table", unload=TRUE)
}
cleanupData <- function() unlink(dataDir, recursive = TRUE)

cleanupZip <- function() unlink("dataset.zip")

#Load datasets into memory and
#2. Keep only the measurements on the mean and standard deviation for each measurement.
#This step is done early before merging to reduce the memory size.
featuresLocal <- paste("./", dataDir, "/features.txt", sep = "") 
#excuse to use eval learned from Carleton U programming paradigms course. Makes code look cleaner.
meanStd <- grep("-(mean|std)\\(\\)", 
                read.table(featuresLocal)[, 2])

testDir = paste("./", dataDir, "/test/", sep = "")
xTest <- read.table(paste(testDir, "X_test.txt", sep=""), header = FALSE) [eval(meanStd)]
yTest <- read.table(paste(testDir, "y_test.txt", sep = ""), header = FALSE)
sTest <- read.table(paste(testDir, "subject_test.txt", sep = ""), header = FALSE)
print("25%")
trainDir = paste("./", dataDir, "/train/", sep = "")
xTrain <- read.table(paste(trainDir, "X_train.txt", sep = ""), header = FALSE) [eval(meanStd)]
yTrain <- read.table(paste(trainDir, "y_train.txt", sep = ""), header = FALSE)
sTrain <- read.table(paste(trainDir, "subject_train.txt", sep = ""), header = FALSE)
print("30%")

names(xTest) <- read.table(featuresLocal)[eval(meanStd), 2] 
names(xTrain) <- read.table(featuresLocal)[eval(meanStd), 2] 
print("40%")

#1.1 Merge related training and test Datasets 
xMergedData <- rbind (xTest, xTrain)
yMergedData <- rbind (yTest, yTrain)
sMergedData <- rbind (sTest, sTrain)
print("50%")

#3. Uses descriptive activity names to name the activities in the data set
yMergedData[, 1] <- read.table(
  paste("./", dataDir, "/activity_labels.txt", sep = ""))[yMergedData[,1],2]
names(yMergedData) <- "Activity"
print("60%")
#4.1 Label the subject dataset
names(sMergedData) <- "Subject"

#1.2 Merge the three datasets into a single dataset
singleData <- cbind(xMergedData, yMergedData, sMergedData)
print("70%")

#4.2 Appropriately label the rest of the data set with descriptive variable names.
names(singleData) <- make.names(names(singleData))
names(singleData) <- gsub('Acc',"_Acceleration",names(singleData))
names(singleData) <- gsub('Jerk',"_Sudden",names(singleData))
names(singleData) <- gsub('Gyro',"_Angular_Velocity",names(singleData))
names(singleData) <- gsub('Mag',"_Magnitude",names(singleData))
names(singleData) <- gsub('^t',"_Time_Domain.",names(singleData))
names(singleData) <- gsub('^f',"_Frequency_Domain.",names(singleData))
names(singleData) <- gsub('\\.mean',".Mean",names(singleData))
names(singleData) <- gsub('\\.std',".Standard_Deviation",names(singleData))
names(singleData) <- gsub('Freq\\.',"_Frequency.",names(singleData))
names(singleData) <- gsub('Freq$',"_Frequency",names(singleData))
print("80%")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of 
#each variable for each activity and each subject.
tidyData <- aggregate(. ~Subject + Activity, singleData, mean)
tidyData <- tidyData[order(tidyData$Subject, tidyData$Activity),]
print("90%")
write.table(tidyData, file = "tidyData.txt", row.names = FALSE, quote = FALSE)

#Cleanup routine
print("99% tidyData.txt file created cleaning up...")
cleanup()
rm(list = ls()) #clear the environment memory
print("100% Program Done")