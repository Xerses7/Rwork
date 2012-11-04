# Statistics One, Assignment 2
library(psych)
library(gclus)

# carica i dati nel dataframe dal file richiesto
data <-read.table("DAA.02.txt", header=T)

# conditional descriptives
describe.by(data,data$cond)

# carica i dati nel dataframe dal file richiesto
data2 <-read.table("DAA.02.txt",colClasses = c(rep("NULL", 1), rep("character", 1), rep("integer",8)), header=T)

# scatterplots matrix
data.r = abs(cor(data2[data2$cond=="aer"]))
data.col = dmat.color(data.r)
data.o <- order.single(data.r)
cpairs(data2, data.o, panel.colors=data.col, gap=.5, main="Variables Ordered and Colored by Correlation")