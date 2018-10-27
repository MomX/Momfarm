
#' Cross shapes
#'
#' Calculates intermediates forms between two shapes
#' @param ... two shapes, or a [cool] or a list of shapes.
#' Only the first two will be crossed. In all cases, they need to be [homogeneize]d.
#' @param ratio `numeric` (one or more) (min=0, max=1, default=0.5): how much of the first shape?
#' @param steps `integer` if provided will use `ratio=seq(0, 1, length.out=steps)`
#' @return a [cool]
#' @examples
#' s <- shapes %>% pick(1:2) %>% homogeneize()
#' cross(s)
#' s %>% cross(steps=100)
#' s %>% cross(steps=20) %>% paper_white %>% draw_outlines()
#' @export
cross <- function(..., ratio=0.5, steps){
  # turn .. to a list
  s <- list(...)
  # if it was already a list, recover
  if (is.list(s[[1]]))
    s <- s[[1]]

  if (!missing(steps) && missing(ratio))
    ratio <- seq(0, 1, length.out = steps)
  # hybridize for each ratio value
  lapply(ratio,
         function(ri) s[[1]]*ri + s[[2]]*(1-ri)) %>%
    cool()
}


# cross_many <- function(..., steps=11){
#   rs <- seq(0, 1, length.out = steps)
#   cross_df <- expand.grid(rs, rs, rs)
#   cross_df <- cross_df[rowSums(cross_df)==1, ]
#   res <- vector("list", nrow(cross_df))
# }
#





