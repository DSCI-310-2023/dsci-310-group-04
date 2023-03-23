# Iris testing dataset obtained from Github
iris <- ("https://gist.githubusercontent.com/curran/a08a1080b88344b0c8a7/raw/0e7a9b0a5d22642a06d3d5b9bcbad9890c8ee534/iris.csv")

#expected outputs
test_dataset <- read.csv(url(iris))

nan_print <- "sepal_length sepal_width petal_length petal_width species\\n1            0           0            0           0       0"

test_dataset_factored <- test_dataset
test_dataset_factored$species <- as.factor(test_dataset_factored$species)

test_dataset_selected <- dplyr::select(test_dataset, species, sepal_length:sepal_width)

test_dataset_all <- dplyr::select(test_dataset_factored, species, sepal_length:sepal_width)

nan_print2 <- "  species sepal_length sepal_width\\n1       0            0           0"

path_error <- "`path` must be of type `character`"

col_error <- "`col` must be of type `character`"
