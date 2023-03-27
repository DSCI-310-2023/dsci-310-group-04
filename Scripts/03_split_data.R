# author: Annabelle Purnomo
# date: 2023-03-21
 
# This script splits the data into training and testing sets at 75:25 ratio.

# load libraries
library(tidymodels)
library(here)

# main
set.seed(1) # Set the seed for reproducibility

tidy_song_data <- read.csv(here("Outputs", "2.1-tidy_song_data.csv"))
split_song_data <- initial_split(tidy_song_data, prop = 0.75, strata = playlist_genre)

# training set
training_song_data <- training(split_song_data)
readr::write_csv(training_song_data,
                 here("Outputs", "3.1-training_song_data.csv"))

# testing set
testing_song_data <- testing(split_song_data)
readr::write_csv(testing_song_data,
                 here("Outputs", "3.2-testing_song_data.csv"))
