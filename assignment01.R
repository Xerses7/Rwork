# Assignment 1 Statistics One Course
# read data in script, analyze data from a training experiment
# Working memory with designed sports training 

# import psych library
library(psych)

# import data and assign subset values to "des" and "aes" variables
memory_data = read.table('DAA.01.txt', header=T)
des<-subset(memory_data, memory_data$cond == "des")
aer<-subset(memory_data, memory_data$cond == "aer")

# names of variables
names(memory_data)

# layout: designate 8 spaces with a 4x2 matrix 
layout(matrix(c(1,2,3,4,5,6,7,8), 2, 4, byrow=TRUE))

# Aerobic training Subset
# Pre-exercise Spatial Working Memory capacity (pre.wm.s)
hist(aer$pre.wm.s, xlab="Spatial Working Memory", ylab="", main="Pre Aerobial Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Pre-exercise Verbal Working Memory capacity (pre.wm.v)
hist(aer$pre.wm.v, xlab="Verbal Working Memory", ylab="", main="Pre Aerobial Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Post-exercise Spatial Working Memory capacity (post.wm.s)
hist(aer$post.wm.s, xlab="Spatial Working Memory", ylab="", main="Post Aerobial Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Post-exercise Verbal Working Memory capacity (post.wm.v)
hist(aer$post.wm.v, xlab="Verbal Working Memory", ylab="", main="Post Aerobial Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Designed sports training Subset
# Pre-exercise Spatial Working Memory capacity (pre.wm.s)
hist(des$pre.wm.s, xlab="Spatial Working Memory", ylab="", main="Pre Sports Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Pre-exercise Verbal Working Memory capacity (pre.wm.v)
hist(des$pre.wm.v, xlab="Verbal Working Memory", ylab="", main="Pre Sports Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Post-exercise Spatial Working Memory capacity (post.wm.s)
hist(des$post.wm.s, xlab="Spatial Working Memory", ylab="", main="Post Sports Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# Post-exercise Verbal Working Memory capacity (post.wm.v)
hist(des$post.wm.v, xlab="Verbal Working Memory", ylab="", main="Post Sports Training", xlim=(c(0,55)), ylim=(c(0,60)), breaks=seq(0,55,5))

# descriptive statistics for Aerobial Training
describe(aer)

# descriptive statistics for Designed Sports Training
describe(des)


