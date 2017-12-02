library(shiny)
library(ggplot2)
library(dplyr)
library(ggmap)

myServer <- function(input, output) {
  #Reading in Data then wrangling data
  df <- read.csv("../Data/all_month.csv")
  df <- select(df, lng = longitude, lat = latitude )

  ##change the name of maptype to either [terrain] or [satellite]
  maptype <- reactive({
    switch(input$maptype, "Terrain" = "Terrain", "Satellite" = "Satellite")
  })
  
  
  output$plot1 <- renderPlot({
    mapgilbert <- get_map(location = c(lng = mean(df$lng), 
                                       lat = mean(df$lat)), zoom = 3, maptype = maptype, scale = 2)
    plot_1 <- ggmap(mapgilbert) + geom_point(data = df, aes(x = lng, y = lat, fill = "red",
                                                            alpha = 0.8), size = 1, shape = 21) +
                                               guides(fill=FALSE, alpha=FALSE, size=FALSE) +
                                               labs(x = "Longitude", y = "Latitude")
  })
}