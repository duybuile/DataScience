GettingCleaningData_Assignment
==============================

The assignment of getting and cleaning data, provided by John Hopkins University
Author: Duy Bui Le
Course: Coursera

To run the program
<br>1. Download the file run_analysis.R</br>
<br>2. Download the data, extract, change the folder's name to "data" and save it in the directory containing file run_analysis.R</br>
<br>https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</br>
<br>3. Set workplace to the directory containing file run_analysis.R in R Studio</br>
<br>4. Type source("run_analysis.R") in the console to load the program</br>
<br>5. Call the program by typing analysis() </br>
<br>6. Wait and see the result (file final.txt will apprear in the same folder containg file run_analysis.R)</br>

<br>Variables interpretation for output file - Cookbooks</br>
<br>Col 1: subjects - identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. </br>
<br>Col 2: activities - identifies activity names for each subject</br>
<br>Col 3 to 35: identifies the average of each mean variable (from 3 to 35) for each activity and each subject</br>
<br>Col 36 to 68: identifies the average of each standard deviation variable (from 36 to 68) for each activity and each subject</br>
