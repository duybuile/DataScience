rankall <- function(outcome, num = "best") {
  
  #Read data from file
  data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
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
  
  data <- data[order (as.numeric(data [,outcome]), as.character(data$name)), ]
  output <- data.frame() 
  ## For each state, find the hospital of the given rank
  for( st in levels(as.factor(data$state)) ) { 
    
    
    onestate <- data [data$state == st & data[outcome] != "Not Available",]
    vals <- order (onestate[,outcome])
    
    if(num == "best")
      rowIndex = which.min(onestate [, outcome])
    else if(num == "worst")
      rowIndex = which.max(onestate [, outcome])
    else #if(num > length(vals))
      rowIndex = num
    #else
      #rowIndex = which(vals == num)
    
    onestate <- matrix(c(onestate[rowIndex,1],onestate[1,2]), nrow = 1)
    output <- rbind(output, onestate)
  }
  
  colnames(output) <- (c("hospital", "state"))
  output
  
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}