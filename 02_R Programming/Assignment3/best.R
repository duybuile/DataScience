## Read outcome data
## Check that state and outcome are valid
## Return hospital name in that state with lowest 30-day death rate
best <- function(state, outcome) {
  
  #Read data from file
  data = read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  #Check that outcome is valid
  outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (outcome %in% outcomes == FALSE)
    stop("invalide outcome")
  
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
  
  ##Retrieve rows where state with lowest 30-day death rate
  #Retrieve rows where state is equal to input state and outcome is not NA
  data <- data [data$state == state & data[outcome] != "Not Available",]
  #Retrieve the outcome column 
  vals <- data [, outcome]
  #Retrieve the minimum row in this column
  rowNum <- which.min(vals)
  
  #Return the hospital name in that state with lowest 30-day death rate
  data[rowNum, ]$name
}