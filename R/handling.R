#' Select shape(s)
#'
#' Nothing but `x[i]`
#'
#' @param x the shape to clone
#' @param i indices of shapes to retain
#'
#' @examples
#' shapes[4] %>% clone(121)
#' shapes[14:16] %>% clone(27)
#' @export
pick <- function(x, i){
  x[i] %>% cool()
}


#' Clone shape(s)
#'
#' Nothing but `rep(x, n)`
#'
#' @param x the shape to clone
#' @param n how many times?
#'
#' @examples
#' shapes[4] %>% clone(121)
#' shapes[14:16] %>% clone(27)
#' @export
clone <- function(x, n){
  x %>%
    cool %>%
    rep(n) %>%
    as_cool()
}
