context("cross")

test_that("cross works fine", {
  x <- shapes %>% cool
  # non homogeneized
  expect_error(x %>% pick(1:2) %>% cross())
  expect_length(x %>% pick(1:2) %>% homogeneize %>% cross(), 1)
  expect_length(x %>% pick(1:2) %>% homogeneize %>% cross(steps=100), 100)
})


