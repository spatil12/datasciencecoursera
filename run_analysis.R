train_readings <- read.table("UCI_HAR_Dataset/train/X_train.txt") ## read train table
test_readings <- read.table("UCI_HAR_Dataset/test/X_test.txt") ## read test table
## Merge the test & train data
merged_readings <- rbind(train_readings, test_readings) 

feature_data <- read.table("UCI_HAR_Dataset/features.txt")
activity_labels <- read.table("UCI_HAR_Dataset/activity_labels.txt")
test_subjectData <- read.table("UCI_HAR_Dataset/test/subject_test.txt")
colnames(test_subjectData) = "Subject"
train_subjectData <- read.table("UCI_HAR_Dataset/train/subject_train.txt")
colnames(train_subjectData) = "Subject"
## Merge Subject data
Merged_subjects <- rbind(test_subjectData, train_subjectData)

test_activityData <- read.table("UCI_HAR_Dataset/test/y_test.txt")
colnames(test_activityData) = "Activity"
train_activityData <- read.table("UCI_HAR_Dataset/train/y_train.txt")
colnames(train_activityData) = "Activity"
## Merge Activity Data
Merged_activity<- rbind(test_activityData, train_activityData)

## Replace the numbers in Merged_activity row numbers with descriptive activity labels (Step-3)
Merged_activity$Activity[Merged_activity$Activity == 1] <- "WALKING"
Merged_activity$Activity[Merged_activity$Activity == 2] <- "WALKING_UPSTAIRS"
Merged_activity$Activity[Merged_activity$Activity == 3] <- "WALKING_DOWNSTAIRS"
Merged_activity$Activity[Merged_activity$Activity == 4] <- "SITTING"
Merged_activity$Activity[Merged_activity$Activity == 5] <- "STANDING"
Merged_activity$Activity[Merged_activity$Activity == 6] <- "LAYING"


subj_act <- cbind(Merged_subjects,Merged_activity)

## Extract the only the measurements on the mean and standard deviation for each measurement
features_req <- feature_data[grepl('mean\\(\\)|std\\(\\)',feature_data$V2),]

#Replace the names of the columns with correct variables in the merged readings.
mean_std_readings <- merged_readings[,c(features_req$V1)]
colnames(mean_std_readings) = features_req$V2

combined_readings <- cbind(subj_act,mean_std_readings)

Final_dataset <- group_by(combined_readings, Subject, Activity)

 colnames(Final_dataset) [3] <- "XTimeBody_acc_mean"
 colnames(Final_dataset) [4] <- "YTimeBody_acc_mean"
 colnames(Final_dataset) [5] <- "ZTimeBody_acc_mean"
 colnames(Final_dataset) [6] <- "XTimeBody_acc_std"
 colnames(Final_dataset) [7] <- "YTimeBody_acc_std"
 colnames(Final_dataset) [8] <- "ZTimeBody_acc_std"
 colnames(Final_dataset) [9] <- "XTimeGravity_acc_mean"
 colnames(Final_dataset) [10] <- "YTimeGravity_acc_mean"
 colnames(Final_dataset) [11] <- "ZTimeGravity_acc_mean"
 colnames(Final_dataset) [12] <- "XTimeGravity_acc_std"
 colnames(Final_dataset) [13] <- "YTimeGravity_acc_std"
 colnames(Final_dataset) [14] <- "ZTimeGravity_acc_std"

colnames(Final_dataset) [15] <- "XTimeBodyAccJerk_mean"
colnames(Final_dataset) [16] <- "YTimeBodyAccJerk_mean"
colnames(Final_dataset) [17] <- "ZTimeBodyAccJerk_mean"
colnames(Final_dataset) [18] <- "XTimeBodyAccJerk_std"
colnames(Final_dataset) [19] <- "YTimeBodyAccJerk_std"
colnames(Final_dataset) [20] <- "ZTimeBodyAccJerk_std"
colnames(Final_dataset) [21] <- "XTimeBodyGyro_mean"
 colnames(Final_dataset) [22] <- "YTimeBodyGyro_mean"
 colnames(Final_dataset) [23] <- "ZTimeBodyGyro_mean"
 colnames(Final_dataset) [24] <- "XTimeBodyGyro_std"
 colnames(Final_dataset) [25] <- "YTimeBodyGyro_std"
 colnames(Final_dataset) [26] <- "ZTimeBodyGyro_std"
