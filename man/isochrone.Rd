% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/isochrone.R
\name{isochrone}
\alias{isochrone}
\title{Issue a walkalytics isochrone query}
\usage{
isochrone(x, y, epsg = 3857, max_min = 1000, raw_data = FALSE,
  pois = NULL, only_pois = FALSE, break_values = c(0, 3, 6, 9, 13),
  key = "my_walkalytics_key")
}
\arguments{
\item{x}{x-coordinate of the source location (coordinate system is WGS/84 Pseudo Mercator).}

\item{y}{y-coordinate of the source location (coordinate system is WGS/84 Pseudo Mercator).}

\item{epsg}{EPSG code for coordinate system of the x- and y-coordinate.}

\item{max_min}{maximum number of minutes for the isochrone.}

\item{raw_data}{if \code{TRUE}, the API returns a gzipped Esri ASCII grid with traveltimes for every pixel.
If \code{FALSE}, it returns a PNG file with classified isochrones.}

\item{pois}{a \code{data.frame} to specify a set of points-of-interest (POIs). The API calculates the duration
    time for walking from the source location to each POI. The following columns are required:
\itemize{
\item \code{x} x-coordinate of the source location (EPSG:3857).
\item \code{y} y-coordinate of the source location (EPSG:3857).
\item \code{id} name of POI (optional)
}}

\item{only_pois}{if \code{TRUE}, the API only returns an annotated list of the points-of-interest (POIs).
No isochrone raster will be included in the response.}

\item{break_values}{a vector of break values (walking time in minutes) for the classification of the PNG result.}

\item{key}{your \code{walkalytics} subscription key which provides access to the API.}
}
\value{
The \link[httr]{response} object from the request. Use \link[walkalytics]{esri_to_sgdf}, \link[walkalytics]{pixel_walktimes},
   \link[walkalytics]{save_png}, or \link[walkalytics]{pois_walktimes} to process the response.
}
\description{
\code{isochrone} calls the \code{walkalytics} isochrone API which calculates the walking isochrone for a source location.
    The repsonse object contains a base64-encoded raster file, containing 4 classes (as PNG file, this is default) or
    the actual travel times in seconds for every pixel (as a gzipped Esri ASCII grid). If a set of points-of-interest (POIs)
    is given, the duration time for walking from the source location to each POI is calculated.
}
\details{
To get an API key, you need to register at \url{https://dev.walkalytics.com/signin}.
With the free starter account, you can make up to 100 calls a week to the API.
}
\examples{
\donttest{
isochrone(x = 895815, y = 6004839, key = "abcd1234")
}

}
\references{
\href{https://dev.walkalytics.com/docs/services/}{Walkalytics API documentations}
}
