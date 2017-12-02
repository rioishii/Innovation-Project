library(shiny)
library(dplyr)
library(ggplot2)

data_week <- read.csv(file = '../Data/all_week.csv')
data_week %>% filter(!is.na(mag))
mag_freq <- ggplot(data_week, aes(x=mag, color='red')) + 
  geom_histogram(bins = 8) + theme(legend.position="none")

