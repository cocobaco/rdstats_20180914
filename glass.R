# support vector machine (svm)

data(Glass, package='mlbench')

head(Glass)

# split data
set.seed(39)

trainindex <- sample(1:nrow(Glass), 150)
trainset <- Glass[trainindex,]
testset <- Glass[-trainindex,]

svm.model <- svm(Type ~ ., data=trainset)
svm.pred <- predict(svm.model, testset[,-10])

table(testset[,10], svm.pred)

CrossTable(testset[,10], svm.pred)