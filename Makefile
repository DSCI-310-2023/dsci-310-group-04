# spotify songs data pipe

# builds the last of any dependencies
all: clean Outputs/4.1-prof_df.csv Outputs/4.2-num_na.csv Outputs/4.3-eda_grid.png Outputs/5.1-k_accuracy_table.csv Outputs/5.2-k_accuracy_vs_k_plot.png Outputs/5.3-best_k_accuracy_table.csv Outputs/6.1-test_preds_table.csv Outputs/6.2-test_accuracy_table.csv Outputs/6.3-matrix_plot.png

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

Outputs/5.1-k_accuracy_table.csv : Outputs/3.1-training_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/5.1-k_accuracy_table.csv

Outputs/5.2-k_accuracy_vs_k_plot.png : Outputs/3.1-training_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/5.2-k_accuracy_vs_k_plot.png

Outputs/5.3-best_k_accuracy_table.csv : Outputs/3.1-training_song_data.csv Scripts/05_analysis.R
	Rscript Scripts/05_analysis.R Outputs/3.1-training_song_data.csv Outputs/5.3-best_k_accuracy_table.csv

Outputs/6.1-test_preds_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/06_results.R
	Rscript Scripts/06_results.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.1-test_preds_table.csv

Outputs/6.2-test_accuracy_table.csv : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/06_results.R
	Rscript Scripts/06_results.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.2-test_accuracy_table.csv

Outputs/6.3-matrix_plot.png : Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Scripts/06_results.R
	Rscript Scripts/06_results.R Outputs/3.1-training_song_data.csv Outputs/3.2-testing_song_data.csv Outputs/6.3-matrix_plot.png

.Phony : rstudio
rstudio:
	docker run -p 8787:8787 --rm --platform linux/amd64 -v $$(pwd):/home/rstudio/workspace ethanielp/dsci310-project:test

.Phony : clean
clean:
	rm -rf Outputs
	mkdir Outputs
