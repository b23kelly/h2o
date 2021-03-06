% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/pca.R
\name{h2o.prcomp}
\alias{h2o.prcomp}
\title{Principal components analysis of an H2O data frame using the power method
to calculate the singular value decomposition of the Gram matrix.}
\usage{
h2o.prcomp(training_frame, x, model_id = NULL, validation_frame = NULL,
  ignore_const_cols = TRUE, score_each_iteration = FALSE,
  transform = c("NONE", "STANDARDIZE", "NORMALIZE", "DEMEAN", "DESCALE"),
  pca_method = c("GramSVD", "Power", "Randomized", "GLRM"), k = 1,
  max_iterations = 1000, use_all_factor_levels = FALSE,
  compute_metrics = TRUE, impute_missing = FALSE, seed = -1,
  max_runtime_secs = 0)
}
\arguments{
\item{training_frame}{Id of the training data frame.}

\item{x}{A vector containing the \code{character} names of the predictors in the model.}

\item{model_id}{Destination id for this model; auto-generated if not specified.}

\item{validation_frame}{Id of the validation data frame.}

\item{ignore_const_cols}{\code{Logical}. Ignore constant columns. Defaults to TRUE.}

\item{score_each_iteration}{\code{Logical}. Whether to score during each iteration of model training. Defaults to FALSE.}

\item{transform}{Transformation of training data Must be one of: "NONE", "STANDARDIZE", "NORMALIZE", "DEMEAN", "DESCALE".
Defaults to NONE.}

\item{pca_method}{Method for computing PCA (Caution: GLRM is currently experimental and unstable) Must be one of: "GramSVD",
"Power", "Randomized", "GLRM". Defaults to GramSVD.}

\item{k}{Rank of matrix approximation Defaults to 1.}

\item{max_iterations}{Maximum training iterations Defaults to 1000.}

\item{use_all_factor_levels}{\code{Logical}. Whether first factor level is included in each categorical expansion Defaults to FALSE.}

\item{compute_metrics}{\code{Logical}. Whether to compute metrics on the training data Defaults to TRUE.}

\item{impute_missing}{\code{Logical}. Whether to impute missing entries with the column mean Defaults to FALSE.}

\item{seed}{Seed for random numbers (affects certain parts of the algo that are stochastic and those might or might not be enabled by default)
Defaults to -1 (time-based random number).}

\item{max_runtime_secs}{Maximum allowed runtime in seconds for model training. Use 0 to disable. Defaults to 0.}
}
\value{
Returns an object of class \linkS4class{H2ODimReductionModel}.
}
\description{
Principal components analysis of an H2O data frame using the power method
to calculate the singular value decomposition of the Gram matrix.
}
\examples{
\donttest{
library(h2o)
h2o.init()
ausPath <- system.file("extdata", "australia.csv", package="h2o")
australia.hex <- h2o.uploadFile(path = ausPath)
h2o.prcomp(training_frame = australia.hex, k = 8, transform = "STANDARDIZE")
}
}
\references{
N. Halko, P.G. Martinsson, J.A. Tropp. {Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions}[http://arxiv.org/abs/0909.4061]. SIAM Rev., Survey and Review section, Vol. 53, num. 2, pp. 217-288, June 2011.
}
\seealso{
\code{\link{h2o.svd}}, \code{\link{h2o.glrm}}
}

