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
                        sliderInput("bin", "Select amount of bins:", 
                                    max = 15, min = 3, value = 7)
                      ),
                      mainPanel(
                        plotOutput('mag_freq')
                      )
                    )
           ),
           tabPanel("Map",
                    sidebarLayout(
                      sidebarPanel(
                        radioButtons('maptype', "Select a map type:",
                                     list("Terrain", "Satellite"))
                      ),
                      mainPanel(
                        plotOutput('map')
                      )
                    )
           ),
           tabPanel("Earthquake Depth",
                    sidebarLayout(
                      sidebarPanel(
                        radioButtons('color', "Select theme:",
                                     list("Colorful", "Ocean"))
                      ),
                      mainPanel(
                        plotOutput('pie_graph')
                      )
                    )
           )
      )
 


shinyUI(ui)


