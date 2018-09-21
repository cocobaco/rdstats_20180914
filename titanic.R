# naive bayes = for text classification

library(e1071)

data(Titanic)

# convert list to data frame
Titanic_df <- as.data.frame(Titanic)

head(Titanic_df)

table(Titanic_dataset$Survived)

# create data from table
repeating_sequence <- rep.int(seq_len(nrow(Titanic_df)), 
                              Titanic_df$Freq)

Titanic_dataset <- Titanic_df[repeating_sequence, ]

# drop frequency
Titanic_dataset$Freq <- NULL

head(Titanic_dataset)

# . = the remaining parameters
nbmodel <- naiveBayes(Survived ~ ., data=Titanic_dataset)

titanic_pred <- predict(nbmodel, Titanic_dataset)

table(Titanic_dataset$Survived, titanic_pred)

CrossTable(Titanic_dataset$Survived, titanic_pred)