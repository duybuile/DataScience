rankhospital <- function(state, outcome, num = "best"){
  
  #Read data from file
  data <- read.csv("outcome-of-care-measures.csv", header=T,  stringsAsFactors=F)
  
  #Check that outcome is valid
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (outcome %in% outcomes == FALSE)
    stop("invalid outcome")
  
  #Retrieve data of several columns
  data <- data[c(2, 7, 11, 17, 23)]
  
  #define name for new data
  names(data)[1] <- "name"
  names(data)[2] <- "state"
  names(data)[3] <- "heart attack"
  names(data)[4] <- "heart failure"
  names(data)[5] <- "pneumonia"
  
  #Validate the state
  states <- data[, 2]
  states <- unique(states)
  if (state %in% states == FALSE)
    stop ("invalid state")
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  data <- data [data$state == state & data[outcome] != "Not Available",]
  
  #Retrieve the outcome column 
  vals <- order( as.numeric(data [,outcome]), as.character(data$name))

  #vals <- rank (as.numeric(data[,outcome]), ties.method="first")
  #vals <- sort(unique data[,outcome])
  #data <- data[with(data, vals),]
  data <- data[vals,]
  
  if(num == "best")
    rowIndex = which.min(data [, outcome])
  else if(num == "worst")
    rowIndex = which.max(data [, outcome])
  else #if(num > length(vals))
    rowIndex = num
  #else
  #  rowIndex = which(vals == num)
  
  #Return the hospital name in that state with lowest 30-day death rate
  data[rowIndex, ]$name
}

