% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_stat_calc.R
\name{WSKS.t}
\alias{WSKS.t}
\title{WSKS.t}
\usage{
WSKS.t(Y, Z, W)
}
\arguments{
\item{Y}{Observed outcome vector}

\item{Z}{Treatment assigment vector}

\item{W}{A a factor or categorical covariate.}
}
\value{
The value of the test.
}
\description{
Weighted average of the group-level SKS statistics.  This is useful for a
blocked experiment.
}
\examples{
df <- make.randomized.dat( 1000, gamma.vec=c(1,1,1,2), beta.vec=c(-1,-1,1,0) )
df$W <- sample(c("A", "B", "C"), nrow(df), replace = TRUE)
WSKS.t(df$Yobs, df$Z, df$W)

}
