### Project Source Data

[raw data file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)<br />
[about the data](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)<br />


### Data Processing Steps performed by run_analysis.R

1. Checks for the source data and downloads if needed.
2. Imports the test and training data sets, and merges them.
3. Adds additional columns to represent activity & subject IDs.
4. Subsets out the columns pertaining to means and standard deviations for each measurement.
5. Joins in the activity_labels.txt data, so more descriptive activity names can be shown.
6. Modifies the column labels to have appropriate (and more descriptive) names.
    a. Also cleans up messy characters, and unifies formatting style for the column labels.
7. Uses ddply to calculate the mean value of each measurement, for each test subject and each activity they performed.
    a. Sorts the data by Subject_ID and Activity, for easy reading.
6. Writes the result to disk in your working directory, called 'tidyData.txt'


### Variable Descriptions

Most of the information below is directly quoted from features.info.txt, found in the zip file of the [Project Source Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


##### The variables estimated from these signals, and pertaining to the output of this program are:
* mean(): Mean value
* std(): Standard deviation


#### Data Columns (Post-Processed Names)

 [1] Subject_ID                              
 [2] Activity                                
 [3] Time.Body.LinAccel.Mean.Y               
 [4] Time.Body.LinAccel.Mean.Z               
 [5] Time.Body.LinAccel.StdDev.X             
 [6] Time.Body.LinAccel.StdDev.Y             
 [7] Time.Body.LinAccel.StdDev.Z             
 [8] Time.Gravity.LinAccel.Mean.X            
 [9] Time.Gravity.LinAccel.Mean.Y            
[10] Time.Gravity.LinAccel.Mean.Z            
[11] Time.Gravity.LinAccel.StdDev.X          
[12] Time.Gravity.LinAccel.StdDev.Y          
[13] Time.Gravity.LinAccel.StdDev.Z          
[14] Time.Body.LinAccel.Jerk.Mean.X          
[15] Time.Body.LinAccel.Jerk.Mean.Y          
[16] Time.Body.LinAccel.Jerk.Mean.Z          
[17] Time.Body.LinAccel.Jerk.StdDev.X        
[18] Time.Body.LinAccel.Jerk.StdDev.Y        
[19] Time.Body.LinAccel.Jerk.StdDev.Z        
[20] Time.Body.AngVeloc.Mean.X               
[21] Time.Body.AngVeloc.Mean.Y               
[22] Time.Body.AngVeloc.Mean.Z               
[23] Time.Body.AngVeloc.StdDev.X             
[24] Time.Body.AngVeloc.StdDev.Y             
[25] Time.Body.AngVeloc.StdDev.Z             
[26] Time.Body.AngVeloc.Jerk.Mean.X          
[27] Time.Body.AngVeloc.Jerk.Mean.Y          
[28] Time.Body.AngVeloc.Jerk.Mean.Z          
[29] Time.Body.AngVeloc.Jerk.StdDev.X        
[30] Time.Body.AngVeloc.Jerk.StdDev.Y        
[31] Time.Body.AngVeloc.Jerk.StdDev.Z        
[32] Time.Body.LinAccel.Magnitude.Mean       
[33] Time.Body.LinAccel.Magnitude.StdDev     
[34] Time.Gravity.LinAccel.Magnitude.Mean    
[35] Time.Gravity.LinAccel.Magnitude.StdDev  
[36] Time.Body.LinAccel.Jerk.Magnitude.Mean  
[37] Time.Body.LinAccel.Jerk.Magnitude.StdDev  
[38] Time.Body.AngVeloc.Magnitude.Mean       
[39] Time.Body.AngVeloc.Magnitude.StdDev     
[40] Time.Body.AngVeloc.Jerk.Magnitude.Mean  
[41] Time.Body.AngVeloc.Jerk.Magnitude.StdDev  
[42] Freq.Body.LinAccel.Mean.X               
[43] Freq.Body.LinAccel.Mean.Y               
[44] Freq.Body.LinAccel.Mean.Z               
[45] Freq.Body.LinAccel.StdDev.X             
[46] Freq.Body.LinAccel.StdDev.Y             
[47] Freq.Body.LinAccel.StdDev.Z             
[48] Freq.Body.LinAccel.Jerk.Mean.X          
[49] Freq.Body.LinAccel.Jerk.Mean.Y          
[50] Freq.Body.LinAccel.Jerk.Mean.Z          
[51] Freq.Body.LinAccel.Jerk.StdDev.X        
[52] Freq.Body.LinAccel.Jerk.StdDev.Y        
[53] Freq.Body.LinAccel.Jerk.StdDev.Z        
[54] Freq.Body.AngVeloc.Mean.X               
[55] Freq.Body.AngVeloc.Mean.Y               
[56] Freq.Body.AngVeloc.Mean.Z               
[57] Freq.Body.AngVeloc.StdDev.X             
[58] Freq.Body.AngVeloc.StdDev.Y             
[59] Freq.Body.AngVeloc.StdDev.Z             
[60] Freq.Body.LinAccel.Magnitude.Mean       
[61] Freq.Body.LinAccel.Magnitude.StdDev     
[62] Freq.Body.LinAccel.Jerk.Magnitude.Mean  
[63] Freq.Body.LinAccel.Jerk.Magnitude.StdDev  
[64] Freq.Body.AngVeloc.Magnitude.Mean       
[65] Freq.Body.AngVeloc.Magnitude.StdDev     
[66] Freq.Body.AngVeloc.Jerk.Magnitude.Mean  
[67] Freq.Body.AngVeloc.Jerk.Magnitude.StdDev
