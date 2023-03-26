# Abstracts using optimized model on testing data and produces summary visualizations

# load libraries
library(here)
library(kknn)
library(tidyverse)
library(tidymodels)


# Read in the data
training_song_data <- read.csv(here("Outputs", "3.1-training_song_data.csv"))
testing_song_data <- read.csv(here("Outputs", "3.2-testing_song_data.csv"))

training_song_data$playlist_genre <- as.factor(training_song_data$playlist_genre)
testing_song_data$playlist_genre <- as.factor(testing_song_data$playlist_genre)

# Test predictions using test-data
song_recipe <- recipe(playlist_genre ~ ., data = training_song_data) |>
  step_scale(all_predictors()) |>
  step_center(all_predictors())

knn_spec <- nearest_neighbor(weight_func = "rectangular", neighbors = tune()) |>
  set_engine("kknn") |>
  set_mode("classification")

knn_fit <- workflow() |>
  add_recipe(song_recipe) |>
  add_model(knn_spec) |>
  fit(training_song_data)

song_test_predictions <- predict(knn_fit, testing_song_data) |>
  bind_cols(testing_song_data)

readr::write_csv(song_test_predictions, here("Outputs", "6.1-test_preds_table.csv"))

# Accuracy of the model on testing data
accuracy_only <- song_test_predictions |>
  yardstick::metrics(truth = playlist_genre, estimate = .pred_class) |>
  filter(.metric == "accuracy")

readr::write_csv(accuracy_only, here("Outputs", "6.2-test_accuracy_table.csv"))

# A table of predictions of the model
confusion <- song_test_predictions |>
  conf_mat(truth = playlist_genre, estimate = .pred_class)

# Data visualization 
matrix_plot <- autoplot(confusion, type = "mosaic") + aes(fill = rep(colnames(confusion$table), ncol(confusion$table))) + labs(fill = "Predicted")

ggsave("6.3-matrix_plot.png", device = "png", path = "Outputs", width = 5, height = 4)
