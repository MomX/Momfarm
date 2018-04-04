
<!-- README.md is generated from README.Rmd. Please edit that file -->
Momfarm <img src="https://noto-website-2.storage.googleapis.com/emoji/emoji_u1f407.png" width="30px">
-----------------------------------------------------------------------------------------------------

*Part of [MomX](https://momx.github.io/MomX/)*

<!-- Badges -->
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental) [![Travis-CI Build Status](https://travis-ci.org/MomX/Momfarm.svg?branch=master)](https://travis-ci.org/MomX/Momfarm) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/Momfarm)](http://cran.r-project.org/package=Momfarm) [![Coverage Status](https://img.shields.io/codecov/c/github/MomX/Momfarm/master.svg)](https://codecov.io/github/MomX/Momfarm?branch=master)

Momfarm
=======

Breed shapes on top of Momocs.

Momfarm is, mostly and so far, a place to prototype on shapes visualization.

Installation
------------

You can install the development version from [GitHub](https://github.com/MomX) with:

``` r
# install.packages("devtools")
devtools::install_github("MomX/Momfarm")
```

Example
-------

``` r
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
```
