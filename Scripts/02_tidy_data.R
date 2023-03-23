# author: Annabelle Purnomo
# date: 2023-03-21

# This script tidies the raw data from 01_read_file.R with classy_read.R function. 

# Usage: 02_tidy_data.R ...

# load in the function
source(here("R/classy_read.R"))

# Tidy the data, only keep the relevant columns
# Change datatype of playlist_genre from character to factor in order for some of the functions to work later
# Check number of missing values in each column of the table in the training data

tidy_song_data <- classy_read(url, "playlist_genre", playlist_genre, danceability:tempo)
head(tidy_song_data)