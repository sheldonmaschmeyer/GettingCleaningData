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

#Create a file loader function, makes code cleaner
loadFiles <- function(fileDir, theFile) {
  fileDir <- paste("./", dataDir, fileDir, sep = "")
  read.table(paste(fileDir, theFile, sep=""), header = FALSE)
}

testDir = "/test/"
xTest <- loadFiles(testDir, "X_test.txt") [eval(meanStd)]
yTest <- loadFiles(testDir, "y_test.txt")
sTest <- loadFiles(testDir, "subject_test.txt")
print("25%")
trainDir = "/train/"
xTrain <- loadFiles(trainDir, "X_train.txt") [eval(meanStd)]
yTrain <- loadFiles(trainDir, "y_train.txt")
sTrain <- loadFiles(trainDir, "subject_train.txt")
print("30%")

names(xTest) <- read.table(featuresLocal)[eval(meanStd), 2] 
names(xTrain) <- read.table(featuresLocal)[eval(meanStd), 2] 
print("40%")

#1.1 Merge related training and test Datasets 
xMergedData <- rbind (xTest, xTrain)
yMergedData <- rbind (yTest, yTrain)
sMergedData <- rbind (sTest, sTrain)

#Mem cleanup, not necessary in this program but, good practice when stuff loaded into memory is 
#large and, no-longer needed
rm(list = c('xTest', 'yTest', 'sTest', 'xTrain', 'yTrain', 'sTrain'))
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

#mem cleanup mergedData
rm(list = c('xMergedData', 'yMergedData', 'sMergedData'))
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