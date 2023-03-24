# author: Annabelle Purnomo
# date: 2023-03-21

# This script reads in the raw data from spotify_songs.csv

# Usage: 01_read_file.R ...

# Ran once to write the data into a local folder, don't need to run again
# write.csv(song_data,"data/spotify_songs.csv")

# Read the data from the web into jupyter

library(tidyverse)
library(RCurl)

url <- "https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv"
x <- getURL(url)
song_data <- read.csv(text = x)
