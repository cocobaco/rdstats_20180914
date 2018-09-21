data <- read.csv('banknote.csv', header=T)

head(data)

# split data into train and test sets
set.seed(111)
testindex <- sample(1:nrow(data), 372)
traindata <- data[-testindex,]
testdata <- data[testindex,]
xtrain <- subset(traindata, select=-class)
ytrain <- traindata$class
xtest <- subset(testdata, select=-class)
ytest <- testdata$class

truth <- as.numeric((ytest==1))

# logistic regression
logreg <- glm(class ~ ., data=traindata, family=binomial())
prob <- predict(logreg, newdata=testdata, type='response')
logreg.pred <- rep(0, nrow(testdata))
# use 0.5 as cutoff
logreg.pred[prob >= 0.5] <- 1
xtab <- table(truth, logreg.pred)
print('logistic regression confusion matrix:')
xtab

# k-NN
library(class)
knn.pred <- knn(train=traindata, test=testdata, cl=ytrain, k=3)
xtab <- table(truth, knn.pred)
print('k-NN confusion matrix:')
xtab

# decision tree
library(C50)
dtree <- C5.0(xtrain, as.factor(ytrain))
dtree.pred <- predict(dtree, testdata)
xtab <- table(truth, dtree.pred)
print('decision tree confusion matrix:')
xtab

# svm
svm.model <- svm(class ~ ., data=traindata)
svm.pred <- predict(svm.model, xtest)
xtab <- table(truth, svm.pred)
print('SVM confusion matrix:')
xtab

# naive bayes
nbmodel <- naiveBayes(class ~ ., data=traindata)
nb.pred <- predict(nbmodel, testdata)
xtab <- table(truth, nb.pred)
print('Naive Bayes confusion matrix:')
xtab


