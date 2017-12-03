library(dplyr)

df <- read.csv("Data/all_month.csv")

info_function <- function(dataset) {
  ret <- list()
  #amount of earthquakes in the month
  ret$occurances <- nrow(dataset)
  #average depth
  ret$avg_depth <- mean(dataset[,"depth"])
  #finding the most common location
  ret$avg_locaLat <- mean(dataset[, "latitude"])
  ret$avg_locaLong <- mean(dataset[, "longitude"])
  ret$common_loca <- tail(names(sort(table(dataset$place))), 1)
  #finding the most average mag strength as well as the strongest one
  ret$avg_mag <- mean(dataset[,"mag"], na.rm = TRUE)
  ret$max_mag <- max(dataset[,"mag"], na.rm = TRUE)
  return(ret)
}

Summarize <- info_function(df)