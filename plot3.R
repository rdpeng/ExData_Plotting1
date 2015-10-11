################################################################################
## OS Windows 10 
## Plot 3 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment1")

## First load subset.data
source("load.R")

## Load libraries
library(datasets)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot3.png", width=480, height=480)
## Plot with lines
plot(subset.data$Time, subset.data$Sub_metering_1, type = "l", col = "black",
     ylab = "Energy sub metering")
lines(subset.data$Time, subset.data$Sub_metering_2, col="red")
lines(subset.data$Time, subset.data$Sub_metering_3, col="blue")
## Add the legend values
legend("topright", col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

## Close the PNG device
dev.off()
