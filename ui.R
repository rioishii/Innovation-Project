library(shiny)
library(shinythemes)

ui <- navbarPage(theme = shinytheme("slate"),"Earthquake Data 2017",
           tabPanel("Home",
                    sidebarLayout(
                      sidebarPanel(
                        h1("Team Innovation Project"),
                        p("Created by", strong("Rio Ishii, Tanner Le, Duke Fu, Ying Jiang")),
                        br(),
                        h2("About the Dataset"),
                        p("This project's dataset contains North America's earthquake history 
                          between Oct 22, 2017 and Nov 11, 2017. It is collected by USGS(United States Geographical Survey), 
                          a scientific agency of US government."),
                        p("The dataset can be found through this", a("earthquake.sgs.gov", href = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php"), "link."),
                        h2("About this Project"),
                        p("The dataset of North America's earthquake history is used to discover earthquake patterns. 
                          Natural forecasters will be mainly interested in these patterns, which they may use to predict earthquakes."),
                        p("During our project, we sought to answer three questions:"),
                        p("1. What does the distribution of earthquake magnitude look like?"),
                        p("2. Which region experienced most frequent earthquakes?"),
                        p("3. What does the distribution of earthquake depth look like?"),
                        br(),
                        p("To answer these questions, we focused on these key variables:"),
                        p("1. Amount of earthquakes in the month: 9209"),
                        p("2. Average of depth of earthquakes: 22.48"),
                        p("3. Average latitude: 41.12"),
                        p("4. Average longitude: -114.17"),
                        p("5. Location with the most earthquakes: 14km ESE of Mammoth Lakes, California"),
                        p("6. Most average magnitude strength: 1.51"),
                        p("7. Strongest magnitude strength: 7.30"),
                        h2("Technical Description"),
                        p("This project is done by", strong("R Language"), "working in", strong("shiny app(Rstudio)"), 
                          "with the following packages:"),
                        p("- dplyr"),
                        p("- ggplot2"),
                        p("- shiny"),
                        p("- shinythemes"),
                        p("- ggmap"),
                        width = 15
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
                        sliderInput("mag", "Select Magnitude Range:",
                                    min = 0, max = 10, value = c(3, 7)),
                        sliderInput("bin", "Select amount of bins:", 
                                    min = 3, max = 20, value = 7)
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
                                     list("Terrain", "Satellite")),
                        sliderInput("mapMag", "Select Magnitude Range:",
                                    min = 0, max = 10, value = c(3, 7))
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
           tabPanel("Source",
                    sidebarLayout(
                      sidebarPanel(
                        h4("For More Information:"),
                        a("USGS: Science for Changing World", href='https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php')
                      ),
                      mainPanel(
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/donutparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/christmasparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/shuffleparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/scienceparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/dealwithitparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/discoparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/scienceparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/sushiparrot.gif'),
                        img("", src='http://cultofthepartyparrot.com/parrots/hd/pumpkinparrot.gif')
                      )
                    )
           )
           
      )



shinyUI(ui)


