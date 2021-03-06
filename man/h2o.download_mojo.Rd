% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/kvstore.R
\name{h2o.download_mojo}
\alias{h2o.download_mojo}
\title{Download the model in MOJO format.}
\usage{
h2o.download_mojo(model, path = getwd(), get_genmodel_jar = FALSE,
  genmodel_name = "")
}
\arguments{
\item{model}{An H2OModel}

\item{path}{The path where MOJO file should be saved. Saved to current directory by default.}

\item{get_genmodel_jar}{If TRUE, then also download h2o-genmodel.jar and store it in folder ``path``.}

\item{genmodel_name}{Custom name of genmodel jar.}
}
\value{
Name of the MOJO file written to the path.
}
\description{
Download the model in MOJO format.
}
\examples{
\donttest{
library(h2o)
h <- h2o.init()
fr <- as.h2o(iris)
my_model <- h2o.gbm(x=1:4, y=5, training_frame=fr)
h2o.download_mojo(my_model)  # save to the current working directory
}
}

