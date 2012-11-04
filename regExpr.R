# Regular Expressions & Homicide data
homicides <- readLines("homicides.txt")
homicides[1]
length(grep("Cause: shooting", homicides))

i <- grep("[cC]ause: [Ss]hooting", homicides)
j <- grep("[Ss]hooting", homicides)
str(i)

str(j)
# sottrai gli ellementi di i da j
setdiff(i,j)
# sottrai gli elementi di j in i
setdiff(j,i)

grep("^New", state.name)

grep("^New", state.name, value=TRUE)

#Numero di omicidi per pugnalamento
length(grep("[Ss]tabbing", homicides))

# estrarre la data
r <- regexpr("<dd>[Ff]ound(.*?)</dd>", homicides[1:5])

substr(homicides[1], 177, 177 + 33 - 1)

# usare regmatches per non usare substr()
rm <-regmatches(homicides[1:5], r)

x <- substr(homicides[1], 177, 177 + 33- 1)
x

#sostituisci solo la prima incidenza del pattern
sub("<dd>[Ff]ound on |</dd>", "", x)

# sostituisci tutte le incidenze del pattern
gsub("<dd>[Ff]ound on |</dd>", "", x)


# sostituire in un vettore
dd <-gsub("<dd>[Ff]ound on |</dd>", "", rm)

as.Date(dd, "%B %d, %Y")

# regexec
rx <- regexec("<dd>[Ff]ound on (.*?)</dd>", homicides[1:2])
regmatches(homicides[1:2], rx)

#plot del numero di omicidi mensile
months <- list(January=1, February=2, March=3, April=4, May=5, June=6, July=7, August=8, September=9, October=10, November=11, December=12) 
r <- regexec("<dd>[F|f]ound on ([A-Z][a-z]+) +(.*?)</dd>", homicides)
dates <- sapply(regmatches(homicides,r), function(x) paste(months[[x[2]]], x[3])) 
dates <-as.Date(dates, "%m %d, %Y") 
hist(dates, "month", freq = TRUE)

help(as.Date)
