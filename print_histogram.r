#' Creates a histogram plot visualisation from our csv file
#'
#' @param data Tidy data containing a list of genres and acoustic features 
#' @param feature Specified acoustic feature of which we want a visualisation
#'
#' @return a histogram plot 
#' @export
#'
#' @examples

library(tidyverse)
library(testthat)

# potentially temporarily reading in data to test. create a new .r file for this?
x <- getURL("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv")
song_data <- read.csv(text = x)
tidy_song_data <- song_data |>
  select(playlist_genre, danceability:tempo)

# actual code
create_histogram <- function(df,feature) {
  histogram <- ggplot(df, aes(x = {{feature}})) + 
    geom_histogram(bins = 20, stat="count") + 
    facet_grid(rows = "playlist_genre")
  histogram
}

create_histogram(tidy_song_data, "danceability")
create_histogram(tidy_song_data, "tempo")


create_histogram(tidy_song_data, training_song_data)


