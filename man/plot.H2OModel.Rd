% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/models.R
\name{plot.H2OModel}
\alias{plot.H2OModel}
\title{Plot an H2O Model}
\usage{
\method{plot}{H2OModel}(x, timestep = "AUTO", metric = "AUTO", ...)
}
\arguments{
\item{x}{A fitted \linkS4class{H2OModel} object for which the scoring history plot is desired.}

\item{timestep}{A unit of measurement for the x-axis.}

\item{metric}{A unit of measurement for the y-axis.}

\item{...}{additional arguments to pass on.}
}
\value{
Returns a scoring history plot.
}
\description{
Plots training set (and validation set if available) scoring history for an H2O Model
}
\details{
This method dispatches on the type of H2O model to select the correct
scoring history.  The \code{timestep} and \code{metric} arguments are restricted to what is
available in the scoring history for a particular type of model.
}
\examples{
\donttest{
if (requireNamespace("mlbench", quietly=TRUE)) {
    library(h2o)
    h2o.init()

    df <- as.h2o(mlbench::mlbench.friedman1(10000,1))
    rng <- h2o.runif(df, seed=1234)
    train <- df[rng<0.8,]
    valid <- df[rng>=0.8,]

    gbm <- h2o.gbm(x = 1:10, y = "y", training_frame = train, validation_frame = valid,
                   ntrees=500, learn_rate=0.01, score_each_iteration = TRUE)
    plot(gbm)
    plot(gbm, timestep = "duration", metric = "deviance")
    plot(gbm, timestep = "number_of_trees", metric = "deviance")
    plot(gbm, timestep = "number_of_trees", metric = "rmse")
    plot(gbm, timestep = "number_of_trees", metric = "mae")
}
}
}
\seealso{
\code{\link{h2o.deeplearning}}, \code{\link{h2o.gbm}},
         \code{\link{h2o.glm}}, \code{\link{h2o.randomForest}} for model
         generation in h2o.
}

