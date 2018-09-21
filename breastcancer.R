# k-NN

library(mlbench)

data(BreastCancer)
summary(BreastCancer)
dim(BreastCancer)
sapply(BreastCancer, class)

sapply(BreastCancer, as.numeric)

# remove missing values (NA's)
bc <- BreastCancer[!is.na(BreastCancer$Bare.nuclei),]
dim(bc)

# create function to normalize data
# normalize numeric data (min-max)
normalize <- function(x){
  (x-min(x)) / (max(x)-min(x))
}

# trim id and target variables out
x <- as.matrix(bc[,-c(1,11)])
# convert ordered factor into numeric
x_n <- apply(x, 2, as.numeric)  # margin: 1 = row, 2 = col
# normalize each column
x_n <- apply(x_n, 2, normalize)

bc$cancer <- ifelse(bc$Class=='malignant', 1, 0)

# logistic regression

model1 <- glm((cancer==1)~Mitoses+Cell.size, data=bc,
              family=binomial())

prob <- predict(model1, newdata=bc, type='response')
predclass <- rep(0, nrow(bc))
# use 0.5 as cutoff
predclass[prob >= 0.5] <- 1
truth <- as.numeric((bc$cancer==1))
xtab <- table(truth, predclass)
xtab

# split train/test
train_data <- x_n[1:500, ]
test_data <- x_n[501:683, ]

# k-NN
library(class)
predclass <- knn(train=train_data, test=test_data, 
                 cl=bc[1:500,11], k=3)
library(gmodels)
CrossTable(x=bc[501:683, 11], y=predclass, prop.chisq=F)