Getting & Cleaning Data: Course Project
=========================================

Introduction
------------
This is my course project for Coursera's 3rd Course of the Data Science Specialization: Getting and Cleaning Data.


About the Raw Data (UCI HAR Dataset):
-------------------------------------
Raw Data Location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* This script will assume you are working with the zip file from the above URL, with its underlying file structure intact.
* File names, and internal labelling within each file is assumed to be in an unaltered state from the original zip.


Details about the R Script and its Output:
------------------------------------------
The script run_analysis.R, located in this repository, checks for a zipped copy of the UCI HAR Dataset (named Dataset.zip) in your working directory, and runs against it, if found.  If the file does not exist in your working directory, the program will attempt to download it, unzip the data into a folder in your working directory, and then run.

After merging the test and training data sets, the program adds better labelling throughout the merged set, and then subsets out all rows for only the columns pertaining to the means and standard deviations of the various measurements.

Finally, the program calculates the mean of each extracted column, for each test subject and activity they performed, and writes the output to a tab-delimited file called tidyData.txt in your working directory.

##### Further details about transformation steps, and the functions/variables involved can be found in the [Code Book](https://github.com/djmcqueen/Getting_and_Cleaning_Data/blob/master/CodeBook.md)


To run the script:
------------------------------------------
- Clone this repository
- Run the file: run_analysis.R 
- The tidy dataset will be output to your working directory as `tidyData.txt`
