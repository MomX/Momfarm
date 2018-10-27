context("homogeneize")

test_that("homogeneize works fine", {
  x <- shapes[1:2] %>% homogeneize
  expect_true(shapes[1:2] %>% homogeneize %>% is_cool)
  expect_true(coo_nb(x[[1]]) == coo_nb(x[[1]]))
})
