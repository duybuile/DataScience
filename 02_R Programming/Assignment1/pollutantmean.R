pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  file_path <- paste(getwd(), "specdata", sep = "/")
  files_list <- dir(path = file_path, full.names = TRUE)
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  #pollutant <- c("sulfate", "nitrate")
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  #myFiles <- list.files(path=directory, pattern="csv")
  #setwd(directory)
  
  myData <- data.frame()
  
  for(i in id){
    #newRead <- read.csv(myFiles[i])
    #myData <- rbind(newRead)
    myData <- rbind(myData, read.csv(files_list[i]))
  }
  
  if(pollutant == "sulfate"){
    pollutantmean <- mean(myData$sulfate, na.rm=TRUE)
  }
  else if (pollutant == "nitrate"){
    pollutantmean <- mean(myData$nitrate, na.rm = TRUE)
  }
  
  pollutantmean
}

