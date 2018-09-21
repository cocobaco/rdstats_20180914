# decision tree

credit <- read.table('german_credit.csv', sep=',', header=T)

traincredit <- credit[1:800, ]
testcredit <- credit[801:1000, ]

# build decision tree
library(C50)
credit_model <- C5.0(traincredit[,-1], as.factor(traincredit[,1]))

credit_model

summary(credit_model)

plot(credit_model)

credit_pred <- predict(credit_model, testcredit)

library(gmodels)
CrossTable(as.factor(testcredit[,1]), credit_pred, prop.chisq=F, 
                     prop.c=F, prop.r=F)


# pruning to reduce overfitting
credit_model_prune <- C5.0(traincredit[,-1], as.factor(traincredit[,1]), 
                           control=C5.0Control(winnow=TRUE, minCases = 5))

credit_model_prune