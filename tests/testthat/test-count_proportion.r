library(testthat)
source("../../R/count_proportion.r")

test_that("`count_proportion` should return a data frame that counts unique values in a column, and then gives the count and percentage in the next two columns`", {
  expect_equivalent(count_proportion(three_value_113, 'first_column', 'class'), three_value_113_out)
  expect_equivalent(count_proportion(one_value_2, 'first_column', 'one'), one_value_2_out)
})

test_that("`count_proportion` should throw an error when incorrect datatypes are passed into its parameters", {
  expect_error(count_proportion(three_value_113, first_column, 'class'))
  expect_error(count_proportion(three_value_113, 'first_column', class))
})

test_that("`count_classes` should throw an error when the dataframe provided is empty", {
  expect_error(count_proportion(empty_df, 'string', 'string'))
})