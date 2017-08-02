complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  file_path <- paste(getwd(), "specdata", sep = "/")
  files_list <- dir(path = file_path, full.names = TRUE)
  
  #create data type for the id which is idRow
  idRow <- numeric()
  
  #create data type for the complete cases (nocs) which is nocsRow
  nocsRow <- numeric()
  
  #Read the data 
  for(i in id){
    data <- read.csv(files_list[i], header = TRUE, sep=",")
    idRow <- c(idRow, i)
    nocsRow <- c (nocsRow, sum(complete.cases(data)))
  }
  
  #Print the data
  df <- data.frame(id=numeric(), nobs = character())
  df <- data.frame(id=idRow, nobs = nocsRow)
  df
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
}