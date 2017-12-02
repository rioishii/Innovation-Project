library(shiny)

ui <- navbarPage("Earthquake Data 2017",
           tabPanel("Home",
                    sidebarLayout(
                      sidebarPanel(
                      
                      ),
                      mainPanel(
                        
                      )
                    )
           ),
           tabPanel("Frequency of Magnitudes",
                    sidebarLayout(
                      sidebarPanel(
                        
                      ),
                      mainPanel(
                        
                      )
                    )
           ),
           tabPanel("Map",
                    sidebarLayout(
                      sidebarPanel(
                        radioButtons('maptype', "Select a map type:",
                                     list("Satellite", "Terrain"))
                      ),
                      mainPanel(
                        plotOutput('plot1')
                      )
                    )
           )
      )
 


shinyUI(ui)


