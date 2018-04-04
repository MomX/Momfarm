context("homogeneize")

test_that("homogeneize works fine", {
  expect_true(shapes[1:2] %>% homogeneize %>% is.list)
})
