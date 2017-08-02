# Data is loaded and clean in this file

setwd("C:/Users/duy.bui/OneDrive/Courses/Capstone Project/Program")

# Load the libraries
library(tm)
library(RWeka)

# Produce the sample
in_names <- c("en_US.blogs.txt", "en_US.news.txt", "en_US.twitter.txt")
endir <- paste(getwd(), "final/en_US", sep = "/")
infiledir <- as.vector(sapply(in_names, function(x) paste(endir, x, sep = "/")))

smpdir <- paste(getwd(), "sample", sep="/")
out_names  <- c("blogs.csv", "news.csv", "twitter.csv")
outfiledir <- as.vector(sapply(out_names, function(x) paste(smpdir, x, sep = "/")))


# 
# transform <- function(dict, x){
#   n <- nrow(dict)
#   for (i in 1:n) x <- gsub(dict[i, "from"], dict[i, "to"], x)
#   x
# }

generateSample <- function(percent, inFile, outFile){
  
  incon <- file(inFile, open = "rt")
  file <- readLines(incon, skipNul = TRUE, encoding = "UTF-8")
  close(incon)
  
  set.seed(3223)
  sample <- sample(file, size = length(file)*percent)
  sample <- iconv(sample, to="ASCII", sub = "") #Remove weird characters
  
  outcon <- file(outFile, open = "wt")
  writeLines(sample, outcon, sep = "\n")
  close(outcon)
}

for(i in 1:3) generateSample(0.1, infiledir[i], outfiledir[i])
gc()

# Load the corpus
myCorpus <- Corpus(DirSource(smpdir), readerControl = list(language = "en_US"))

# Clean corpus
cleanCorpus <- function(corpus){
  
  # Transform any special characters into space
  toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x)) 
  corpus.tmp <- tm_map(corpus, toSpace, "/|@|\\|")
  
  # Remove punctuation
  corpus.tmp <- tm_map(corpus.tmp, removePunctuation)
  
  # Remove number
  corpus.tmp <- tm_map(corpus.tmp, removeNumbers)
  
  # Transform to lower case
  corpus.tmp <- tm_map(corpus.tmp, content_transformer(tolower))
  
  # Remove profanity words
  profanity1 <- read.csv("badwords.txt", stringsAsFactors = FALSE, header = FALSE)
  profanity2 <- read.csv("ggbadwords.txt", stringsAsFactors = FALSE, header = FALSE)
  profanity <- rbind(profanity1, profanity2) #Combine the two lists
  corpus.tmp <- tm_map(corpus.tmp, removeWords, profanity$V1)
  
  # Fix common spelling mistakes
  toStr <- content_transformer(function(x, from, to) gsub(from, to, x))
  corpus.tmp <- tm_map(corpus.tmp, toStr, "teh", "the")
  corpus.tmp <- tm_map(corpus.tmp, toStr, "siad", "said")
  
  # Fix shorthand writing
  shorthand <- read.csv(paste(getwd(), "shorthand.csv", sep = "/"), header = TRUE, stringsAsFactors = FALSE)
  for(i in 1:nrow(shorthand)) corpus.tmp <- tm_map(corpus.tmp, toStr, shorthand[i, "from"], shorthand[i, "to"])
  
  # Strip whitespace
  corpus.tmp <- tm_map(corpus.tmp, stripWhitespace)
  
  return(corpus.tmp)
}

# Extract prediction word
predWord <- function(word, ngram){
  
  split <- unlist(strsplit(word, ' '))
  return(split[ngram])
}

# Extract base word
baseWord <- function(word, ngram){
  
  split <- unlist(strsplit(word, ' '))
  n = ngram - 1
  if(n == 1) return(split[n])
  else return(paste(split[1:n], collapse = " "))
}

# Find the n-gram 
findnGram <- function(corpus, ngram){
  
  # Create Term Document Matrix with tokenization
  options(mc.cores=1)
  #options( java.parameters = "-Xms8g -Xmx10g" )
  gramTokenizer <- function(x) NGramTokenizer(x,Weka_control(min=ngram,max=ngram))
  tdm <- TermDocumentMatrix(corpus, control = list(tokenize = gramTokenizer))
  
  # Sum the count of each term
  nGram<-rowSums(as.matrix(tdm))
  nGram <- sort(nGram, decreasing = TRUE)
  
  pred <- as.vector(sapply(names(nGram), function(x) predWord(x, ngram)))
  base <- as.vector(sapply(names(nGram), function(x) baseWord(x, ngram)))
  
  # Create a data frame with base words, prediction words and frequency
  df <- data.frame(baseWord = base, predWord = pred, freq = nGram)
  
  return(df)
}

myCorpus <- cleanCorpus(myCorpus)
biGram <- findnGram(myCorpus, 2)
triGram <- findnGram(myCorpus, 3)
quaGram <- findnGram(myCorpus, 4)
quingram <- findnGram(myCorpus, 5)

save(biGram, triGram, quaGram, file = "ngram.RData")

biGram <- subset(biGram, biGram$freq > 1)
quaGram <- subset(quaGram, quaGram$freq > 1)
triGram <- subset(triGram, triGram$freq > 1)
quingram <- subset(quingram, quingram$freq > 1)

save(biGram, triGram, quaGram, file = "ngram_small.RData")
save(quingram, file = "quingram.RData")

profanity1 <- read.csv("badwords.txt", stringsAsFactors = FALSE, header = FALSE)
profanity2 <- read.csv("ggbadwords.txt", stringsAsFactors = FALSE, header = FALSE)
profanity <- rbind(profanity1, profanity2) #Combine the two lists

save(profanity, file = "profanity.RData")
