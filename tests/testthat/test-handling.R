context("handling")

test_that("pick works fine",{
  x <- shapes %>% cool
  n <- x %>% length

  # pick one
  expect_length(x %>% pick(1), 1)
  # pick some
  expect_length(x %>% pick(2:4), 3)
  # remove some
  expect_length(x %>% pick(-(1:5)), n-5)
  # pcik all
  expect_length(x %>% pick(1:n), n)
  # pick none
  expect_length(x %>% pick(-(1:n)), 0)
})

test_that("clone works fine", {
  x <- shapes %>% cool
  # copy
  expect_length(x %>% pick(1) %>% clone(1), 1)
  # clone 1x100
  expect_length(x %>% pick(1) %>% clone(100), 100)
  # clone 2x50
  expect_length(x %>% pick(1:2) %>% clone(50), 100)
})
