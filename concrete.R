concrete <- read.csv('concrete.csv', header=T)

normalize <- function(x){
  (x-min(x)) / (max(x)-min(x))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))

concrete_train <- concrete_norm[1:773,]
concrete_test <- concrete_norm[774:1030,]

library(neuralnet)
annmodel <- neuralnet(as.numeric(strength >= 0.4) 
                      ~ cement + slag + ash + water + superplastic +
                        coarseagg + fineagg + age, 
                      data=concrete_train, hidden=0, linear.output=F)

plot(annmodel)

annmodel2 <- neuralnet(as.numeric(strength >= 0.4) 
                      ~ cement + slag + ash + water + superplastic +
                        coarseagg + fineagg + age, 
                      data=concrete_train, hidden=1, linear.output=F)

plot(annmodel2)

results_class1 <- compute(annmodel, concrete_test[, 1:8])

CrossTable(as.numeric(concrete_test$strength >= 0.4), 
           as.numeric(results_class1$net.result >= 0.5))