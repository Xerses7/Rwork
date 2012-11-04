# Lesson 6 Statistics One
# read data, plot histograms, get descriptives, scatterplots, correlations
impact <- read.table("STATS1.EX.02.txt", header=T)

class(impact)
library(psych)

hist(impact$memory.visual, xlab = "Visual Memory", main="Histogram", col="red")
hist(impact$memory.verbal, xlab= "Verbal Memory", main="Histogram", col="blue")
hist(impact$speed.vismotor, xlab="Speed Visual Motor", main="Histogram", col="lightgreen")
hist(impact$speed.general, xlab="General Speed", main="Histogram", col="grey")
hist(impact$impulse.control, xlab="Impulse control", main="Histogram", col="yellow")

#descriptive statistics
describe(impact)

# scatterplot verbal memory against visual memory to find correlation (y ~ x)
plot(impact$memory.verbal ~ impact$memory.visual, main="Scatterplot", ylab="Verbal memory", xlab="Visual Memory")
# + plot regression line (lm = linear model)
abline(lm(impact$memory.verbal ~ impact$memory.visual), col="blue")

# correlations one pair at a time
cor(impact$memory.verbal, impact$memory.visual)

# correlations one pair at a time with significance testing
cor.test(impact$memory.verbal, impact$memory.visual)
# df = degrees of freedom : number of data points that are free to vary

# all correlations in a matrix
cor(impact)

# scatterplot matrix
library(gclus)
impact.r = abs(cor(impact))
impact.col = dmat.color(impact.r)
impact.o <- order.single(impact.r)
cpairs(impact, impact.o, panel.colors=impact.col, gap=.5, main="Variables Ordered and Colored by Correlation")


