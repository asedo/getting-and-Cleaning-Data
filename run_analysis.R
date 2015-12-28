# Arturo
#Course: Getting and Cleaning Data - getdata-035
# Assignment : Project 1
install.packages("plyr")
library(plyr)


# Clean environment to make sure code will work brand new runs
rm(list=ls())

# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
# Before merging and manipulating the data, one has to download and unzip the contents. 

# set working directory, check to make sure directory and zip file exist before downloading and unzipping.  
# will delete before submission.
setwd("C:/Users/Art/Documents/Coursera/Analytics/Data Clensing/Project/github/getting-and-Cleaning-Data")
getwd()

if(!file.exists("./datadir")){dir.create("./datadir")}
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists("./datadir/GetAndCleanProject1.zip")){
  download.file(url, destfile = "./datadir/GetAndCleanProject1.zip")
  downloadDate <- date()
  downloadDate
  }

unzip("./datadir/GetAndCleanProject1.zip", exdir = "./datadir")
rootdir <- "./datadir/UCI HAR Dataset"
datafiles <- list.files(rootdir, recursive = TRUE)

if(length(datafiles) != 28 ) {stop(" Zip file not properly unpacked!! ")}

  # Now read the test data : Activity, Subject and Features
activityTestData  <- read.table(file.path(rootdir, "test" , "Y_test.txt" ),header = FALSE)
subjectTestData  <- read.table(file.path(rootdir, "test" , "subject_test.txt" ),header = FALSE)
featuresTestData<-read.table(file.path(rootdir, "test" , "X_test.txt" ),header = FALSE)

# Read the training data : Activity, Subject and Features
activityTrainData  <- read.table(file.path(rootdir, "train" , "Y_train.txt" ),header = FALSE)
subjectTrainData  <- read.table(file.path(rootdir, "train" , "subject_train.txt" ),header = FALSE)
featuresTrainData<-read.table(file.path(rootdir, "train" , "X_train.txt" ),header = FALSE)

# Read Activity Labels
activityLabels <- read.table(file.path(rootdir, "activity_labels.txt"),header = FALSE)
names(activityLabels) <- c("Activity","Activity Name")
#names(activityLabels)

# Data is now read into tables, now combine tables
activityData <- rbind(activityTrainData, activityTestData)
subjectData <-rbind(subjectTrainData,subjectTestData)
featuresData <- rbind(featuresTrainData, featuresTestData)

#Add labels
names(subjectData) <- c("Subject")
featureNames <- read.table(file.path(rootdir,"features.txt"), head = FALSE)
names(featuresData) <- featureNames$V2

# OK.... Data is loaded into data frames and labels have been copied to names()
# now we merge the columns!
allData <- cbind(featuresData, cbind( subjectData, activityData ))
#rename V1 to Activity
names(allData) <- sub("V1", "Activity", names(allData))
#dim(allData2)
#Join activity data with activity names
allData <- join(allData, activityLabels, by = "Activity", match = "first")
#names(allData)

# allData df now contains the combined data 
#Question 1 results completed


# -----------------------------------------------------------------
# Question 2. Extract only the measurements on the mean and standard deviation. 
# You will also require Subject, the person who you got the sensor data from, 
# as well as the Activity the subject was doing when the sensor data was taken. 

meanStdSensorData <- allData[,grepl("mean|std|Subject|Activity", names(allData))]
#length(meanStdSensorData)
#View(meanStdSensorData)
#str(meanStdSensorData)
#names(meanStdSensorData)

# 4. Appropriately labels the data set with descriptive variable names.
# Looked up relevant data from file features_info.txt that was within the zip file.
# Let's make the fields look more readable.

#remove parentheses from names
names(meanStdSensorData) <-sub("\\(|\\)", "", names(meanStdSensorData))
# Change ^f to frequency, ^t to time
names(meanStdSensorData) <-sub("^f", "frequency", names(meanStdSensorData))
names(meanStdSensorData) <-sub("^t", "time", names(meanStdSensorData))
# Change Acc to Acceleration to frequency
names(meanStdSensorData) <- sub("Acc", "Acceleration", names(meanStdSensorData))
# Change Mag in label, to Magnitude
names(meanStdSensorData) <- sub("Mag", "Magnitude", names(meanStdSensorData))
# Change BodyBody in label, to Body
names(meanStdSensorData) <- sub("BodyBody", "Body", names(meanStdSensorData))
# Change Freq in label, to Frequency
names(meanStdSensorData) <- sub("Freq", "Frequency", names(meanStdSensorData))
# Change Freq in label, to Frequency
names(meanStdSensorData) <- sub("Freq", "Frequency", names(meanStdSensorData))

#Below lines used for testing :0)
#names(meanStdSensorData[,grepl("Fre", names(meanStdSensorData))])
#sub("Freq", "Frequency", names(meanStdSensorData))
#names(meanStdSensorData)

# 5. From the data set in step 4, creates a second, independent tidy data set with :
# the average of each variable for each activity and each subject.

averageByActivityandSubject = ddply(meanStdSensorData, c("Subject","Activity"), numcolwise(mean))
write.table(averageByActivityandSubject, file = "averageByActivityandSubject.txt")


