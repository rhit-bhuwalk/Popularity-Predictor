getwd()
setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
spotifydata <- read.csv("spotify_data.csv", stringsAsFactors = FALSE)

spotifydata$popularity = cut(spotifydata$popularity, 4, labels=c('Unknown','Not very popular','Popular', 'Extremely Popular')) 
str(spotifydata)
table(spotifydata$popularity)
library(tm)
spotify_corpus <- VCorpus(VectorSource(spotifydata$artists))
print(spotify_corpus)
inspect(spotify_corpus[1:5])
as.character(spotify_corpus[[1]])
spotify_corpus_clean <- tm_map(spotify_corpus, content_transformer(tolower))

