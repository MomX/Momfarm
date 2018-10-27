
<!-- README.md is generated from README.Rmd. Please edit that file -->

## Momfarm <img src="https://noto-website-2.storage.googleapis.com/emoji/emoji_u1f407.png" width="30px">

*Part of
[MomX](https://momx.github.io/MomX/)*

<!-- Badges -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis-CI Build
Status](https://travis-ci.org/MomX/Momfarm.svg?branch=master)](https://travis-ci.org/MomX/Momfarm)
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/Momfarm)](http://cran.r-project.org/package=Momfarm)
[![Coverage
Status](https://img.shields.io/codecov/c/github/MomX/Momfarm/master.svg)](https://codecov.io/github/MomX/Momfarm?branch=master)

Breed shapes on top of Momocs.

Momfarm is, mostly and so far, a place to prototype on shapes
visualization.

## Installation

You can install the current CRAN version with:

``` r
install.packages("Momfarm")
```

But I recommend using - and typically only support - the development
version that lives on [GitHub](https://github.com/MomX/Momfarm):

``` r
# if you do not have devtools yet:
install.packages("devtools") 
# then:
devtools::install_github("MomX/Momfarm")
```

## Example

``` r
library(Momfarm)
s <- shapes %>% pick(1:2)
s
#> 2 coo with 850 +/- 55 coordinates
```

<img src="man/figures/README-example-1.png" width="100%" />

``` r
s %>% homogeneize() %>% 
  cross(steps=20) %>% 
  paper_white %>% draw_outlines()
```

<img src="man/figures/README-example-2.png" width="100%" />

Try the example in `cross_g` as well, to interactively cross shapes.

-----

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
