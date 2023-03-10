# author: Annabelle Purnomo
# date: 2023-03-10

"This script creates a histogram plot visualisation from our csv file. 
This script takes tidy data and a data file path.

Usage: create_histogram.R ./data/spotify_songs.csv
"

create_histogram(data,feature,bin_num) {
    ggplot(data, aes(x = feature)) + 
    geom_histogram(bins = bin_num) + 
    facet_grid(rows = "playlist_genre")
}
 
create_histogram(training_song_data, danceability,20)