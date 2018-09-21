# classification
# y = labels (nominal data), non-numerical

insurance <- read.table('insurance.csv', header=T, sep=',')
head(insurance)
dim(insurance)
is.factor(insurance$CONTINUE)

# logistic regression - binary (0 or 1)
# pi = P(y=1)
# logit(pi) = ln(pi/(1-pi)) = b0 + b1*x1 + b2*x2 +... + bp*bp
# logit(pi) = eta
# logistic function
# pi = e^eta/(1 + e^eta)

model1 <- glm((CONTINUE=='yes')~AGE+SEX, data=insurance, 
              family=binomial())

summary(model1)
# intercept = beta0
# other coefs = beta1, beta2, ...
# pvalue test whether beta == 0 (small pval --> significance)

# prediction
testdata <- data.frame(AGE=41, SEX=factor('MALE', 
                                          levels=c('FEMALE', 'MALE')))

# predict eta
predict(model1, newdata=testdata, type='link')

# predict probability
predict(model1, newdata=testdata, type='response')

# re-fit model
model2 <- glm((CONTINUE=='yes')~AGE, data=insurance, 
               family=binomial())
predict(model2, newdata=testdata, type='response')

testdata2 <- data.frame(AGE=c(29,41), SEX=factor(c('FEMALE', 'MALE'), 
                                          levels=c('FEMALE', 'MALE')))
predict(model1, newdata=testdata2, type='response')

# confusion matrix
prob <- predict(model1, newdata=insurance, type='response')
predclass <- rep(0, nrow(insurance))
# use 0.5 as cutoff
predclass[prob >= 0.5] <- 1
truth <- as.numeric((insurance$CONTINUE=='yes'))
xtab <- table(truth, predclass)
xtab

library(gmodels)

CrossTable(x=truth, y=predclass)
