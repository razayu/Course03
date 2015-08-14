Getting and Cleaning Data Course Project CodeBook

This file describes the variables, the data, and any transformations or work that I have performed to clean up the data. 

•The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
 The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:

1.Read train and test data and append the train and test data.
Read data
  •x_train.txt - stored in trainData variable (561 columns, 7352 rows)
  •y_train.txt and - stored in trainLabel variable (1 column, 7352 rows)
  •subject_train.txt - stored in trainSubject variable (1 column, 7352 rows)
  •x_test.txt - stored in testData variable (561 columns, 2947 rows)
  •y_test.txt and - stored in testLabel variable (1 column, 2947 rows)
  •subject_test.txt - stored in testSubject variable (1 column, 2947 rows)

Append data
  •Append trainData and testData - stored in mergeData variable (561 columns, 10299 rows).
  •Append trainLabel and testLabel - stored in mergeLabel variable (1 column, 10299 rows).
  •Append trainSubject and testSubject - stored in mergeSubject variable (1 column, 10299 rows).

2. Read features data, which are column names for measurements and get subset of trainData that are measurements on mean and    standard deviation only.
  •features.txt - stored in features variable (561 measurements)
  •mean_std_only variable - holds the features with mean and standard deviation measurements only
  •subset of trainData with mean and standard deviation measurement only - restored in mergeData variable (66 measurements).
  •use the 66 measurements as column names for mergeData

3. Read activity labels data
  •activity_labels.txt - stored in activity variable (6 activities)
  •transform the values of mergeLabel according to the activity.
  •change mergeLabel column name to 'activity'

4. Merge all 3 data files together to get a clean allData data frame (68 columns, 10299 rows) and write to a merged_data.txt    file.
  •change mergeSubject column name to 'subject'
  •mergeSubject data file + mergeLabel data file + mergeData data file
  •the final allData contains the following columns
      1 column subject - contains integers that range from 1 to 30 inclusive
      1 column activity - contains 6 kinds of activity names
      66 measurements columns - contain measurements that range from -1 to 1 exclusive
  •write allData data to a merged_data.txt file

5. Create another clean data file with summarized allData information with the average of each measurement for each activity    and each subject.
  •create a 66 columns and 180 rows data frame (result variable) to store the average measurement numbers for each activity and each     subject.
  •180 rows is combination of 30 subjects and 6 activities.
  •a nested 2 loops is used to calculate the average numbers.
  •write the summarized data to a merged_data_mean.txt file.
