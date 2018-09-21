# supervised learning: regression & classification
# numeric prediction - regression, SVR, neural network
# classification - logistic regression, decision trees, nearest neighbors, naive bayes, SVM
# neural network
# unsupervised learning - clustering, pattern discovery, dimension reduction

# data types: quanlitative, quantitative
# qualitative: nominal, ordinal
# quantitative: interval, ratio

# nominal: colors, locations, sizes
# ordinal: (sortable), ratings
# interval: temperature
# ratio: begins at 0

4+5/3

xbar <- (3+5.5+6.2+10)/4
xbar

# show variables
ls()

x <- 3
x

# check type
is.numeric(x)  # return logical

# convert type
y <- as.numeric('3400')  # convert string to number

z <- 'abc'
is.character(z)

# array/vector
data <- c(4, 6, 9)
data

mean(data)
sd(data)
var(data)
summary(data)

# google: add '+R'
seq1 <- seq(1, 10, 2)
seq2 <- seq(from=3, to=20, by=3)
seq3 <- seq(from=5, length.out = 20)
plot(seq1)
plot(seq2)
plot(seq3)

length(seq3)
sum(seq3)
summary(seq3)

hist(seq3)
boxplot(seq2)

data2 <- c(pi, 2*pi, 3*pi)
# elementwise operation
data * data2

# subset
seq3[5]
seq1[1:3]
seq2[-c(2,4)]  # remove 2nd and 4th elements
summary(seq3[1:15])

# factor from vector
gender <- c('Male', 'Female', 'Male', 'Male', 'Female')
genderfactor <- as.factor(gender)
genderfactor

# factor from scratch
gender <- factor(c('Male', 'Female', 'Male', 'Male', 'Female'), 
                 levels=c('Male', 'Female'))
gender

# data frame
# variables must have same length
insurance <- read.csv('insurance.csv', header = T)
head(insurance)

# define data frame
name <- c('Piyanuch', 'Kanokporn', 'Jiraporn', 'Wasin')
gender <- c('F', 'F', 'F', 'M')
age <- c(30, 44, 34, 25)
team1 <- data.frame(name, gender, age)
team1

dim(team1)
colnames(team1)
names(team1)
rownames(team1)

team1$name
sapply(team1, class)

team1[1:2, 2:3]

mean(team1$age)

mean(team1$age[team1$gender=='F'])

attach(team1)
age
gender
detach(team1)

# list
# store different vectors of different sizes
var1 <- c('A', 'B', 'C', 'D', 'E')
var2 <- 1:3
var3 <- c(T, T, T, F)
list1 <- list(var1, var2, var3)
names(list1) <- c('a', 'b', 'c')
list1
list1[[2]]
list1[[1]][1:3]
list1$b

# stats: t-test
output <- t.test(x=1:10, y=c(7:20))

output
names(output)
output$p.value

for (i in team1){
  print(i)
}

# save data frame to text/csv file
write.table(team1, 'team1.csv', sep=',', quote=F, row.names=F, col.names=T)

# generalized linear model
library(glmnet)
# use install.packages('glmnet') to install


