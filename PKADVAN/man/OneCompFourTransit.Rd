% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OneComp_Transits_PKmodels_Rfunctions.R
\name{OneCompFourTransit}
\alias{OneCompFourTransit}
\title{Process simulations using 1-compartment model with 4-transit absorption compartments.}
\usage{
OneCompFourTransit(inputDataFrame)
}
\arguments{
\item{inputDataFrame}{which is the NONMEM-style data frame that contains columns for \code{ID, TIME, AMT, F1, KTR, CL, V}.}
}
\value{
The function calculates the amounts in the absorption \code{(A1)}, first, second, third, and fourth transit \code{(A3, A4, A5, A6)}, respectively, and central compartment (\code{A2} & individual predicted concentrations, \code{IPRED}) and returns the output added to the \code{inputDataFrame}
}
\description{
\code{OneCompFourTransit} function accepts NONMEM-style data frame for one subject and calculates drug amount in the respective compartments. The data frame should have the following columns: \code{ID, TIME, AMT, F1, KTR, CL, V}.

where:
\tabular{ll}{
\code{ID}: \tab is the subject ID\cr
\code{TIME}:\tab is the sampling time points\cr
\code{AMT}:\tab is the dose\cr
\code{F1}:\tab is the bioavailability\cr
\code{KTR}:\tab is the transit rate contstant\cr
\code{CL}:\tab is the central compartment clearance\cr
\code{V}:\tab is the central volume of distribution.\cr
}
}
\details{
To simulate a population (i.e. the \code{inputDataFrame} has more than one subject \code{ID}),    the function
has to be applied for each subject \code{ID}. One way of doing that is through using the \code{ddply} functionality
in the \pkg{plyr} package in R. The \code{ddply} functionality allows applying the \pkg{PKADVAN} function to each subject
\code{ID} and combines the results into a data frame. Please load \pkg{plyr} package in \code{R} before
processsing simulations.

\code{ddply(inputDataFrame, .(ID), OneCompFourTransit)}

The \pkg{PKADVAN} function is capable of simulating arbitrary dosing regimens and can account for covariate structures; however,
covariate effects on respective parameters must be calculated prior processing simulations.
See examples below for more details.
}
\author{
Ahmad Abuhelwa\cr
Australian Center for Pharmacometrics\cr
School of Pharmacy and Medical Sciences\cr
University of South Australia\cr
\email{Ahmad.Abuhelwa@myamil.unisa.edu.au}
}
\seealso{
\code{\link{OneCompOneTransit}}, \code{\link{OneCompThreeTransit}}, \code{\link{OneCompFourTransit}}

\code{\link{OneCompFirstOrderAbs}}, \code{\link{TwoCompFirstOrderAbs}}, \code{\link{TwoCompFirstOrderAbs}}
}

