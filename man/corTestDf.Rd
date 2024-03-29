% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/corTestDf.R, R/printCorTestDf.R
\name{corTestDf}
\alias{corTestDf}
\alias{print.corTestDf}
\alias{printCorTestDf}
\title{Compute correlations and test their statistical significance}
\usage{
corTestDf(X, method = "p", use = "everything", ...)

\method{print}{corTestDf}(x, digits = c(3, 3), format = NULL, ...)

printCorTestDf(l, digits = c(3, 3), format = NULL, ...)
}
\arguments{
\item{X}{Data matrix with selected variables.}

\item{method}{A type of correlation coefficient to be calculated, see function \code{cor}.}

\item{use}{In the case of missing values, which method should be used, see function \code{cor}.}

\item{\dots}{Other parameters to print.default (not needed).}

\item{x}{Output of \code{corTestDf} function.}

\item{digits}{Vector of length two for the number of digits (the first element of a vector corresponds to the number of digits for correlation coefficients and the second element of a vector corresponds to the number of digits for \eqn{p}-values).}

\item{format}{A vector of length two for the formatting of the output values.}

\item{l}{Output of \code{corTestDf} function.}
}
\description{
The function computes the whole correlation matrix and corresponding sample sizes and \eqn{p}-values. Print method is also available.
}
\examples{
corTestDf(mtcars[, 3:5])
}
\seealso{
\code{cor.test}
}
\author{
Ales Ziberna
}
