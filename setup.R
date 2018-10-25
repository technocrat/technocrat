library(lubridate)
library(DBI)
library(RMySQL)
library(pander)
library(texreg)
library(GGally)


drv <- dbDriver("MySQL")
con <- dbConnect(drv, username="root", password="", dbname ="dlf", host="localhost")

perf <- function(x) {ifelse (x <= 2, 1, 0)}
pcthit <- function(confusion_matrix) {((confusion_matrix[[1]] + confusion_matrix[,2][2])/sum(confusion_matrix))[[1]]}
