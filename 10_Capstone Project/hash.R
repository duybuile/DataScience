library(hash)

add_word_to_freq <- function(word, freq) {
  if (word != "") {
    count <- 0
    if (has.key(word, freq)) {
      count <- freq[[word]]
    }
    freq[[word]] <- count + 1
  }
}

freq <- hash()

# Loop over words in file, and dump them into the hash.
for (i in 1:nrow(biGram))
{
  add_word_to_freq(row.names(biGram)[i], freq)
}

# Look up some word's count in the hash.
count <- freq[[row.names(biGram)[5]]]

# Read out and sort the frequencies.
# This yields a named vector, with the words as names
# and counts as values.
sorted_frequencies <- sort(values(freq), decreasing=TRUE)

# Save the hash out to a file.
saveRDS(freq, file="word_frequencies.Rds")

# Read it back in.  (Must do library(hash) before this.)
freq <- readRDS("word_frequencies.Rds")