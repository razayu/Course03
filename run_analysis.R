#set working directory
setwd("D:/Data Science Course Materials/Course03")

#download zip data file
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
fileDest <- "wcdata.zip"
download.file(fileURL, fileDest)

###______________________________________________________________________
###STEP 1: Merges the training and the test sets to create one data set

#read train related data
trainData <- read.table("./wcdata/UCI HAR Dataset/train/X_train.txt")
trainLabel <- read.table("./wcdata/UCI HAR Dataset/train/y_train.txt") 
trainSubject <- read.table("./wcdata/UCI HAR Dataset/train/subject_train.txt") 

#read test related data
testData <- read.table("./wcdata/UCI HAR Dataset/test/X_test.txt") 
testLabel <- read.table("./wcdata/UCI HAR Dataset/test/y_test.txt")  
testSubject <- read.table("./wcdata/UCI HAR Dataset/test/subject_test.txt") 

#merge train and test data (appending)
mergeData <- rbind(trainData, testData) 
mergeLabel <- rbind(trainLabel, testLabel) 
mergeSubject <- rbind(trainSubject, testSubject) 

###______________________________________________________________________
###STEP 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

features <- read.table("./wcdata/UCI HAR Dataset/features.txt") 
mean_std_only <- grep("mean\\(\\)|std\\(\\)", features[, 2]) 
#length(mean_std_only) # 66 columns are with mean and std column names
mergeData <- mergeData[, mean_std_only] #get wanted columns with mean and std only
names(mergeData) <- features[mean_std_only, 2] #replace column name

###______________________________________________________________________
###STEP 3: Uses descriptive activity names to name the activities in the data set 

activity <- read.table("./wcdata/UCI HAR Dataset/activity_labels.txt") 
activityLabel <- activity[mergeLabel[, 1], 2] 
mergeLabel[, 1] <- activityLabel 
names(mergeLabel) <- "activity" #replace column name

###______________________________________________________________________
###STEP 4: Appropriately labels the data set with descriptive variable names.

names(mergeSubject) <- "subject" #replace column name 
allData <- cbind(mergeSubject, mergeLabel, mergeData) 
#dim(allData) # 10299*68 
write.table(allData, "merged_data.txt") # write out the 1st tidy dataset 

###______________________________________________________________________
###STEP 5: From the data set in 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

subjectLen <- length(table(mergeSubject)) # 30 
activityLen <- dim(activity)[1] # 6 
columnLen <- dim(allData)[2] 
result <- matrix(NA, nrow=subjectLen*activityLen, ncol=columnLen) #create the matrix to hold aggregate data  
result <- as.data.frame(result) 
colnames(result) <- colnames(allData) #change column name 
row <- 1 
for(i in 1:subjectLen) { 
       for(j in 1:activityLen) { 
             result[row, 1] <- sort(unique(mergeSubject)[, 1])[i] 
             result[row, 2] <- activity[j, 2] 
             bool1 <- i == allData$subject 
             bool2 <- activity[j, 2] == allData$activity 
             result[row, 3:columnLen] <- colMeans(allData[bool1&bool2, 3:columnLen]) 
             row <- row + 1 
         } 
   } 
write.table(result, "merged_data_mean.txt") # write out the 2nd tidy dataset 
