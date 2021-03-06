% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/models.R
\name{h2o.betweenss}
\alias{h2o.betweenss}
\title{Get the between cluster sum of squares.
If "train", "valid", and "xval" parameters are FALSE (default), then the training betweenss value is returned. If more
than one parameter is set to TRUE, then a named vector of betweenss' are returned, where the names are "train", "valid"
or "xval".}
\usage{
h2o.betweenss(object, train = FALSE, valid = FALSE, xval = FALSE)
}
\arguments{
\item{object}{An \linkS4class{H2OClusteringModel} object.}

\item{train}{Retrieve the training between cluster sum of squares}

\item{valid}{Retrieve the validation between cluster sum of squares}

\item{xval}{Retrieve the cross-validation between cluster sum of squares}
}
\description{
Get the between cluster sum of squares.
If "train", "valid", and "xval" parameters are FALSE (default), then the training betweenss value is returned. If more
than one parameter is set to TRUE, then a named vector of betweenss' are returned, where the names are "train", "valid"
or "xval".
}

