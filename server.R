library(shiny)
library(ggplot2)
library(dplyr)
library(ggmap)

myServer <- function(input, output) {
  #Reading in Data then wrangling data
  df <- read.csv("Data/all_month.csv")
  df %>% filter(!is.na(mag))
  df$time <- as.Date(df$time)
  map_df <- select(df, lng = longitude, lat = latitude, mag)
  
  ##change the name of maptype to either [terrain] or [satellite]
  maptype <- reactive({
    switch(input$maptype, "Terrain" = "terrain", "Satellite" = "satellite")
  })
  
  output$mag_freq <- renderPlot({
    filtered <- df %>% filter(mag >= input$mag[1],
                              mag <= input$mag[2],
                              time >= input$date[1],
                              time <= input$date[2])
    ggplot(filtered, aes(x=mag, color='red')) + 
      geom_histogram(bins = input$bin) + theme(legend.position="none") + ggtitle("Frequency of Magnitude")
  })
  
  output$map <- renderPlot({
    new_map_df <- map_df %>% filter(mag >= input$mapMag[1],
                              mag <= input$mapMag[2])
    if(input$maptype == "Terrain"){
      mapgilbert <- get_map(location = c(lng = mean(-112), 
                                        lat = mean(50)), zoom = 3, maptype = "terrain", scale = 2)
    }else{
      mapgilbert <- get_map(location = c(lng = mean(new_map_df$lng), 
                                        lat = mean(new_map_df$lat)), zoom = 3, maptype = "satellite", scale = 2)
    }
      ggmap(mapgilbert) + geom_point(data = new_map_df, aes(x = lng, y = lat, fill = "red",
                                                    alpha = 0.8), size = 1, shape = 21) +
        guides(fill=FALSE, alpha=FALSE, size=FALSE) +
        labs(x = "Longitude", y = "Latitude") + ggtitle("Location of Occurances")
    })
  
  
  Depth <- c("< 0", "0 ~ 10", "10 ~ 20","20 ~ 30",">30")
  pie_df <- mutate(df, "0 ~ 10" = depth < 10 & depth > 0, "10 ~ 20" = depth > 10 & depth < 20, "20 ~ 30" = depth > 20 & depth < 30, ">30" = depth > 30, "< 0" = depth < 0) 
  newDF<- pie_df[ ,which((names(pie_df) %in% Depth)==TRUE)]
  value = integer()
  for (i in Depth) {
    value[length(value)+1] =  sum(newDF[,i] == TRUE, na.rm = T)
  }
  pie_df <- data.frame(Depth, value)
  
  output$pie_graph <- renderPlot({
    if(input$color == 'Colorful') {
      ggplot(pie_df, aes(x="", y=value, fill=Depth))+
        geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) + scale_fill_brewer(palette="Dark2")  +
        theme(axis.text.x=element_blank()) + labs(title = "Earthquake Depth Distribution", subtitle = "Depth of the event in kilometers ", y = "", x = "") 
    } else {
      ggplot(pie_df, aes(x="", y=value, fill=Depth))+
        geom_bar(width = 1, stat = "identity") + coord_polar("y", start=0) + scale_fill_brewer(palette="Blues") +
        theme(axis.text.x=element_blank()) + labs(title = "Earthquake Depth Distribution", subtitle = "Depth of the event in kilometers ", y = "", x = "") 
    }
   
  })
  
}