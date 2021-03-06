# CODE_BOOK
The given Data is complicated. It can be downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

## 1st Step
1. For the first step, read the test data and train data and merge them.

2. Read the feature dataset from the given data which provides all the about 561 variables(column names) for the data. Read the activity labels to find out code for each activity. Read test & train subject data and merge them.

## Step 3
Read the test & train activity data and merge them. And then replace with descriptive activity names. And column bind Subject table and Activity table.

1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

## Step 2
Extracts only the mean and standard deviation from the feature data table which will help us extract the only the measurements on the mean and standard deviation for each measurement.
And combine the resulting table with subj_act table we got in the last step.

Group the resulting data by Subject and Activity for the 5th Step.

## Step 4 
Appropriately labels the data set with descriptive variable names.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcc-XYZ and TimeGyro-XYZ. These were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcc-XYZ and TimeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccJerk-XYZ and TimeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccMag, TimeGravityAccMag, TimeBodyAccJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequecy domain signal FreqBodyAcc-XYZ, FreqBodyAccJerk-XYZ, FreqBodyGyro-XYZ, FreqBodyAccJerkMag, FreqBodyGyroMag, FreqBodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

In short acc denotes Accelerometer,Gyro denotes Gyroscope readings, Mag is for Magniture of these three dimensional signals. X, Y, Z denotes the signals in X, Y, Z directions.

The set of variables that were estimated from these signals are: 

1. mean: Mean value
2. std: Standard deviation


## Step 5 
creates a second, independent tidy data set with the average of each variable for each activity and each subject using summarise_all (lifesaver) function.
