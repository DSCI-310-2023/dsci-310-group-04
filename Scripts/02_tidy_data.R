# author: Annabelle Purnomo
# date: 2023-03-21
 
# This script tidies the raw data from 01_read_data using the the classy_read.R function and outputs a data/tidy_song_data.csv file.
# It will only keep the relevant columns.
# Change datatype of playlist_genre from character to factor in order for some of the functions to work later.
# Check number of missing values in each column of the table in the training data.

# load libraries
library(here)
library(tidyverse)

# load sources
library(genreclassifier)
# source(here("R","classy_read.R"))

# main
url <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv"
tidy_song_data <- classy_read(url, "playlist_genre", playlist_genre, danceability:tempo)

readr::write_csv(tidy_song_data,
          here("Outputs", "2.1-tidy_song_data.csv"))