colnames(Final_dataset) [27] <- "XTimeBodyGyroJerk_mean"
 colnames(Final_dataset) [28] <- "YTimeBodyGyroJerk_mean"
 colnames(Final_dataset) [29] <- "ZTimeBodyGyroJerk_mean"
 colnames(Final_dataset) [30] <- "XTimeBodyGyroJerk_std"
 colnames(Final_dataset) [31] <- "YTimeBodyGyroJerk_std"
 colnames(Final_dataset) [32] <- "ZTimeBodyGyroJerk_std"

colnames(Final_dataset) [33] <- "TimeBodyAccMag_mean"
 colnames(Final_dataset) [34] <- "TimeBodyAccMag_std"
 colnames(Final_dataset) [35] <- "TimeGravityAccMag_mean"
 colnames(Final_dataset) [36] <- "TimeGravityAccMag_std"
 colnames(Final_dataset) [37] <- "TimeBodyAccJerkMag_mean"
 colnames(Final_dataset) [38] <- "TimeBodyAccJerkMag_std"
colnames(Final_dataset) [39] <- "TimeBodyGyroMag_mean"
 colnames(Final_dataset) [40] <- "TimeBodyGyroMag_std"

 colnames(Final_dataset) [41] <- "TimeBodyGyroJerkMag_mean"
 colnames(Final_dataset) [42] <- "TimeBodyGyroJerkMag_std"
 colnames(Final_dataset) [43] <- "XFreqBodyAcc_mean"
 colnames(Final_dataset) [44] <- "YFreqBodyAcc_mean"
 colnames(Final_dataset) [45] <- "ZFreqBodyAcc_mean"
 colnames(Final_dataset) [46] <- "XFreqBodyAcc_std"
 colnames(Final_dataset) [47] <- "YFreqBodyAcc_std"
 colnames(Final_dataset) [48] <- "ZFreqBodyAcc_std"
 colnames(Final_dataset) [49] <- "XFreqBodyAccJerk_mean"
colnames(Final_dataset) [50] <- "YFreqBodyAccJerk_mean"

 colnames(Final_dataset) [51] <- "ZFreqBodyAccJerk_mean"
colnames(Final_dataset) [52] <- "XFreqBodyAccJerk_std"
 colnames(Final_dataset) [53] <- "YFreqBodyAccJerk_std"
 colnames(Final_dataset) [54] <- "ZFreqBodyAccJerk_std"
 colnames(Final_dataset) [55] <- "XFreqBodyGyro_mean"
 colnames(Final_dataset) [56] <- "YFreqBodyGyro_mean"
 colnames(Final_dataset) [57] <- "ZFreqBodyGyro_mean"
 colnames(Final_dataset) [58] <- "XFreqBodyGyro_std"
 colnames(Final_dataset) [59] <- "YFreqBodyGyro_std"
 colnames(Final_dataset) [60] <- "ZFreqBodyGyro_std"
 colnames(Final_dataset) [61] <- "FreqBodyAccMag_mean"
 colnames(Final_dataset) [62] <- "FreqBodyAccMag_std"
 colnames(Final_dataset) [63] <- "FreqBodyAccJerkMag_mean"
 colnames(Final_dataset) [64] <- "FreqBodyAccJerkMag_std"
 colnames(Final_dataset) [65] <- "FreqBodyGyroMag_mean"
 colnames(Final_dataset) [66] <- "FreqBodyGyroMag_std"
 colnames(Final_dataset) [67] <- "FreqBodyGyroMagJerk_mean"
 colnames(Final_dataset) [68] <- "FreqBodyGyroMagJerk_std"

## Step 5 creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Ultimate_dataset <- summarise_each(Final_dataset, funs(mean))
write.table(Ultimate_dataset, file="Means_bySubAct")




