% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/composite.R
\name{factorComposite}
\alias{factorComposite}
\title{Score Data Using a Factor Model}
\usage{
factorComposite(object, type = c("onefactor", "secondorderfactor",
  "bifactor"), factors = "")
}
\arguments{
\item{object}{An object ready for use}

\item{type}{A character string indicating the type of factor model to use}

\item{factors}{A named list where names are the factor names and each
element is a character string of the indicator names.}
}
\value{
A list of results.
}
\description{
Create a composite using a Factor Model
}
\examples{
# this example creates distances for the built in mtcars data
# see ?mtcars for more details
# The distances are calculated from the "best" in the dataset
# defined by these thresholds
thresholds <- with(mtcars, c(
  mpg = max(mpg),
  hp = max(hp),
  wt = min(wt),
  qsec = min(qsec)))

# higher mpg and hp are better,
# whereas lower wt and qsec are better
dres <- distanceScores(mtcars[, c("mpg", "hp", "wt", "qsec")],
  thresholds = list(thresholds),
  higherisbetter = c(TRUE, TRUE, FALSE, FALSE),
  saveall = TRUE)

# see a density plot of the distance scores
dres$Density

# now prepare to create the composite
# covariance matrix will be calculated from the data
# and data will be standardized to unit variance by default
cprep <- prepareComposite(dres)

# now we can create the composite based on summing the (standardized)
# distances from our defined thresholds
# by default, distances are squared, then summed, and then square rooted
# to be back on the original scale
fcomp <- factorComposite(cprep, type = "onefactor")

# view a histogram of the composite scores
fcomp$ScoreHistogram

# summarize the composite scores
summary(fcomp$Scores$Comp)

# cleanup
rm(thresholds, dres, cprep, fcomp)
}
\seealso{
Other composite: \code{\link{distanceScores}};
  \code{\link{mahalanobisComposite}};
  \code{\link{prepareComposite}};
  \code{\link{sumComposite}}
}

