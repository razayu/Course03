Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data. 

•The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:

1.Read train and test data and append the train and test data.
Read data

  •X_train.txt - stored in trainData variable

  •y_train.txt and - stored in trainLabel variable

  •subject_train.txt - stored in trainSubject variable

  •X_test.txt - stored in testData variable

  •y_test.txt and - stored in testLabel variable

  •subject_test.txt - stored in testSubject variable

Append data

  •Append trainData and testData - stored in mergeData variable.

  •Append trainLabel and testLabel - stored in mergeLabel variable.

  •Append trainSubject and testSubject - stored in mergeSubject variable.

2. 
iv.Read the features.txt file from the "/data" folder and store the data in a variable called features. We only extract the measurements on the mean and standard deviation. This results in a 66 indices list. We get a subset of joinData with the 66 corresponding columns.

3.
vi.Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
vii.Clean the activity names in the second column of activity. We first make all names to lower cases. If the name has an underscore between letters, we remove the underscore and capitalize the letter immediately after the underscore.

4.
viii.Transform the values of joinLabel according to the activity data frame.

ix.Combine the joinSubject, joinLabel and joinData by column to get a new cleaned 10299x68 data frame, cleanedData. Properly name the first two columns, "subject" and "activity". The "subject" column contains integers that range from 1 to 30 inclusive; the "activity" column contains 6 kinds of activity names; the last 66 columns contain measurements that range from -1 to 1 exclusive.

x.Write the cleanedData out to "merged_data.txt" file in current working directory.

5. 
xi.Finally, generate a second independent tidy data set with the average of each measurement for each activity and each subject. We have 30 unique subjects and 6 unique activities, which result in a 180 combinations of the two. Then, for each combination, we calculate the mean of each measurement with the corresponding combination. So, after initializing the result data frame and performing the two for-loops, we get a 180x68 data frame.
xii.Write the result out to "data_with_means.txt" file in current working directory. 

