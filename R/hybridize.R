#
# hybridize <- function(..., cross=0.5){
#   # turn .. to a list
#   s <- list(...)
#   # if it was already a list, recover
#   if (is.list(s[[1]]))
#     s <- s[[1]]
#   (s[[1]]*cross + s[[2]]*(1-cross))/2
# }
#
# plot_outlines <- function(s){
#   s %>% paper_white %>% draw_outlines(col="pink")
# }
#
# mate <- homogeneize(shapes[11], shapes[4], sample=240)
#
# for (i in seq(0, 1, length=100)){
#   hybridize(mate, cross=i) %>% plot_outlines()
#   Sys.sleep(1/10)
# }


