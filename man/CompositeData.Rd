% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{CompositeData}
\alias{CompositeData}
\title{An constructor function for the S4 CompositeData class}
\usage{
CompositeData(rawdata, groups, thresholds, higherisbetter, k, rawtrans)
}
\arguments{
\item{rawdata}{A data frame with at least one row and column}

\item{groups}{an optional character vector. If omitted defaults to
a character vector of all \dQuote{one}s.}

\item{thresholds}{an optional named list where names match the names in groups.
If using defaults for groups, should name it \dQuote{one}.}

\item{higherisbetter}{an optional logical vector}

\item{k}{an optional integer, the number of columns in the raw data}

\item{rawtrans}{A list of functions to transform the raw data (and thresholds).
This list should be in the same order as the variables.  For variables
that should not be transformed, use: \code{function(x) x}.}
}
\value{
An S4 object of class \dQuote{CompositeData}
}
\description{
An constructor function for the S4 CompositeData class
}
\examples{
## no custom raw data transformations
d <- CompositeData(mtcars[, c("mpg", "hp", "wt", "qsec")],
  thresholds = list(one = with(mtcars, c(
    mpg = max(mpg),
    hp = max(hp),
    wt = min(wt),
    qsec = min(qsec)))
  ),
  higherisbetter = c(TRUE, TRUE, FALSE, FALSE))

## square root transform qsec
d <- CompositeData(mtcars[, c("mpg", "hp", "wt", "qsec")],
  thresholds = list(one = with(mtcars, c(
    mpg = max(mpg),
    hp = max(hp),
    wt = min(wt),
    qsec = min(qsec)))
  ),
  higherisbetter = c(TRUE, TRUE, FALSE, FALSE),
  rawtrans = list(
    mpg = function(x) x,
    hp = function(x) x,
    wt = function(x) x,
    qsec = sqrt))

## cleanup
rm(d)
}
