# spotify songs data pipe

# runs clean, deleting the Outputs folder and all its files, before (re)-building it and all of its contents
all: clean Outputs/4.1-prof_df.csv Outputs/4.2-num_na.csv Outputs/4.3-eda_grid.png Outputs/5.1-k_accuracy_table.csv Outputs/5.2-k_accuracy_vs_k_plot.png Outputs/5.3-best_k_accuracy_table.csv Outputs/6.1-test_preds_table.csv Outputs/6.2-test_accuracy_table.csv Outputs/6.3-matrix_plot.png

# Requires no inputs, pulls dataset from web and saves it to csv in Outputs
Outputs/1.1-spotify_songs.csv : Scripts/01_read_data.R
	Rscript Scripts/01_read_data.R Outputs/1.1-spotify_songs.csv

# Requies no inputs, reads data from web and tidies it, saving it to csv in Outputs
Outputs/2.1-tidy_song_data.csv : Outputs/1.1-spotify_songs.csv Scripts/02_tidy_data.R
	Rscript Scripts/02_tidy_data.R Outputs/1.1-spotify_songs.csv Outputs/2.1-tidy_song_data.csv

# Takes the tidied data from 2.1-tidy_song_data.csv, splits it into training and testing sets, saves out to two seperate csv files
Outputs/3.1-training_song_data.csv : Outputs/2.1-tidy_song_data.csv Scripts/03_split_data.R
	Rscript Scripts/03_split_data.R Outputs/2.1-tidy_song_data.csv Outputs/3.1-training_song_data.csv

Outputs/3.2-testing_song_data.csv : Outputs/2.1-tidy_song_data.csv Scripts/03_split_data.R
	Rscript Scripts/03_split_data.R Outputs/2.1-tidy_song_data.csv Outputs/3.2-testing_song_data.csv

# Takes the 2.1-tidy_song_data.csv and 3.1-training_song_data.csv and compares proportions of the song generes
Outputs/4.1-prof_df.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.1-prof_df.csv

# Counts number of NA values in 3.1-training_song_data.csv
Outputs/4.2-num_na.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.2-num_na.csv

# Creates distributions of different features, compared across song generes
Outputs/4.3-eda_grid.png : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/04_EDA.R
	Rscript Scripts/04_EDA.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/4.3-eda_grid.png

# Creates tables and figures of the analysis and model
Outputs/5.1-k_accuracy_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/5.1-k_accuracy_table.csv

Outputs/5.2-k_accuracy_vs_k_plot.png : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/5.2-k_accuracy_vs_k_plot.png

Outputs/5.3-best_k_accuracy_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/5.3-best_k_accuracy_table.csv

Outputs/6.1-test_preds_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.1-test_preds_table.csv

Outputs/6.2-test_accuracy_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.2-test_accuracy_table.csv

Outputs/6.3-matrix_plot.png : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.3-matrix_plot.png

# Runs the container and allows access to rstudio in localhost:8787
.Phony : rstudio
rstudio:
	docker run -p 8787:8787 --rm --platform linux/amd64 -e PASSWORD="apassword" -v $$(pwd):/home/rstudio ethanielp/dsci310-project:test

# Deletes the output folder and its content before rebuilding an empty Outputs folder
.Phony : clean
clean:
	rm -rf Outputs
	mkdir Outputs
