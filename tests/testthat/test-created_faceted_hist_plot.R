library(testthat)
source('../../R/create_faceted_hist_plot.R')

# test dataset 
x <- getURL("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv")
test_data <- read.csv(text = x)
tidy_test_data <- test_data |>
  select(playlist_genre, danceability:tempo)

# function input for tests
empty_df <- tibble()

# tests
test_that("`create_faceted_hist_plot` should return a ggplot that contains degree of the feature on the x axis",
          {
            plot <- create_faceted_hist_plot(tidy_test_data, danceability)
            expect_equal(plot$labels$x, "danceability")
          })

test_that("`create_faceted_hist_plot` should throw an error when incorrect datatypes are passed into its parameters", 
          {
            expect_error(create_faceted_hist_plot('tidy_test_data', danceability))
            expect_error(create_faceted_hist_plot(tidy_test_data, 'danceability'))
            })

test_that("`create_faceted_hist_plot` should throw an error when the dataframe provided is empty", 
          {
            expect_error(create_faceted_hist_plot(empty_df, 'string'))
            })