Getting and Cleaning Data CodeBook
==========================================

# tidydata.txt is a data table created by run_analysis.R script 
The script merges the training and the test sets to create one data set called tidydata.txt. 
tidydata.txt contains only the mean and standard deviation measurements with the average of each variable for each activity and each subject. 
Uses descriptive activity names to name the activities in the data set and appropriately labels the data set with descriptive variable names described below.

# Each variable was renamed in tidydata.txt as per the below

| Original | Descriptive rename |  
| ------------- | ------------- |
| |  Subject|                                                                     
| |  Activity|   
| tBodyAccMeanX | TimeDomain.BodyAcceleration.Mean...X|
| tBodyAccMeanY | TimeDomain.BodyAcceleration.Mean...Y|
| tBodyAccMeanZ | TimeDomain.BodyAcceleration.Mean...Z|  
| tBodyAccStdX |  TimeDomain.BodyAcceleration.StandardDeviation...X|  
| tBodyAccStdY |  TimeDomain.BodyAcceleration.StandardDeviation...Y|  
| tBodyAccStdZ |  TimeDomain.BodyAcceleration.StandardDeviation...Z|  
| tGravityAccMeanX |  TimeDomain.GravityAcceleration.Mean...X|   
| tGravityAccMeanY |  TimeDomain.GravityAcceleration.Mean...Y| 
| tGravityAccMeanZ |  TimeDomain.GravityAcceleration.Mean...Z|   
| tGravityAccStdX |  TimeDomain.GravityAcceleration.StandardDeviation...X| 
| tGravityAccStdY |  TimeDomain.GravityAcceleration.StandardDeviation...Y| 
| tGravityAccStdZ |  TimeDomain.GravityAcceleration.StandardDeviation...Z|  
| tBodyAccJerkMeanX |  TimeDomain.BodyAccelerationSudden.Mean...X| 
| tBodyAccJerkMeanY |  TimeDomain.BodyAccelerationSudden.Mean...Y|  
| tBodyAccJerkMeanZ |  TimeDomain.BodyAccelerationSudden.Mean...Z| 
| tBodyAccJerkStdX |  TimeDomain.BodyAccelerationSudden.StandardDeviation...X|  
| tBodyAccJerkStdY |  TimeDomain.BodyAccelerationSudden.StandardDeviation...Y|  
| tBodyAccJerkStdZ |  TimeDomain.BodyAccelerationSudden.StandardDeviation...Z|   
| tBodyGyroMeanX |  TimeDomain.BodyAngularVelocity.Mean...X|   
| tBodyGyroMeanY |  TimeDomain.BodyAngularVelocity.Mean...Y|  
| tBodyGyroMeanZ |  TimeDomain.BodyAngularVelocity.Mean...Z|   
| tBodyGyroStdX |  TimeDomain.BodyAngularVelocity.StandardDeviation...X| 
| tBodyGyroStdY |  TimeDomain.BodyAngularVelocity.StandardDeviation...Y| 
| tBodyGyroStdZ |  TimeDomain.BodyAngularVelocity.StandardDeviation...Z|   
| tBodyGyroJerkMeanX |  TimeDomain.BodyAngularVelocitySudden.Mean...X| 
| tBodyGyroJerkMeanY |  TimeDomain.BodyAngularVelocitySudden.Mean...Y|  
| tBodyGyroJerkMeanZ |  TimeDomain.BodyAngularVelocitySudden.Mean...Z| 
| tBodyGyroJerkStdX |  TimeDomain.BodyAngularVelocitySudden.StandardDeviation...X|
| tBodyGyroJerkStdY |  TimeDomain.BodyAngularVelocitySudden.StandardDeviation...Y| 
| tBodyGyroJerkStdZ |  TimeDomain.BodyAngularVelocitySudden.StandardDeviation...Z|   
| tBodyAccMagMean |  TimeDomain.BodyAccelerationMagnitude.Mean..| 
| tBodyAccMagStd |  TimeDomain.BodyAccelerationMagnitude.StandardDeviation..|  
| tGravityAccMagMean |  TimeDomain.GravityAccelerationMagnitude.Mean..| 
| tGravityAccMagStd |  TimeDomain.GravityAccelerationMagnitude.StandardDeviation..|  
| tBodyAccJerkMagMean |  TimeDomain.BodyAccelerationSuddenMagnitude.Mean..|   
| tBodyAccJerkMagStd |  TimeDomain.BodyAccelerationSuddenMagnitude.StandardDeviation..|  
| tBodyGyroMagMean |  TimeDomain.BodyAngularVelocityMagnitude.Mean..|  
| tBodyGyroMagStd |  TimeDomain.BodyAngularVelocityMagnitude.StandardDeviation..| 
| tBodyGyroJerkMagMean |  TimeDomain.BodyAngularVelocitySuddenMagnitude.Mean..|   
| tBodyGyroJerkMagStd |  TimeDomain.BodyAngularVelocitySuddenMagnitude.StandardDeviation..|  
| fBodyAccMeanX |  FrequencyDomain.BodyAcceleration.Mean...X| 
| fBodyAccMeanY |  FrequencyDomain.BodyAcceleration.Mean...Y| 
| fBodyAccMeanZ |  FrequencyDomain.BodyAcceleration.Mean...Z|  
| fBodyAccStdX |  FrequencyDomain.BodyAcceleration.StandardDeviation...X|  
| fBodyAccStdY |  FrequencyDomain.BodyAcceleration.StandardDeviation...Y|  
| fBodyAccStdZ |  FrequencyDomain.BodyAcceleration.StandardDeviation...Z|  
| fBodyAccJerkMeanX |  FrequencyDomain.BodyAccelerationSudden.Mean...X|  
| fBodyAccJerkMeanY |  FrequencyDomain.BodyAccelerationSudden.Mean...Y| 
| fBodyAccJerkMeanZ |  FrequencyDomain.BodyAccelerationSudden.Mean...Z|  
| fBodyAccJerkStdX |  FrequencyDomain.BodyAccelerationSudden.StandardDeviation...X|    
| fBodyAccJerkStdY |  FrequencyDomain.BodyAccelerationSudden.StandardDeviation...Y|   
| fBodyAccJerkStdZ |  FrequencyDomain.BodyAccelerationSudden.StandardDeviation...Z|  
| fBodyGyroMeanX |  FrequencyDomain.BodyAngularVelocity.Mean...X|   
| fBodyGyroMeanY |  FrequencyDomain.BodyAngularVelocity.Mean...Y|    
| fBodyGyroMeanZ |  FrequencyDomain.BodyAngularVelocity.Mean...Z|     
| fBodyGyroStdX |  FrequencyDomain.BodyAngularVelocity.StandardDeviation...X|  
| fBodyGyroStdY |  FrequencyDomain.BodyAngularVelocity.StandardDeviation...Y|  
| fBodyGyroStdZ |  FrequencyDomain.BodyAngularVelocity.StandardDeviation...Z| 
| fBodyAccMagMean |  FrequencyDomain.BodyAccelerationMagnitude.Mean..| 
| fBodyAccMagStd | FrequencyDomain.BodyAccelerationMagnitude.StandardDeviation..| 
| fBodyBodyAccJerkMagMean | FrequencyDomain.BodyBodyAccelerationSuddenMagnitude.Mean.. | 
| fBodyBodyAccJerkMagStd | FrequencyDomain.BodyBodyAccelerationSuddenMagnitude.StandardDeviation.. | 
| fBodyBodyGyroMagStd  | FrequencyDomain.BodyBodyAngularVelocityMagnitude.StandardDeviation.. | 
| fBodyBodyGyroJerkMagMean | FrequencyDomain.BodyBodyAngularVelocitySuddenMagnitude.Mean.. | 
| fBodyBodyGyroJerkMagStd | FrequencyDomain.BodyBodyAngularVelocitySuddenMagnitude.StandardDeviation.. |
