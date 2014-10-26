Getting_and_Cleaning_Data: Course Project
=========================================

Introduction
------------
This is my course project for Coursera's 3rd Course of the Data Science Specialization: Getting and Cleaning Data.


The Raw Data (UCI HAR Dataset):
------------------
Raw Data Location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
Unlabeled features are located in x_test.txt and x_train.txt
The activity labels are located in y_test.txt and y_train.txt
The test subjects are located in subject_test.txt and subject_train.txt


Functions of the R Script and its Output
----------------------------------------
The script run_analysis.R, located in this repository, check for a zipped copy of the UCI HAR Dataset (named Dataset.zip) in your working directory, and run against it if found.  If the file does not exist in your working directory, the program will attempt to download it, unzip the data into a folder in your working directory, and then run.

After merging the test and training data sets, the program adds better labelling throughout the merged set, and then subsets out all rows for only the columns pertaining to the means and standard deviations of the various measurements.

Finally, the program calculates the overall mean for each measurement, for each test subject and activity they performed. 

This final dataset is written out to a tab-delimited file called tidyData.txt


About the Code Book
-------------------
The CodeBook.md file explains the functions/variables involved in manipulating this data.
