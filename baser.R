myvector <- c(8,6,9,10,5)
myvector

mylist <- list(name="Dario", citta="Monza", myvector)
mylist$name
mylist$citta
mylist[[3]]

# bioconductor package
source("http://bioconductor.org/biocLite.R")
# install group packages
# biocLite()

# install only one
# biocLite("yeastExpData")

library("yeastExpData")

# media
mean(myvector)

# import library sequinr
library("seqinr")
# import fasta sequence
dengue <- read.fasta(file="dengue1.fasta")
dengueseq <- dengue[[1]]
dengueseq[1:50]
length(dengueseq)

# base composition
table(dengueseq)

# GC content
GC(dengueseq)*100

# count number of dna words
count(dengueseq, 1)
count(dengueseq, 2)
count(dengueseq, 3)

denguetable <- count(dengueseq, 1)
denguetable[[3]]
denguetable
denguetable[["g"]]

# print the last 20 nucleotides
start <- length(dengueseq) - 19
start
fine <- length(dengueseq)
fine
dengueseq[start:fine]

# Mycobacterium leprae 
# import fasta
leprae <- read.fasta(file = "leprae.fasta")
lepraeseq <- leprae[[1]]
length(lepraeseq)

#nucleotides
nucleotable <- table(lepraeseq)
nucleotable

# GC content
GC(lepraeseq)*100

# sequenza complementare alla principale
compSeq <- comp(as.vector(lepraeseq))

compSeq[1:50]
# number of nucleotides in complement
tableCompl <- count(compSeq, 1)
tableCompl
#number of nucleotides in actual sequence
tableActual <- count(lepraeseq,1)
tableActual

# number of cc cg gc
tableTwoLetter <- count(lepraeseq,2)
tableTwoLetter[["cc"]]
tableTwoLetter[["cg"]]
tableTwoLetter[["gc"]]

first1000 <- lepraeseq[1:1000]
length(first1000)
startLast <- length(lepraeseq)-999
startLast
finishLast <- length(lepraeseq)
last1000 <- lepraeseq[startLast:finishLast]
length(last1000)

source('~/Dropbox/Rwork/getCCCGGG.R')

last1000tab <- count(last1000, 2)
last1000tab
last1000tab["cc"]
getCCCGGG(last1000)
getCCCGGG(first1000)

# sequenza da 1 a 100 a passi di 1
seq(1,100,by = 1)

# ciclo for
for (i in 1:10){print (i*i)}

for (i in seq(1,10, by=2)){ print (i*i)}

#plot
myvector1 <- c(10, 15, 22, 35, 43)
myvector2 <- c(3, 3.2, 3.9, 4.1, 5.2)
plot(myvector1, myvector2, xlab = "myvector1", ylab = "myvector2")

# ---------------------------------------
# SLIDING WINDOW ANALYSIS OF GC CONTENT
# read data
dengue <- read.fasta("dengue1.fasta")
dengueseq <- dengue[[1]]

# get the GC percentage in chunks of 2000 nucleotides
start <- seq(1,length(dengueseq)-2000, by = 2000)
start
# get number of elements in start
n <- length(start)
for(i in 1:n){
  chunk <- dengueseq[start[i]:(start[i]+1999)]
  GCchunk <- GC(chunk)
  print(GCchunk)
}
#--------------------------------------

# SLIDING WINDOW PLOT OF GC CONTENT
# read data
dengue <- read.fasta("dengue1.fasta")
dengueseq <- dengue[[1]]

# get the GC percentage in chunks of 2000 nucleotides
start <- seq(1,length(dengueseq)-2000, by = 2000)

# get number of elements in start
n <- length(start)

# create a  numeric vector with the number of elements in start
GCchunks <- numeric(n)
# start

for(i in 1:n){
  chunk <- dengueseq[start[i]:(start[i]+1999)]
  GCchunk <- GC(chunk)
  # print(GCchunk)
  # collect the data in a vector
  GCchunks[i] <- GCchunk
}

# plot the data against nucleotides indices
plot(start, GCchunks,type = "b", xlab = "Nucleotides Start position", ylab = "% GC")
#-----------------------------------------------
# OVER REPRESENTED AND UNDER REPRESENTED DNA WORDS
# numero di nucleotidi singoli nella sequenza
nucleotidesCount <- count(dengueseq,1)

# frequenza G
fG <- nucleotidesCount["g"]/length(dengueseq)
# frequenza C
fC <- nucleotidesCount["c"]/length(dengueseq)

twoWordC <- count(dengueseq,2)
# frequency of GC word
fGC <- twoWordC["gc"]/length(dengueseq)
# rho of GC word
rhoGC <-fGC/(fG * fC)

#------------------------------------------------

#exercises
slidingwindowplot(lepraeseq,20000)


