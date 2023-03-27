#' author: Olivia Pang
#' date: 2023-03-11

#' Make tidied dataframe
#' 
#' Reads in a CSV file as a data frame, 
#' converts one specified column to the type factor, 
#' selects specified columns to keep, 
#' checks data for NaNs, 
#' then returns the data frame object for the purpose of Classification.
#'
#' @param path A file path to a .csv file
#' @param col  A column in the data frame to convert to the type Factor
#' @param ...  Columns to select from the data frame
#'
#' @return A data frame with the tidied data.
#' @export
#'
#' @examples
#' classy_read(url, "playlist_genre", playlist_genre, danceability:tempo)

classy_read <- function(path, col = NULL, ...){
  if (!is.character(path)) {
    stop("`path` must be of type `character`")
  }

  data <- read.csv(url(path))

  if (!is.null(col)) {
    if (!is.character(col))
    stop("`col` must be of type `character`")
    data[[col]] <- as.factor(data[[col]])
  }
    
  if(!missing(...)){
  data <- dplyr::select(data, ...)
  }
  
  print(dplyr::summarize_all(data, ~ sum(is.na(.))))
  return(data)
}
