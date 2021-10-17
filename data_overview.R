setwd("/Users/bhuwalk/OneDrive/Documents/Summer Quarter 2019/Machine Learning")
getwd()
ls()
spotifydata <- read.csv("data.csv", stringsAsFactors = FALSE)
str(spotifydata)
summary(spotifydata)
mean(spotifydata$popularity)
range(spotifydata$popularity)
quantile(spotifydata$popularity)
IQR(spotifydata$popularity)
mode(spotifydata$popularity)


plot(x = spotifydata$year, y = spotifydata$popularity,
     main = "Scatterplot of Popularity vs. Year",
     xlab = "Year ",
     ylab = "Popularity")

plot(x = spotifydata$danceability, y = spotifydata$popularity,
     main = "Scatterplot of danceability vs. popularity",
     xlab = "danceability ",
     ylab = "Popularity")


plot(x = spotifydata$liveness, y = spotifydata$popularity,
     main = "Scatterplot of liveness vs. popularity",
     xlab = "liveness ",
     ylab = "Popularity")

plot(x = spotifydata$loudness, y = spotifydata$popularity,
     main = "Scatterplot of loudness vs. popularity",
     xlab = "loudness ",
     ylab = "Popularity")


hist(spotifydata$popularity, main = "Histogram of Popularity",
     xlab = "Popularity ($)")


hist(spotifydata$key, main = "Histogram of Key",
     xlab = "Key")


plot(x = spotifydata$key, y = spotifydata$popularity,
     main = "Scatterplot of key vs. popularity",
     xlab = "key ",
     ylab = "Popularity")


table(spotifydata$explicit)

