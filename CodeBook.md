### Project Source Data

[raw data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)<br />
[about the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)<br />


### Data Processing Steps performed by run_analysis.R

1. Check for the source data and download if needed.
2. Import the test and training data sets, and merge them.
3. Add additional columns to represent activity & subject IDs.
4. Subset out the columns pertaining to means and standard deviations for each measurement.
5. Join in the activity_labels.txt data, so more descriptive activity names can be shown.
6. Modify the column labels to have appropriate (and more descriptive) names.
    a. Also cleans up messy characters, and unifies formatting style for the column labels.
7. Uses ddply to calculate the mean value of each measurement, for each test subject and each activity they performed.
    a. Sorts the data by Subject_ID and Activity, for easy reading.
6. Writes the result to disk in your working directory, called 'tidyData.txt'
