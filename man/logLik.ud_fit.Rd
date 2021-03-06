% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/likelihood.R
\name{logLik.ud_fit}
\alias{logLik.ud_fit}
\title{Ultimate Deconvolution Model Likelihoods}
\usage{
\method{logLik}{ud_fit}(object, version = c("Rcpp", "R"), ...)
}
\arguments{
\item{object}{An Ultimate Deconvolution model fit. Typically,
this will be an output of \code{\link{ud_init}} or \code{ud_fit}.}

\item{version}{When \code{version == "R"}, the computations are
performed entirely in R; when \code{version == "Rcpp"}, an Rcpp
implementation is used.}

\item{\dots}{Additional arguments (unused).}
}
\value{
A number giving the log-likelihood for the model.
}
\description{
Compute the log-likelihood for the Ultimate
Deconvolution model.
}
\seealso{
\code{\link{ud_init}}, \code{\link{ud_fit}}
}
