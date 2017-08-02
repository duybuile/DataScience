#Write a function that takes a directory of data files and a 
#threshold for complete cases and calculates the correlation 
#between sulfate and nitrate for monitor locations where 
#the number of completely observed cases (on all variables) 
#is greater than the threshold

corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  file_path <- paste(getwd(), "specdata", sep = "/")
  files_list <- dir(path = file_path, full.names = TRUE)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  #define the data type of correlation 
  cor <- numeric()
  
  #define length of data files since no id was provided beforehand
  len <- length(files_list)
  
  #Read data
  for(i in 1:len){
    
    #data <- read.csv(files_list[i], header = TRUE, colClasses=c("NULL", NA, NA, "NULL"))
    data <- read.csv(files_list[i], header = TRUE)
    
    if (sum(complete.cases(data)) > threshold){
      
      nitrateComplete <- data[complete.cases(data), "nitrate"]
      sulfateComplete <- data[complete.cases(data), "sulfate"]
      
      cor <- c(cor, cor(nitrateComplete,sulfateComplete, use = "pairwise.complete.obs"))
      
      #cor <- c(cor, cor(data$sulfate, data$nitrate,use = "pairwise.complete.obs",method = c("pearson")))
    }
      
  }
  
  ## Return a numeric vector of correlations
  cor
}