# Innovation-Project
INFO 201(Autumn 2017), final project

Created by *Rio Ishii, Tanner Le, Duke Fu, Ying Jiang*

## About the dataset
This project's dataset contains **North America's earthquake history** between Oct 22, 2017 and Nov 11, 2017. It is collected by USGS(United States Geographical Survey), a scientific agency of US government.
It is downloaded from [earthquake.sgs.gov](https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php).

As an overview, here is a summary of the key variables from the data(round to two decimals):
* Amount of earthquakes in the month: 9209
* Average depth of earthquakes: 22.48
* Average latitude: 41.12
* Average longitude: -114.17
* Location with the most earthquakes: 14km ESE of Mammoth Lakes, California
* Most average mag strength: 1.51
* Strongest mag strength: 7.3

## About this project
* Description

  The dataset of North America's earthquake history is used to discover **earthquake patterns**. *Natural forecasters* will be mainly interested in these patterns, which they may use to predict earthquakes.

* Questions focused

  From this dataset, people are able to get the answers of the following **3** questions:

  - What did distribution of earthquake look like?
  - Which region experienced most frequent earthquakes?
  - What does the distribution of earthquake depth look like?


* Technical description

  This project is done by **R Language**, working in **Shiny app(Rstudio)** with the following packages:
  - dplyr
  - ggplot2
  - shiny
  - ggmap
  - shinythemes


## Analysis

  The full site of shiny app shows here: [Innovation-Project](https://rioishii.shinyapps.io/Innovation-Project/)

  * Files included:

   - **server.R** defines the data that will displayed through UI. The dataset of North America's earthquake history were sorted to make different plots.

   - **ui.R** defines how the application will be displayed in the browser. In this project, **3** kinds of plots are displayed:

      1. Frequency of magnitude(with three changing selections: date range, magnitude range, amount of bins)

      2. Distribution of earthquakes(with two changing selections: map type, magnitude range)

      3. Earthquake depth distribution(selecting from 2 color styles)

    - **Summarize.R** analyzes the dataset from the following aspects:
      1. amount of earthquakes in the month

      2. average depth of earthquakes

      3. location with the most earthquakes(latitude, longitude)

      4. the max and average mag strength
