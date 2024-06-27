
library(syuzhet)

my_text <-
  "Rescue crews have yet to find crash site of Iranian president.
 Nobody knows what will hapen now.
 Russian strikes on Ukraine's Kharkiv region kill at least 11.
 Amazon built a roving robot covered in UV light bulbs that could kill the coronavirus.
 Sustainability sells.
 Why consumers and clothing brands alike are turning to sustainability as a guiding light?
 Acts of violence have been commited.
 "

# Check the overall sentiment
get_sentiment(my_text)

# divide into sentences
sv <- get_sentences(my_text)
sv

# Check sentiment one by one setence
get_sentiment(sv[1])
get_sentiment(sv)

# Check the sentiment of words
pwv <- get_tokens(sv, pattern = "\\W")
syuzhet_vector <- get_sentiment(pwv, method="syuzhet")
syuzhet_vector

nrc_data <- get_nrc_sentiment(sv)
nrc_data

# Visualy exploring the percentage of each emotion
barplot(
  sort(colSums(prop.table(nrc_data[, 1:8]))), 
  horiz = TRUE, 
  cex.names = 0.7, 
  las = 1, 
  main = "Emotions in the whole sample text", xlab="Percentage"
)
