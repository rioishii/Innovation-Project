library(shiny)
library(shinythemes)

ui <- navbarPage(theme = shinytheme("slate"),"Earthquake Data 2017",
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
           ),
           tabPanel("Others",
                    sidebarLayout(
                      sidebarPanel(
                        h3("Group Members:"),
                        p("Duke Fu"),
                        p("Rio Ishii"),
                        p("Tanner Le"),
                        p("Ying Jiang"),
                        h4("For More Information:"),
                        a("USGS: Science for Changing World", href='https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php')
                      ),
                      mainPanel(
                        
                      )
                    )
           )
           
      )



shinyUI(ui)


