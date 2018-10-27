#' Homogeneize for most differences
#'
#' @param ... `list` of shapes or comma-separated shapes
#' @param sample if `numeric` (default=60), resample this number of points with [Momocs::coo_sample]
#' @param procrustes `logical` (default=TRUE) whether to remove position, size, rotation differences with [Momocs::fgProcrustes]
#' @param center `logical` (default=TRUE) whether to center shapes with [Momocs::coo_center]
#' @param template `logical` (default=TRUE) whether to template shapes with [Momocs::coo_template]
#'
#' @examples
#' # two shapes, comma separated
#' list(shapes[1], shapes[2]) %>% pile()
#' homogeneize(shapes[1], shapes[2]) %>% pile()
#'
#' # with params
#' shapes[1:5] %>% homogeneize(sample=120, procrustes=FALSE) %>%
#'  paper %>% draw_outlines(col=pal_qual(5, 0.5))
#'
#' @export
homogeneize <- function(..., sample=60, procrustes=TRUE, center=TRUE, template=TRUE){
  # silent but restore afterwards
  op <- options("Momocs_verbose"=FALSE)
  on.exit(op)

  # turn .. to a list
  s <- list(...)
  # if it was already a list, recover
  if (is.list(s[[1]]))
    s <- s[[1]]

  # resample
  if (is.numeric(sample))
    s <- lapply(s, Momocs::coo_sample, sample)

  # superpose
  if (procrustes && length(s)>=2)
    s <- Momocs::fgProcrustes(l2a(s))$rotated %>%
      Momocs::a2l()

  # center
  if (center)
    s <- lapply(s, Momocs::coo_center)

  # template
  if (template)
    s <- lapply(s, Momocs::coo_template)

  # return this beauty
  cool(s)
}

