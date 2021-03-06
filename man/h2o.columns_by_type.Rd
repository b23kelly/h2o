% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/frame.R
\name{h2o.columns_by_type}
\alias{h2o.columns_by_type}
\title{Obtain a list of columns that are specified by `coltype`}
\usage{
h2o.columns_by_type(object, coltype = "numeric", ...)
}
\arguments{
\item{object}{H2OFrame object}

\item{coltype}{A character string indicating which column type to filter by. This must be one of the following:
"numeric"      - Numeric, but not categorical or time
"categorical"  - Integer, with a categorical/factor String mapping
"string"       - String column
"time"         - Long msec since the Unix Epoch - with a variety of display/parse options
"uuid"         - UUID
"bad"          - No none-NA rows (triple negative! all NAs or zero rows)}

\item{...}{Ignored}
}
\value{
A list of column indices that correspond to "type"
}
\description{
Obtain a list of columns that are specified by `coltype`
}
\examples{
\donttest{
h2o.init()
prosPath <- system.file("extdata", "prostate.csv", package="h2o")
prostate.hex <- h2o.uploadFile(path = prosPath)
h2o.columns_by_type(prostate.hex,coltype="numeric")
}
}

