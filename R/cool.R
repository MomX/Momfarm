#' cool class
#'
#' The cool class consists in a list of matrices of class `coo`.
#' It looks like the `$coo` component of `Coo` objects in `Momocs`.
#'
#' Some simple helpers and `print`/`plot` methods are available.
#' @param x the object to build/modify or test
#' @param ... useless, only here to comply with the generic
# coo as/is/check -------------
#' @rdname cool
#' @export
as_coo <- function(x){
  if (!is_coo(x))
    class(x) <- c("coo", class(x))
  x
}

#' @rdname cool
#' @export
is_coo <- function(x){
  any("coo" %in% class(x))
}

#' @rdname cool
#' @export
check_coo <- function(x){
  is_coo(x) && is.matrix(x) && ncol(x)==2
}

# cool as/is/check -------------
#' @rdname cool
#' @export
as_cool <- function(x){
  if (!("cool" %in% class(x)))
    class(x) <- c("cool", class(x))
  x
}

#' @rdname cool
#' @export
is_cool <- function(x){
  any("cool" %in% class(x))
}

#' @rdname cool
#' @export
check_cool <- function(x){
  is_cool(x) &&
    is.list(x) &&
    all(sapply(x, is_coo)) &&
    all(sapply(x, check_coo))
}

# cool builder/converter --------
#' @rdname cool
#' @export
cool <- function(x){
  # check if it belongs to an accepted form
  if (!any(c("Coo", "cool", "coo", "data.frame", "list", "matrix") %in% class(x))){
    fail("must only be a 'Coo', 'coo', 'cool', 'data.frame', 'list' or 'matrix'") %>% stop()
  }

  # to ease compatibility with Momocs
  if (Momocs::is_Coo(x))
    x <- x$coo

  # if already a valid cool, return it
  if (is_cool(x) && check_cool(x))
    return(x)

  # if data.frame turn into a matrix
  if (is.data.frame(x))
    x <- as.matrix(x)

  # if matrix, turn into a list
  if (is.matrix(x)){
    # only if 2-col matrix
    is2num <- apply(x, 2, is.numeric)
    if (!(all(is2num) && length(is2num) ==2)){
      fail("must be a 2-columns matrix or data.frame with numeric") %>% stop()
    }
    x <- x %>% list()
  }

  # final polish
  res <- x %>%
    # make them all coo
    lapply(as_coo) %>%
    # make it cool
    as_cool

  if (check_cool(res))
    res
  else
    paste("these were not coo:",
          paste(which(!sapply(res, check_coo)), sep=",")) %>%
    fail() %>% stop()
}

# print method ---------

#' @rdname cool
#' @export
print.cool <- function(x, ...){
  n <- length(x)
  xy_n <- sapply(x, nrow)
  xy_m <- signif(mean(xy_n), 2)
  xy_s <- signif(stats::sd(xy_n), 2)
  paste0(n, " coo with ",
         xy_m, " +/- ", xy_s, " coordinates") %>%
    mess() %>% cat()
  if (n>1e4){
    plot.cool(x[1:1e4])
  } else {
    plot.cool(x)
  }
  # propagate
  invisible(x)
}

#' @rdname cool
#' @export
# plot method ----------
plot.cool <- function(x, ...){
  x %>% Momocs::Out() %>% Momocs::mosaic()
  # propagate
  invisible(x)
}
