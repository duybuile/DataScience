#Codebooks
###Info
- Author: Duy Bui
- Course: Getting and Cleaning Data - Coursera
- Assignment 1

###Data
- **Name**: Human activity recognition Using Smartphones Dataset
- **Description**: The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities **(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)** wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

###Methods of Pre-processing data
- Load data from x-test, y-test, x-training, y-training, subject-test, subject-training
- Combine x-test, x-training, y-test, y-training to have a final data set
- Obtain names of attributes in the feature file and assign them for each attribute 
- Subset the data, only selecting columns representing mean or standard deviation
- Mapping activity numbers (in activity_label.txt) with column names in the data.
- Aggregrate to create a second, independent tidy data set with the average of each variable for each activity and each subject
- Write the data into output

###Variables
The final data set will contain the following variables
- subjects: subject number (from 1 to 30), representing the voluntary person who was involved into the experiment
- activities: name of each corresponding activity for each subject
- tBodyAcc-mean()-X: mean of body acceleration within x axis
- tBodyAcc-mean()-Y: mean of body acceleration within y axis
- tBodyAcc-mean()-Z: mean of body acceleration within z axis
- tGravityAcc-mean()-X: mean of gravity acceleration within x axis
- tGravityAcc-mean()-Y: mean of gravity acceleration within y axis
- tGravityAcc-mean()-Z: mean of gravity acceleration within z axis
- tBodyAccJerk-mean()-X: mean of body acceleration jerk within x axis
- tBodyAccJerk-mean()-Y: mean of body acceleration jerk within y axis
- tBodyAccJerk-mean()-Z: mean of body acceleration jerk within z axis
- tBodyGyroJerk-mean()-X: mean of body gyro jerk within corresponding axis
- tBodyGyroJerk-mean()-Y: mean of body gyro jerk within corresponding axis
- tBodyGyroJerk-mean()-Z: mean of body gyro jerk within corresponding axis
- tBodyAccMag-mean(): mean of body acceleration mag within corresponding axis
- tGravityAccMag-mean(): mean of gravity acceleration mag within corresponding axis
- tBodyAccJerkMag-mean(): mean of body acceleration jerk mag within corresponding axis
- tBodyGyroMag-mean(): mean of tBodyGyroMag within corresponding axis
- tBodyGyroJerkMag-mean(): mean of tBodyGyroJerkMag within corresponding axis
- fBodyAcc-mean()-X: mean of fBodyAcc within corresponding axis
- fBodyAcc-mean()-Y: mean of fBodyAcc within corresponding axis
- fBodyAcc-mean()-Z: mean of fBodyAcc within corresponding axis
- fBodyAccJerk-mean()-X: mean of fBodyAccJerk within corresponding axis
- fBodyAccJerk-mean()-Y: mean of fBodyAccJerk within corresponding axis
- fBodyAccJerk-mean()-Z: mean of fBodyAccJerk within corresponding axis
- fBodyGyro-mean()-X: mean of fBodyGyro within corresponding axis
- fBodyGyro-mean()-Y: mean of fBodyGyro within corresponding axis
- fBodyGyro-mean()-Z: mean of fBodyGyro within corresponding axis
- fBodyAccMag-mean(): mean of fBodyAccMag 
- fBodyBodyAccJerkMag-mean(): mean of fBodyBodyAccJerkMag 
- fBodyBodyGyroMag-mean(): mean of fBodyBodyGyroMag
- fBodyBodyGyroJerkMag-mean(): mean of fBodyBodyGyroJerkMag
- tBodyAcc-std()-X: standard deviation of tBodyAcc within corresponding axis
- tBodyAcc-std()-Y: standard deviation of tBodyAcc within corresponding axis
- tBodyAcc-std()-Z: standard deviation of tBodyAcc within corresponding axis
- tGravityAcc-std()-X: standard deviation of tGravityAcc within corresponding axis
- tGravityAcc-std()-Y: standard deviation of tGravityAcc within corresponding axis
- tGravityAcc-std()-Z: standard deviation of tGravityAcc within corresponding axis
- tBodyAccJerk-std()-X: standard deviation of tBodyAccJerk within corresponding axis
- tBodyAccJerk-std()-Y: standard deviation of tBodyAccJerk within corresponding axis
- tBodyAccJerk-std()-Z: standard deviation of tBodyAccJerk within corresponding axis
- tBodyGyro-std()-X: standard deviation of tBodyGyro within corresponding axis
- tBodyGyro-std()-Y: standard deviation of tBodyGyro within corresponding axis
- tBodyGyro-std()-Z: standard deviation of tBodyGyro within corresponding axis
- tBodyGyroJerk-std()-X: standard deviation of tBodyGyroJerk within corresponding axis
- tBodyGyroJerk-std()-Y: standard deviation of tBodyGyroJerk within corresponding axis
- tBodyGyroJerk-std()-Z: standard deviation of tBodyGyroJerk within corresponding axis
- tBodyAccMag-std(): standard deviation of tBodyAccMag within corresponding axis
- tGravityAccMag-std(): standard deviation of tGravityAccMag within corresponding axis
- tBodyAccJerkMag-std(): standard deviation of tBodyAccJerkMag within corresponding axis
- tBodyGyroMag-std(): standard deviation of tBodyGyroMag within corresponding axis
- tBodyGyroJerkMag-std(): standard deviation of tBodyGyroJerkMag within corresponding axis
- fBodyAcc-std()-X: standard deviation of fBodyAcc within corresponding axis
- fBodyAcc-std()-Y: standard deviation of fBodyAcc within corresponding axis
- fBodyAcc-std()-Z: standard deviation of fBodyAcc within corresponding axis
- fBodyAccJerk-std()-X: standard deviation of fBodyAccJerk within corresponding axis
- fBodyAccJerk-std()-Y: standard deviation of fBodyAccJerk within corresponding axis
- fBodyAccJerk-std()-Z: standard deviation of fBodyAccJerk within corresponding axis
- fBodyGyro-std()-X: standard deviation of fBodyGyro within corresponding axis
- fBodyGyro-std()-Y: standard deviation of fBodyGyro within corresponding axis
- fBodyGyro-std()-Z: standard deviation of fBodyGyro within corresponding axis
- fBodyAccMag-std(): standard deviation of fBodyAccMag
- fBodyBodyAccJerkMag-std(): standard deviation of fBodyBodyAccJerkMag
- fBodyBodyGyroMag-std(): standard deviation of fBodyBodyGyroMag
- fBodyBodyGyroJerkMag-std(): standard deviation of fBodyBodyGyroJerkMag