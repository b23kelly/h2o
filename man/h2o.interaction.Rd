% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/frame.R
\name{h2o.interaction}
\alias{h2o.interaction}
\title{Categorical Interaction Feature Creation in H2O}
\usage{
h2o.interaction(data, destination_frame, factors, pairwise, max_factors,
  min_occurrence)
}
\arguments{
\item{data}{An H2OFrame object containing the categorical columns.}

\item{destination_frame}{A string indicating the destination key. If empty, this will be auto-generated by H2O.}

\item{factors}{Factor columns (either indices or column names).}

\item{pairwise}{Whether to create pairwise interactions between factors (otherwise create one higher-order interaction). Only applicable if there are 3 or more factors.}

\item{max_factors}{Max. number of factor levels in pair-wise interaction terms (if enforced, one extra catch-all factor will be made)}

\item{min_occurrence}{Min. occurrence threshold for factor levels in pair-wise interaction terms}
}
\value{
Returns an H2OFrame object.
}
\description{
Creates a data frame in H2O with n-th order interaction features between categorical columns, as specified by the user.
}
\examples{
\donttest{
library(h2o)
h2o.init()

# Create some random data
myframe <- h2o.createFrame(rows = 20, cols = 5,
                         seed = -12301283, randomize = TRUE, value = 0,
                         categorical_fraction = 0.8, factors = 10, real_range = 1,
                         integer_fraction = 0.2, integer_range = 10,
                         binary_fraction = 0, binary_ones_fraction = 0.5,
                         missing_fraction = 0.2,
                         response_factors = 1)
# Turn integer column into a categorical
myframe[,5] <- as.factor(myframe[,5])
head(myframe, 20)

# Create pairwise interactions
pairwise <- h2o.interaction(myframe, destination_frame = 'pairwise',
                            factors = list(c(1,2),c("C2","C3","C4")),
                            pairwise=TRUE, max_factors = 10, min_occurrence = 1)
head(pairwise, 20)
h2o.levels(pairwise,2)

# Create 5-th order interaction
higherorder <- h2o.interaction(myframe, destination_frame = 'higherorder', factors = c(1,2,3,4,5),
                               pairwise=FALSE, max_factors = 10000, min_occurrence = 1)
head(higherorder, 20)

# Limit the number of factors of the "categoricalized" integer column
# to at most 3 factors, and only if they occur at least twice
head(myframe[,5], 20)
trim_integer_levels <- h2o.interaction(myframe, destination_frame = 'trim_integers', factors = "C5",
                                       pairwise = FALSE, max_factors = 3, min_occurrence = 2)
head(trim_integer_levels, 20)

# Put all together
myframe <- h2o.cbind(myframe, pairwise, higherorder, trim_integer_levels)
myframe
head(myframe,20)
summary(myframe)
}
}

