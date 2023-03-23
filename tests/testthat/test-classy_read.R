library(testthat)
source("../../R/classy_read.R")

test_that("`classy_read` should read in a .csv from a URL and produce an output summarizing NaNs in the dataset when no other arguments are provided", {
  expect_equivalent(classy_read(iris), test_dataset)
  expect_output(classy_read(iris), nan_print)
})

test_that("`classy_read` should convert the specified column to the `factor` type", {
  expect_equivalent(classy_read(iris, "species"), test_dataset_factored)
})

test_that("`classy_read` should select the specified columns while the preceding `col` argument is not provided", {
  expect_equivalent(classy_read(iris, col = NULL, species, sepal_length:sepal_width), test_dataset_selected)
})

test_that("`classy_read` should convert the specified column to the `factor` type and select the specified columns when both arguments are provided", {
  expect_equivalent(classy_read(iris, "species", species, sepal_length:sepal_width), test_dataset_all)
})

test_that("`classy_read` should produce an output summarizing NaNs in the dataset after all transformations are applied", {
  expect_output(classy_read(iris, "species", species, sepal_length:sepal_width), nan_print2)
})

test_that("`classy_read` should show descriptive errors when `path` and `col` arguments are not of type `character`", {
  expect_error(classy_read(1, col = NULL, species, sepal_length:sepal_width), path_error)
  expect_error(classy_read(iris, 2, species, sepal_length:sepal_width), col_error)
  expect_error(classy_read(species, sepal_length:sepal_width))
})
