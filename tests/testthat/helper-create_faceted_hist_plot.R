# test dataset 
x <- RCurl::getURL("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv")
test_data <- read.csv(text = x)
tidy_test_data <- test_data |>
  dplyr::select(playlist_genre, danceability:tempo)

# function input for tests
empty_df <- tibble::tibble()

