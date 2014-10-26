#Data Science Course 3 Project

require(plyr)
require(data.table)

#Get the data from the web if it's not already present in the working directory

  fileUrl1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if(!file.exists("./Dataset.zip")) {
    download.file(fileUrl1,destfile="./Dataset.zip",mode="wb")
  }
  if(!file.exists("./UCI_HAR_Dataset")){
    unzip("./Dataset.zip")
    #was having issues with the spaces in windows?  changed to underscores and it worked...
    file.rename("UCI HAR Dataset", "UCI_HAR_Dataset")
  }

#Import the data sets into working memory
  
  features <- read.table("./UCI_HAR_Dataset/features.txt",header=FALSE,
                          colClasses="character")
  act_labels <- read.table("./UCI_HAR_Dataset/activity_labels.txt",header=FALSE,
                          colClasses="character", col.names = c("Activity_ID", "Activity"))
  tstData <- read.table("./UCI_HAR_Dataset/test/X_test.txt",header=FALSE)
  tstData_lbls <- read.table("./UCI_HAR_Dataset/test/y_test.txt",header=FALSE)
  tstData_subj <- read.table("./UCI_HAR_Dataset/test/subject_test.txt",header=FALSE)
  trnData <- read.table("./UCI_HAR_Dataset/train/X_train.txt",header=FALSE)
  trnData_lbls <- read.table("./UCI_HAR_Dataset/train/y_train.txt",header=FALSE)
  trnData_subj <- read.table("./UCI_HAR_Dataset/train/subject_train.txt",header=FALSE)
  
# (1) Merge the training and the test sets to create one data set.
  
  tstData <- cbind(cbind(tstData,tstData_subj), tstData_lbls)
  trnData <- cbind(cbind(trnData,trnData_subj), trnData_lbls)
  allData <- rbind(tstData,trnData)

  #Create starting data labels for columns, and add columns for the IDs
  dataLabels <- rbind(rbind(features, c(562, "Subject_ID")), c(563, "Activity_ID"))[,2]
  colnames(allData) <- dataLabels
  
# (2) Extract only the measurements on the mean and standard deviation for each measurement.
  
  allData_MNSD <- allData[,grepl("mean\\(\\)|std\\(\\)|Subject_ID|Activity_ID", colnames(allData))]
  
# (3) Use descriptive activity names to name the activities in the data set

  allData_MNSD <- join(allData_MNSD, act_labels, by = c("Activity_ID"), match = "all")
  allData_MNSD <- allData_MNSD[,-1]

# (4) Appropriately label the data set with descriptive names

  #Do some cleanup on special characters, etc...
  colnames(allData_MNSD) <- gsub('\\(|\\)',"", colnames(allData_MNSD), perl = TRUE)
  colnames(allData_MNSD) <- make.names(colnames(allData_MNSD))

  #Make the column names themselves more readable
  colnames(allData_MNSD) <- gsub('^t',"Time.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('^f',"Freq.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('BodyBody',"Body",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('Body',"Body.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('Gravity',"Gravity.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('Acc',"LinAccel.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('Gyro',"AngVeloc.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('Jerk',"Jerk.",colnames(allData_MNSD))  
  colnames(allData_MNSD) <- gsub('Mag',"Magnitude.",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('\\.mean',".Mean",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('\\.std',".StdDev",colnames(allData_MNSD))
  colnames(allData_MNSD) <- gsub('\\.\\.',"\\.",colnames(allData_MNSD))

# (5) Create an independent 'tidy' data set with the average of each variable, 
#     for each activity and each subject.
  
  allData_Summary = ddply(allData_MNSD, c("Subject_ID","Activity"), numcolwise(mean))
  allData_Summary = arrange(allData_Summary, Subject_ID, Activity_ID)
  allData_Summary$Activity_ID <- NULL
  
  #Write the outfile to the working directory
  write.table(allData_Summary, file="tidyData.txt", sep="\t", row.names = FALSE)