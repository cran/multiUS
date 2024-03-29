% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotCCA.R
\name{plotCCA}
\alias{plotCCA}
\title{Plot a solution of canonical correlations}
\usage{
plotCCA(
  ccRes,
  xTitle = "X",
  yTitle = "Y",
  inColors = TRUE,
  scaleLabelsFactor = 1/2,
  what = "reg",
  nDigits = 2,
  mar = c(1, 2, 1, 1)
)
}
\arguments{
\item{ccRes}{The output of  \code{\link[multiUS:cancorPlus]{multiUS::cancorPlus}}.}

\item{xTitle}{The title of the first set of variables.}

\item{yTitle}{The title of the second set of variables.}

\item{inColors}{Whether plot should be plotted in colours (\code{TRUE}) (default) or in black and white (\code{FALSE}).}

\item{scaleLabelsFactor}{Parameter for setting the size of values (default is \code{1/2}). The size of plotted values is proportional to  its value to the power of \code{scaleLabelsFactor}.}

\item{what}{Whether to plot regression coefficients (\code{"reg"}) (default) or correlations (i.e., canonical structure loadings) (\code{"cor"}).}

\item{nDigits}{Number of decimal places.}

\item{mar}{Margins, default is \code{mar = c(1, 2, 1, 1)}, see \code{\link[graphics:par]{graphics::par}}.}
}
\value{
It plots the plot.
}
\description{
It plots the canonical solution that is obtained by the function \code{\link[multiUS:cancorPlus]{multiUS::cancorPlus}}.
}
\examples{
tmp<-cancorPlus(x = mtcars[, c(1,2,3)], y = mtcars[, c(4,5, 6)], useCCApackage = TRUE)
plotCCA(tmp, scaleLabelsFactor = 1/2, what = "cor")
}
\author{
Marjan Cugmas
}
