
##### Package documentation and NAMESPACE import

#' Momfarm
#'
#' The goal of Momfarm is to breed shapes,
#' on top of Momocs. It is a place to prototype in several directions.
#'
#' @import Momocs
#' @docType package
#' @name Momfarm
NULL


# welcome message
.onAttach <- function(lib, pkg) {
  packageStartupMessage('This is Momfarm ',
                        utils::packageDescription('Momfarm', field='Version'),
                        appendLF = TRUE)
}
