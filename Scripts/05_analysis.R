# Abstracts creating KNN recipe and performing cross-validation

# load libraries
library(here)
library(kknn)
# load sources
source(here("Scripts/03_split_data.R"))

# Read in the data
training_song_data <- read.csv(here("Outputs", "3.1-training_song_data.csv"))

# Scale predictors, use standard recipe, setup knn_spec to tune for best k value
song_recipe <- recipe(playlist_genre ~ ., data = training_song_data) |>
  step_scale(all_predictors()) |>
  step_center(all_predictors())

knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |>
  set_engine("kknn") |>
  set_mode("classification")


# Cross validating and finding the best hyperparameter for the model
set.seed(1) # Setting seed for reproducibility

# Trying 15 different k values, count by every 10 from 1 to 51
k_vals <- tibble(neighbors = seq(from = 1, to = 51, by = 10))
song_vfold <- vfold_cv(training_song_data, v = 5, strata = playlist_genre)

knn_results <- workflow() |>
  add_recipe(song_recipe) |>
  add_model(knn_spec) |>
  tune_grid(resamples = song_vfold, grid = k_vals) |>
  collect_metrics() 

accuracies <- knn_results |> filter(.metric == "accuracy")
accuracies |>  arrange(desc(mean))

readr::write_csv(accuracies, here("Outputs", "5.1-k_accuracy_table.csv"))


# Plot the different accuracies of k 
accuracy_vs_k <- ggplot(accuracies, aes(x = neighbors, y = mean)) +
  geom_point() +
  geom_line() +
  labs(x = "Neighbors", y = "Accuracy Estimate") + 
  theme(text = element_text(size = 15))
options(repr.plot.width = 5, repr.plot.height = 5)

ggsave("5.2-accuracy_vs_k_plot.png", device = "png", path = "Outputs", width = 5, height = 4)


# Calculate accuracy of the model using the best k and cross-validation
knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = 11) |>
  set_engine("kknn") |>
  set_mode("classification")

knn_fit <- workflow() |>
  add_recipe(song_recipe) |>
  add_model(knn_spec) |>
  fit_resamples(resamples = song_vfold)

accuracy_value <- knn_fit |> 
  collect_metrics() 

readr::write_csv(accuracy_value, here("Outputs", "5.3-best_k_accuracy_table.csv"))
