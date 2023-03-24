# author: Annabelle Purnomo
# date: 2023-03-21

# This script splits the data into training and testing sets at 75:25 ratio

# Usage: 03_split_data.R ...

library(tidymodels)
library(here)
here::here()
source(here("Scripts/02_tidy_data.R"))

set.seed(1) # Set the seed for reproducability

split_song_data <- initial_split(tidy_song_data, prop = 0.75, strata = playlist_genre)

# training set
training_song_data <- training(split_song_data)

# testing set
testing_song_data <- testing(split_song_data)
