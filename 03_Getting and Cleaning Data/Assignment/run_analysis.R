analysis <- function(){
  
  #Test data
  x_test <- read.csv(file = "./data/test/X_test.txt", header = FALSE, sep="")
  y_test <- read.csv(file = "./data/test/y_test.txt", header = FALSE)
  subject_test <- read.csv(file = "./data/test/subject_test.txt", header = FALSE)
  
  #Training data
  x_train <- read.csv(file = "./data/train/X_train.txt", header = FALSE, sep="")
  y_train <- read.csv(file = "./data/train/y_train.txt", header = FALSE)
  subject_train <- read.csv(file = "./data/train/subject_train.txt", header = FALSE)
  
  #combine data of testing and training
  x <- rbind(x_test, x_train)
  y <- rbind(y_test, y_train)
  subject <- rbind(subject_test, subject_train)
  
  #Rename data of y and subject
  colnames(y)[1] <- "y"
  colnames(subject)[1] <- "subject"
  
  #combine them all to have a final dataset
  dat <- cbind(x, y, subject) 
  
  ##### Retrieve Indices and variable Names of Mean and Std   
  feature <- read.csv(file = "./data/features.txt", header = FALSE, sep="")
  meanColIndex <- grep("mean()", feature$V2, value = FALSE, fixed = TRUE)
  stdColIndex <- grep("std()", feature$V2, value = FALSE, fixed = TRUE)
  meanColName <- grep("mean()", feature$V2, value = TRUE, fixed = TRUE)
  stdColName <- grep("std()", feature$V2, value = TRUE, fixed = TRUE)
  
  #Extracts only the measurements on the mean and standard deviation for each measurement
  meanDat <- subset(dat, select = meanColIndex)
  stdDat <- subset(dat, select = c(stdColIndex, 562, 563))
  
  #Appropriately labels the data set with descriptive variable names
  colnames(meanDat) <- meanColName
  colnames(stdDat)  <- c(stdColName, "y", "subject")
  
  #Combine the mean and Std data into one
  dat <- cbind(meanDat, stdDat)
  
  #Uses descriptive activity names to name the activities in the data set
  activity_label <- read.csv(file = "./data/activity_labels.txt", header = FALSE, sep="")
  colnames(activity_label) <- c("y", "activity")
  mergedat <- merge(dat, activity_label, by.x = "y", by.y = "y", all.x = TRUE)
  
  #After the merging, the index of y is at first (since it is used as id). 
  #Now subset to remove y from the data, indices of mean and std columns are from 1 to 66  
  dat <- subset(mergedat, select = 2:69)
  
  #Creates a second, independent tidy data set with the average of each variable for each activity and each subject
  index <- 1:66
  final <- aggregate(dat[,index], by = list(dat$subject, dat$activity), mean)
  colnames(final)[1] <- "subjects"
  colnames(final)[2] <- "activities"
  
  #Write output file
  write.table(final, file="final.txt",sep = "", row.name=FALSE, col.name=TRUE)
}