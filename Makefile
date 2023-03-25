# spotify songs data pipe

# builds the last of any dependencies
all: Outputs/4.1-prof_df.csv Outputs/4.2-num_na.csv Outputs/4.3-eda_grid.png 

Outputs/1.1-spotify_songs.csv : Scripts/01_read_data.R
	Rscript Scripts/01_read_data.R Outputs/1.1-spotify_songs.csv

Outputs/2.1-tidy_song_data.csv : Outputs/1.1-spotify_songs.csv Scripts/02_tidy_data.R
	Rscript Scripts/02_tidy_data.R Outputs/1.1-spotify_songs.csv Outputs/2.1-tidy_song_data.csv

Outputs/3.1-training_song_data.csv : Outputs/2.1-tidy_song_data.csv Scripts/03_split_data.R
	Rscript Scripts/03_split_data.R Outputs/2.1-tidy_song_data.csv Outputs/3.1-training_song_data.csv

Outputs/3.2-testing_song_data.csv : Outputs/2.1-tidy_song_data.csv Scripts/03_split_data.R
	Rscript Scripts/03_split_data.R Outputs/2.1-tidy_song_data.csv Outputs/3.2-testing_song_data.csv

Outputs/4.1-prof_df.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.1-prof_df.csv

Outputs/4.2-num_na.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.2-num_na.csv

Outputs/4.3-eda_grid.png : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.3-eda_grid.png

.Phony : rstudio
rstudio:
	docker run -p 8787:8787 --rm --platform linux/amd64 -v /$(pwd):/home/rstudio/workspace ethanielp/dsci310-project:test

.Phony : clean
clean:
	rm -rf Outputs
	mkdir Outputs
