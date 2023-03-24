# author: Annabelle Purnomo
# date: 2023-03-21

# This script tidies the raw data from 01_read_data using the the classy_read.R function. 
# It will only keep the relevant columns.
# Change datatype of playlist_genre from character to factor in order for some of the functions to work later.
# Check number of missing values in each column of the table in the training data.

# Usage: 02_tidy_data.R ...

# load in the function
library(here)
here::here()
library(tidyverse)

source(here("R/classy_read.R"))
source(here("Scripts/01_read_data.R"))

tidy_song_data <- classy_read(url, "playlist_genre", playlist_genre, danceability:tempo)
head(tidy_song_data)
