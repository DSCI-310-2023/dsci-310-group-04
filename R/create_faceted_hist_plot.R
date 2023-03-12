# author: Annabelle Purnomo
# date: 2023-03-10
#' Creates a faceted plot of 6 histograms of each music genre from a csv file
#'
#' @param df Tidy data containing a list of genres and acoustic features, as a dataframe
#' @param feature Specified acoustic feature of which we want a visualisation, as a character type
#'
#' @return faceted plot of 6 histograms

library(tidyverse)

create_faceted_hist_plot <- function(df,feature) {
  if (!is.character(feature)) {
    stop("`feature` should be a string")
  }
  if (!is.data.frame(feature)) {
    stop("`df` should be a data frame")
  }
  
  ggplot(df, aes(x = {{feature}})) + 
    geom_histogram(bins = 20, stat="count") + 
    facet_grid(rows = "playlist_genre")
}
