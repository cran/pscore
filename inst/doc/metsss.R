## ----include = FALSE----------------------------------------------------------

knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>")


## ----eval = FALSE-------------------------------------------------------------
# ## install the pscore package
# install.packages("pscore")

## ----setup--------------------------------------------------------------------
library(pscore)

## -----------------------------------------------------------------------------
system.file("extdata", "sample_metsss.csv", package = "pscore")

## -----------------------------------------------------------------------------
## load data
d <- read.csv(
  system.file("extdata", "sample_metsss.csv", package = "pscore"))

## ----echo = FALSE, results = "asis"-------------------------------------------
knitr::kable(d)

## -----------------------------------------------------------------------------
str(d)

## -----------------------------------------------------------------------------
## use the MetSSS calculator to score the data
dscored <- MetSSS(d)

## ----echo = FALSE, results = "asis"-------------------------------------------
knitr::kable(dscored)

## ----eval = FALSE-------------------------------------------------------------
# ## this will tell you where the file will be saved by R
# getwd()
# 
# ## save the scored data back to a CSV file
# write.csv(dscored, file = "scored_metsss.csv", row.names = FALSE)

