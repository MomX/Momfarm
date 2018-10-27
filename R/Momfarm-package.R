
##### Package documentation and NAMESPACE import

#' Momfarm
#'
#' The goal of Momfarm is to breed shapes,
#' on top of Momocs. It is a place to prototype in several directions.
#'
#' @import Momocs
#' @import miniUI
#' @import shiny
#' @docType package
#' @name Momfarm
NULL


# welcome message
.onAttach <- function(lib, pkg) {
  packageStartupMessage('This is Momfarm ',
                        utils::packageDescription('Momfarm', field='Version'),
                        appendLF = TRUE)
}

#' Momfarm helpers
#'
#' Simple utilities to smooth package use
#'
#' @param topic `character` function name, quoted
#'
#' @rdname Momfarm_helpers
#' @export
Momfarm_help <- function (topic = NULL) {
  url <- "http://momx.github.io/Momocs/reference/"
  if (!is.null(topic))
    url <- paste0(url, topic, ".html")
  utils::browseURL(url)
}

#' @rdname Momfarm_helpers
#' @export
Momfarm_website <- function(){
  utils::browseURL("http://momx.github.io/Momfarm")
}

