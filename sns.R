sns <- read.csv('snsdata.csv', header=T)

head(sns)
dim(sns)

str(sns)

sns_scale <- scale(sns[,4:40])

set.seed(23)
kmeanc <- kmeans(sns_scale, 5)
names(kmeanc)
table(kmeanc$cluster)
kmeanc$centers


kmeanc2 <- kmeans(sns[,4:40], 5)
table(kmeanc2$cluster)
kmeanc2$centers


group1 <- sns[kmeanc$cluster==1,]
dim(group1)
summary(group1)
hist(group1$basketball)