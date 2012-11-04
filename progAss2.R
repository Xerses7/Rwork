# programming assignment 2
# outcome of care measures (19)

# exercise 1
# plot data from 30 days heart attack rates
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
ncol(outcome)
nrow(outcome)

# histogram of 30 day heart attack rate
outcome[,11] <- as.numeric(outcome[,11])
hist(outcome[,11], xlab= "30-day Death Rate", main = "Heart Attack 30-day Death Rate")

# 3 histograms for heart attack, heart failures, pneumonia
outcome[,11] <- as.numeric(outcome[,11])
outcome[,17] <- as.numeric(outcome[,17])
outcome[,23] <- as.numeric(outcome[,23])

# histograms in 3 rows, 1 column
par(mfrow = c(3,1))
?hist
range(outcome[,11])
hist(outcome[,11], xlab= "30-day Death Rate",xlim=c(5,20), main = "Heart Attack")
hist(outcome[,17], xlab= "30-day Death Rate",xlim=c(5,20), main = "Heart Failure")
hist(outcome[,23], xlab= "30-day Death Rate",xlim=c(5,20), main = "Pneumonia")

# exercise 3
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
outcome[,11] <- as.numeric(outcome[,11])
tableS <-as.list(table(outcome$State))
outcome2 <- subset(outcome, outcome$State > 19)

state
tableS


