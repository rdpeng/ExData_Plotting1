################################################################################
## OS Windows 10 
## Plot 1 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment1")

## First load subset.data
source("load.R")

## Load libraries
library(datasets)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot1.png", width=480, height=480)
## Need a histogram
hist(subset.data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
## Close the PNG device
dev.off()
