getwd()
setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
spotifydata <- read.csv("spotify_data.csv", stringsAsFactors = FALSE)
normalize <- function(x) {
  return((x - min(x)) / (max(x) - min(x)))
}
spotifydata_n <- as.data.frame(lapply(spotifydata, normalize))
spotifydata <- spotifydata[-3]
spotifydata <- spotifydata[-7]
spotifydata <- spotifydata[-13]
spotifydata <- spotifydata[-12]
spotifydata_n <- as.data.frame(lapply(spotifydata, normalize))
spotifydata_n_train <- spotifydata_n[162001:169909, ]
spotifydata_n_test <- spotifydata_n[1:162000, ]

library(neuralnet)

# simple ANN with only a single hidden neuron
set.seed(12345) # to guarantee repeatable results
spm <- neuralnet(formula = popularity ~ acousticness + danceability + liveness+loudness+age+speechiness+energy,
                 data = spotifydata_n_train,hidden = 4)

# visualize the network topology
plot(spm)
spm_results <- compute(spm, spotifydata_n_test[-1])
# obtain predicted strength values
predicted_pop <- spm_results$net.result
# examine the correlation between predicted and actual values
cor(predicted_pop, spotifydata_n_test$popularity)
