getwd()
setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
spotifydata <- read.csv("spotify_data.csv", stringsAsFactors = FALSE)
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
spotifydata <- spotifydata[-3]
spotifydata <- spotifydata[-7]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-14]


spotifydata$popularity = cut(spotifydata$popularity, 4, labels=c('Unknown','Not very popular','Popular', 'Extremely Popular')) 
str(spotifydata)

spotifydata_n <- as.data.frame(lapply(spotifydata[2:13], normalize))



summary(spotifydata_n$popularity)
spotifydata_n_train <- spotifydata_n[70000:169909, ]
spotifydata_n_test <- spotifydata_n[1:69999, ]
install.packages("class")
library(class)
install.packages("gmodels")
library(gmodels)
spotify_train_labels <- spotifydata[70000:169909, 1]
spotify_test_labels <- spotifydata[1:69999, 1]
spotify_test_pred <- knn(train = spotifydata_n_train, test = spotifydata_n_test,
                      cl = spotify_train_labels, k=316)

CrossTable(x = spotify_test_labels, y = spotify_test_pred,
           prop.chisq=FALSE)

