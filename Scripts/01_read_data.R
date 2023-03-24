# author: Annabelle Purnomo
# date: 2023-03-21

# This script reads in the raw data from spotify_songs data url to output a data/spotify_songs.csv file.

# load libraries
library(here)
library(tidyverse)
library(RCurl)

# main
url <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv"
x <- getURL(url)
song_data <- read.csv(text = x)

readr::write_csv(song_data,
       here("data", "spotify_songs.csv"))
