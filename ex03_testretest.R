# Statistics One, Lezione 6
# analisi di affidabilità : Test/Retest - Colonne
library(psych)

# carica i dati nel dataframe dal file richiesto
impact.col <-read.table("STATS1.EX.03.COL.txt", header=T)

# lista di variabili nel dataframe
names(impact.col)

# descriptive
describe(impact.col)

# correlations (A & B)
cor(impact.col$memory.verbal.A, impact.col$memory.verbal.B)
cor(impact.col$memory.visual.A, impact.col$memory.visual.B)
cor(impact.col$speed.vismotor.A, impact.col$speed.vismotor.B)
cor(impact.col$speed.general.A, impact.col$speed.general.B)
cor(impact.col$impulse.control.A, impact.col$impulse.control.B)


