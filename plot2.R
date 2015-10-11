################################################################################
## OS Windows 10 
## Plot 2 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment1")

## First load subset.data
source("load.R")

## Load libraries
library(datasets)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot2.png", width=480, height=480)
## Plot with lines
plot(subset.data$Time, subset.data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)")

## Close the PNG device
dev.off()
