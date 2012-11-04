# Esercizio 1 Statistics One
# Header=T per considerare la prima riga come nome dei campi
library(psych)

#importa i dati
ratings <-read.table("supplemental_stats1_ex01.txt", header=T)

#che tipo di oggetto è ratings ?
class(ratings)

# fai una lista con i nomi delle variabili presenti nel dataset
names(ratings)

#layout: c è 'concatenate' stampa i quattro istogrammi in una pagina 
layout(matrix(c(1,2,3,4), 2, 2, byrow=TRUE))

# disegna gli istogrammi
hist(ratings$WoopWoop, xlab="Rating")
hist(ratings$RedTruck, xlab="Rating")
hist(ratings$HobNob, xlab="Rating")
hist(ratings$FourPlay, xlab="Rating")

#statistiche descrittive
describe(ratings)