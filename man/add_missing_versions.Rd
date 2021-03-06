% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add-package.R
\name{add_missing_versions}
\alias{add_missing_versions}
\title{Add some (or all) versions of a package to the GitHub mirror}
\usage{
add_missing_versions(package, versions, new_package, timeline, reset)
}
\arguments{
\item{package}{Name of the package}

\item{versions}{Character vector, package versions to add.}

\item{new_package}{Logical scalar, whether the package is new. If
the package is new, then its repo does not exists (yet) on GitHub.}

\item{timeline}{The full timeline of the package, from crandb, a two
column data frame, with columns "version" and "date".}

\item{reset}{Whether to remove and re-add all the commits.
This is useful for commit errors, e.g. an older version of
cranatgh failed to remove files from the repo that were
deleted in the new package versions.}
}
\description{
Add some (or all) versions of a package to the GitHub mirror
}
\keyword{internal}
