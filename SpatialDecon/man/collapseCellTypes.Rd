% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collapseCellTypes.R
\name{collapseCellTypes}
\alias{collapseCellTypes}
\title{Collapse related cell types within a deconvolution result}
\usage{
collapseCellTypes(fit, matching)
}
\arguments{
\item{fit}{The object (a list) returned by the SpatialDecon algorithm}

\item{matching}{A list object holding the mapping from beta's cell names to
official cell names.
 See str(safeTME.matches) for an example.}
}
\value{
A reshaped deconvolution result object
}
\description{
Given the input of an SpatialDecon result output and a list of which cell
types to combine,
 returns a reshaped deconvolution result object with the specified cell
 types merged.
}
\examples{
data(mini_geomx_dataset)
# estimate background:
mini_geomx_dataset$bg <- derive_GeoMx_background(
  norm = mini_geomx_dataset$normalized,
  probepool = rep(1, nrow(mini_geomx_dataset$normalized)),
  negnames = "NegProbe"
)
# run basic decon:
res0 <- spatialdecon(
  norm = mini_geomx_dataset$normalized,
  bg = mini_geomx_dataset$bg,
  X = safeTME
)
res1 <- collapseCellTypes(
    fit = res0,
    matching = SpatialDecon::safeTME.matches
)
}
