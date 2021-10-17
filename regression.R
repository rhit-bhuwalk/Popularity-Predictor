getwd()
setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
spotifydata <- read.csv("spotify_data.csv", stringsAsFactors = FALSE)
spotifydata$summary
summary(spotifydata)
spotifydata$summary
spotifydata <- spotifydata[-3]
spotifydata <- spotifydata[-7]
spotifydata <- spotifydata[-13]
spotifydata <- spotifydata[-16]
cor(spotifydata[c("popularity", "danceability", "duration_ms", "energy","instrumentalness","liveness", "loudness","speechiness","tempo","age")])
spm <- lm(popularity ~ danceability + duration_ms + energy + instrumentalness 
              +liveness+loudness+speechiness+tempo+age, data = spotifydata)
spm
summary(spm)
spotifydata$age2 <- spotifydata$age^2
spm2 <- lm(popularity ~ danceability + duration_ms + energy + instrumentalness 
          +liveness+loudness+speechiness+tempo+age+age2, data = spotifydata)
spm2
