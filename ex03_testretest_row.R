# Statistics One, Lezione 6
# analisi di affidabilità : Test/Retest - Righe Aggiuntive
library(psych)

# carica i dati nel dataframe dal file richiesto
impact.row <-read.table("STATS1.EX.03.ROW.txt", header=T)

# lista di variabili nel dataframe
names(impact.row)

# descriptive
describe.by(impact.row, impact.row$test)


# correlations (A & B)
cor(impact.col$memory.verbal[impact.row$test=="A"], impact.col$memory.verbal[impact.row$test=="B"])
cor(impact.col$memory.visual[impact.row$test=="A"], impact.col$memory.visual[impact.row$test=="B"])
cor(impact.col$speed.vismotor[impact.row$test=="A"], impact.col$speed.vismotor[impact.row$test=="B"])
cor(impact.col$speed.general[impact.row$test=="A"], impact.col$speed.general[impact.row$test=="B"])
cor(impact.col$impulse.control[impact.row$test=="A"], impact.col$impulse.control[impact.row$test=="B"])