
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

#' Cross shapes gadget
#'
#' Calculates intermediates forms between two shapes using a gadget
#' @param ... two shapes, or a [cool] or a list of shapes.
#' Only the first two will be crossed. In all cases, they need to be [homogeneize]d.
#' @param steps `integer` to feed [cross], number of intermediate steps
#' @param interval `integer` to feed [shiny::animationOptions], time between frames in milliseconds
#' @return a [cool]
#' @examples
#' \dontrun{
#' s <- shapes %>% pick(1:2) %>% homogeneize()
#' s %>% cross_g
#' }
#' @export
cross_g <- function(..., steps=100, interval=1000/15){
  # requireNamespace(miniUI)
  # requireNamespace(shiny)

  # turn .. to a list
  s <- list(...)
  # if it was already a list, recover
  if (is.list(s[[1]]))
    s <- s[[1]]


  ui <- miniPage(
    gadgetTitleBar("Cross"),
    fillCol(
      plotOutput("plot", width="100%"),

      sliderInput("frame", "", 1, steps, 1, 1,
                  animate=animationOptions(interval = interval, loop=TRUE),
                  width="80%"),
      flex=c(4, 1)
    )
  )

  server <- function(input, output, session) {
    # reactiveValues()

    x <- cross(list(s[[1]], s[[2]]), steps=steps)

    output$plot <- renderPlot({
      x[[input$frame]] %>% list %>% paper_white() %>% draw_outline()
    })

  }
  runGadget(shinyApp(ui, server), viewer = paneViewer())
}





