setwd("C:/Users/duy.bui/OneDrive/Courses/Capstone Project/Program")

# Load the libraries
library(tm)
library(RWeka)

# Implement Stupid-backoff
predict <- function(input) {
  
  num.results = 5
  #Clean input
  input <- tolower(input) 
  input <- removeWords(input, profanity$V1)
  input <- removePunctuation(input)
  input <- removeNumbers(input)
  input <- stripWhitespace(input)
  
  #Get keys
  input.words <- strsplit(input," ")[[1]]
  input.words.size <- length(input.words)
  quagram.key <- ifelse(input.words.size >= 3, paste(input.words[(input.words.size-2):input.words.size],collapse = " "), NA)
  trigram.key <- ifelse(input.words.size >= 2, paste(input.words[(input.words.size-1):input.words.size],collapse = " "), NA)
  bigram.key <- input.words[input.words.size]

  #4-gram case, 1.0 (for this 4-gram model) , just the top num.results
  quaGram.subset <- subset(quaGram, quaGram$baseWord == quagram.key)
  predictions <- head(quaGram.subset[order(quaGram.subset$freq, decreasing = T),],n = num.results)
  num.rows <- nrow(predictions)
  
  if(num.rows < num.results) {
    #3-gram case, 0.4 (for this 4-gram model) , just the top num.results
    triGram.subset <- subset(triGram, triGram$baseWord == trigram.key)
    triGram.subset <- triGram.subset[!(triGram.subset$predWord %in% predictions$predWord),]
    triGram.predictions <- head(triGram.subset[order(triGram.subset$freq, decreasing = T),],n = num.results-num.rows)
    
    predictions <- rbind(predictions, triGram.predictions)
    num.rows <- nrow(predictions)
    
    if(num.rows < num.results) {
      #2-gram case, 0.4 * 0.4 (for this 4-gram model) , just the top num.results
      biGram.subset <- subset(biGram, biGram$baseWord == bigram.key)
      biGram.subset <- biGram.subset[!(biGram.subset$predWord %in% predictions$predWord),]
      biGram.predictions <- head(biGram.subset[order(biGram.subset$freq, decreasing = T),],n = num.results-num.rows)
      predictions <- rbind(predictions, biGram.predictions)
      num.rows <- nrow(predictions)   

    }
  }
  return(as.character(predictions$predWord))
}

