getwd()
setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
spotifydata <- read.csv("spotify_data.csv", stringsAsFactors = FALSE)

spotifydata$popularity = cut(spotifydata$popularity, 4, labels=c('Unknown','Not very popular','Popular', 'Extremely Popular')) 
str(spotifydata)

normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
spotifydata <- spotifydata[-3]
spotifydata <- spotifydata[-7]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-11]
spotifydata <- spotifydata[-14]

spotifydata_n <- as.data.frame(lapply(spotifydata[2:14],normalize))
spotifydata_n$popularity<- spotifydata$popularity

summary(spotifydata_n$popularity)
spotifydata_n_train <- spotifydata_n[30001:169909, ]
spotifydata_n_test <- spotifydata_n[1:30000, ]

library(C50)
sp <- C5.0(spotifydata_n_train[-14], spotifydata_n_train$popularity)
# display simple facts about the tree
sp
# display detailed information about the tree
summary(sp)
sp_pred <- predict(sp, spotifydata_n_test)

# cross tabulation of predicted versus actual classes
library(gmodels)
CrossTable(spotifydata_n_test$popularity, sp_pred,
           prop.chisq = FALSE, prop.c = FALSE, prop.r = FALSE,
           dnn = c('actual default', 'predicted default'))

library(caret)
confusionMatrix(spotifydata_n_test$popularity, sp_pred)

library(ROCR)  
pred <- prediction(predictions = sp_pred,                      
                   labels = spotifydata_n_test$popularity)
