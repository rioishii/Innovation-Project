# Innovation-Project
INFO 201(Autumn 2017), final project

Created by *Rio Ishii, Tanner Le, Duke Fu, Ying Jiang*

```{r summary, echo=FALSE}
source("scripts/summary.R")
```

## About the dataset
This project's dataset contains **North America's earthquake history** between Oct 22, 2017 and Nov 11, 2017. It is collected by USGS(United States Geographical Survey), a scientific agency of US government.
It is downloaded from [earthquake.sgs.gov](https://earthquake.usgs.gov/earthquakes/feed/v1.0/csv.php).

As an overview, here is a summary of the key variables from the data:
* Amount of earthquakes in the month: `r summary$occurances`
* Average of depth of earthquakes: `r summary$avg_depth`
* Average latitude: `r summary$avg_locaLat`
* Average longitude:`r summary$avg_locaLong`
* Location with the most earthquakes: `r summary$common_loca`
* Most average mag strength: `r summary$avg_mag`
* Strongest mag strength: `r summary$max_mag`

## About this project
* Description

  The dataset of North America's earthquake history is used to discover **earthquake patterns**. *Natural forecasters* will be mainly interested in these patterns, which they may use to predict earthquakes.

* Questions focused

  From this dataset, people are able to get the answers of the following **3** questions:

  - What did distribution of earthquake look like?
  - Which region experienced most frequent earthquakes?
  - On average, which region got highest magnitude per earthquake?


* Technical description

  This project is done by **R Language**, working in **Shiny app(Rstudio)** with the following packages:
  - dplyr
  - ggplot2
  - shiny
  - ggmap


## Analysis

  The full site of shiny app shows here: [Innovation-Project]()

  * Files included:

   - **server.R** defines the data that will displayed through UI. The dataset of North America's earthquake history were sorted to make different plots.

   - **ui.R** defines how the application will be displayed in the browser. In this project, three maps are displayed:

      1. Frequency of magnitude(selecting from 3 - 15 bins)

      2. Distribution of earthquakes(selecting from 2 types of map)

      3. Earthquake depth distribution(selecting from 2 color styles)

    - **Summarize.R** analyzes the dataset from the following aspects:
      1. amount of earthquakes in the month

      2. average depth of earthquakes

      3. location with the most earthquakes

      4. the max and average mag strength
