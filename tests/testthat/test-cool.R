context("cool")

test_that("as_cool works fine", {
  # a data.frame with character/factor cannot be cool
  expect_error(iris %>% cool())
  # a data.frame with more than 2 cols cannot be cool
  expect_error(iris[, 1:3] %>% cool)
  # a 4 col matrix cannot be cool
  expect_error(cbind(shapes[4], shapes[4]) %>% cool())
  # a string cannot be cool
  expect_error("plop" %>% cool())

  # a 2 num col df is cool
  expect_true(iris[, 1:2] %>% cool %>% check_cool())
  # a 2 num col matrix is cool
  expect_true(shapes[4] %>% cool %>%  check_cool())

  # shapes is cool
  expect_true(shapes$coo %>% cool %>% check_cool())

  # create some problems, then expect some message
  x <- shapes$coo
  x[c(4, 12)] <- NA
  expect_error(x %>% cool %>% check_cool())
})

