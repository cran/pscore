% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/misc.R
\name{winsorizor}
\alias{winsorizor}
\title{Winsorize at specified percentiles}
\usage{
winsorizor(d, percentile, na.rm = TRUE)
}
\arguments{
\item{d}{A vector, matrix, or data frame to be winsorized}

\item{percentile}{The percentile bounded by [0, 1] to winsorize data at}

\item{na.rm}{A logical whether to remove NAs.}
}
\value{
winsorized data. Attributes are included to list the exact values
  (for each variable, if a data frame or matrix) used to winsorize
  at the lower and upper ends.
}
\description{
Simple function winsorizes data at the specified percentile.
}
\examples{
dev.new(width = 10, height = 5)
par(mfrow = c(1, 2))
hist(as.vector(eurodist), main = "Eurodist")
hist(winsorizor(as.vector(eurodist), .05), main = "Eurodist with lower and upper\\n5\% winsorized")
}

