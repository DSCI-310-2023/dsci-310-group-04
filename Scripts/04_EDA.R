#"
#This script performs preliminary data analysis on the training set derived from '03_split_data.R'
 
#Usage: Rscript Scripts/04_EDA.R
#  " -> doc

# load libraries 
library(docopt)
library(knitr)
library(tidyverse)
library(here)
library(cowplot)

# load sources
library(genreclassifier )
# opt <- docopt(doc)
# source(here("R","count_proportion.r"))
# source(here("R","create_faceted_hist_plot.R"))

# 0 Read in the data
tidy_song_data <- read.csv(here("Outputs", "2.1-tidy_song_data.csv"))
training_song_data <- read.csv(here("Outputs", "3.1-training_song_data.csv"))

# 1 Get proportions of genres from tidy data
tidy_prop <- count_proportion(tidy_song_data, 'playlist_genre', "tidy")

# Get proportions of genres from training data
train_prop <- count_proportion(training_song_data, 'playlist_genre', "train")

# Combine dataframes to compare
df_list <- list(train_prop, tidy_prop) 

# Keep relevant columns 
prop_df <- df_list %>% reduce(full_join, by='playlist_genre')
prop_df <- prop_df[,c(1,2,4,3,5)]

# Save out the resulting table
write_csv(prop_df,
          file.path("Outputs", "4.1-prop_df.csv"))

# 2 Check number of missing values in each column of the table in the training data
num_na <- training_song_data|> 
  summarize_all(~sum(is.na(.))) 

write_csv(num_na,
          file.path("Outputs", "4.2-num_na.csv"))

# Preliminary data visualization
# Histograms of each of the features that we are using, differentiated by labeled genre
options(repr.plot.width = 15, repr.plot.height = 15)

danceability_hist <- create_faceted_hist_plot(training_song_data, 'danceability')

energy_hist <- create_faceted_hist_plot(training_song_data, 'energy')

key_hist <- create_faceted_hist_plot(training_song_data, 'key')

loudness_hist <- create_faceted_hist_plot(training_song_data, 'loudness')

mode_hist <- create_faceted_hist_plot(training_song_data, 'mode')

speechiness_hist <- create_faceted_hist_plot(training_song_data, 'speechiness')

acousticness_hist <- create_faceted_hist_plot(training_song_data, 'acousticness')

instrumentalness_hist <- create_faceted_hist_plot(training_song_data, 'instrumentalness')

liveness_hist <- create_faceted_hist_plot(training_song_data, 'liveness')

valence_hist <- create_faceted_hist_plot(training_song_data, 'valence')

tempo_hist <- create_faceted_hist_plot(training_song_data, 'tempo')

plot_list <- list(danceability_hist, energy_hist, danceability_hist, key_hist, loudness_hist, mode_hist, speechiness_hist, acousticness_hist, instrumentalness_hist, liveness_hist, valence_hist ,tempo_hist)

eda_grid <- plot_grid(plotlist = plot_list, ncol = 4, labels = "AUTO")

ggsave("4.3-eda_grid.png", device = "png", path = "Outputs", width = 10, height = 10)