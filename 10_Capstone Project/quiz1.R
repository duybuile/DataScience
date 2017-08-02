setwd("C:/Users/duy.bui/OneDrive/Courses/Capstone Project/Program")

# Load libraries
library(tm)

# Prepare URL

en_US.blogs.url <- paste(getwd(), "final/en_US/en_US.blogs.txt", sep = "/")
en_US.news.url <- paste(getwd(), "final/en_US/en_US.news.txt", sep = "/")
en_US.twitter.url <- paste(getwd(), "final/en_US/en_US.twitter.txt", sep = "/")

en_US.blogs <- readLines(en_US.blogs.url, skipNul = TRUE)
en_US.news <- readLines(en_US.news.url, skipNul = TRUE)
en_US.twitter <- readLines(en_US.twitter.url, skipNul = TRUE)

rm(en_US.blogs.url, en_US.news.url, en_US.twitter.url)

a = grep("but the defense", en_US.blogs)
b = grep("but the defense", en_US.news)
c = grep("but the defense", en_US.twitter)

a = grep("must be asleep", en_US.blogs)
b = grep("must be asleep", en_US.news)
c = grep("must be asleep", en_US.twitter)

a = grep("must be callous", en_US.blogs)
b = grep("must be callous", en_US.news)
c = grep("must be callous", en_US.twitter)

a = grep("must be insane", en_US.blogs)
b = grep("must be insane", en_US.news)
c = grep("must be insane", en_US.twitter)

findLongestLine <- function(){
  
  max1 <- max(nchar(en_US.blogs))
  max2 <- max(nchar(en_US.news))
  max3 <- max(nchar(en_US.twitter))
  max(c(max1, max2, max3))
}

findLongestLine()
rm(findLongestLine)

# Love/Hate
findOccurances <- function(df){
  
  love <- length(grep("love", en_US.twitter))
  hate <- length(grep("hate", en_US.twitter))
  love/hate
}

en_US.twitter[grep("biostats", en_US.twitter)]

grep("A computer once", en_US.twitter)

# Get the corpus
encorpus <- Corpus(DirSource("final/en_US/"), readerControl = list(language="lat"))
class(encorpus[[1]])
summary(encorpus)
meta(encorpus[[1]])
length(encorpus)
show(encorpus)
new("TermDocMatrix", Data = tdm, Weighting = weightTf)
txt <- system.file("texts", "txt", package = "tm")
(ovid <- Corpus(DirSource(txt), readerControl = list(reader = readPlain,language = "la",load = TRUE)))
Corpus(DirSource(txt), readerControl = list(reader = readPlain,language = "la", load = TRUE), 
       dbControl = list(useDb = TRUE, dbName = "/home/user/oviddb", dbType = "DB1"))
inspect(encorpus[1])


findWords <- function(words, list){
  
  for(i in 1:length(list)){
    dat = list[i]
    index = grep(words, dat)
    dat[index]
  }
}