context("Collectors")

test_that("guess for empty vector is character", {
  expect_equal(collectorGuess(c("", "")), "character")
})

test_that("guess for missing vector is character", {
  expect_equal(collectorGuess(NA_character_), "character")
})


# Concise collectors specification ----------------------------------------

test_that("_ or - skips column", {
  out1 <- read_csv("x,y\n1,2\n3,4", col_types = "-i")
  out2 <- read_csv("x,y\n1,2\n3,4", col_types = "_i")

  expect_equal(names(out1), "y")
  expect_equal(names(out2), "y")
})

test_that("? guesses column type", {
  out1 <- read_csv("x,y\n1,2\n3,4", col_types = "?i")
  expect_equal(out1$x, c(1L, 3L))
})
