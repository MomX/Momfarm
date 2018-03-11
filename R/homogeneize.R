#' Homogeneize for most differences
#'
#' @param ... `list` of shapes or comma-separated shapes
#' @param sample if `numeric` (default=60 defau), resample this number of points with [Momocs::coo_sample]
#' @param procrustes `logical` (default=TRUE) whether to remove position, size, rotation differences with [Momocs::fgProcrustes]
#' @param center `logical` (default=TRUE) whether to center shapes with [Momocs::coo_center]
#' @param template `logical` (default=TRUE) whether to template shapes with [Momocs::coo_template]
#'
#' @examples
#' # two shapes, comma separated
#' homogeneize(shapes[1], shapes[2])
#'
#' # list of shapes, in a pipe, and drawing
#' shapes[1:2] %>% homogeneize %>%
#'  paper %>% draw_outlines
#'
#' # with params
#' shapes[1:10] %>% homogeneize(sample=12, procrustes=FALSE) %>%
#'  paper %>% draw_outlines(col=pal_seq_Blues(10, 0.5))
#'
#' @export
homogeneize <- function(..., sample=60, procrustes=TRUE, center=TRUE, template=TRUE){
  # turn .. to a list
  s <- list(...)
  str(s) %>% cat
  # if it was already a list, recover
  if (is.list(s[[1]]))
    s <- s[[1]]
  # resample
  if (is.numeric(sample))
    s <- lapply(s, Momocs::coo_sample, sample)
  # superpose
  if (procrustes && length(s)>=2)
    s <- Momocs::fgProcrustes(s)$rotated %>% Momocs::a2l
  # center
  if (center)
    s <- lapply(s, Momocs::coo_center)
  # template
  if (template)
    s <- lapply(s, Momocs::coo_template)
  # return this beauty
  s
}

