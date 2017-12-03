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
                        p(strong("Frequency of Magnitude")),
                        p("This graph is designed to show the frequency of magnitudes. What this does is
                        allow the user to know what type of magnitude strength is most likely to occur.
                        "),
                        p(),
                        sliderInput("bin", "Select amount of bins:", 
                                    max = 15, min = 3, value = 7),
                        p("Lowering amount of bins will categorize more magnitudes under the same bar while,
                          increasing the amount of bins will allow more indivdual bars.")
                      ),
                      mainPanel(
                        plotOutput('mag_freq')
                      )
                    )
           ),
           tabPanel("Map",
                    sidebarLayout(
                      sidebarPanel(
                        p(strong('Location of Occurances')),
                        p('This map represents the distribution of earthquakes in North America. Each red dot 
                          represents an earthquake. If red dots in an area is denser than in another area, this 
                          area suffers more earthquakes in the given time. Based on the graph, most of the 
                          earthquakes occur around coast region and pacific rim.'),
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
                        p(strong("Earthquake Depth Levels")),
                        p('This pie graph contains all earthquakes based on their depth level. From the graph, 
                          it is not hard to find out that majority of all earthquakes have depth between 0 to 
                          10 kilometers.'),
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


