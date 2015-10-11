################################################################################
## OS Windows 10 
## Plot 4 

## Set to your own folder
setwd("D:/ejercicios_R/Exploratory Data Analysis/program_assigment1")

## First load subset.data
source("load.R")

## Load libraries
library(datasets)

## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
png(filename = "plot4.png", width=480, height=480)

## Set 2x2 graphics mode
par(mfrow=c(2,2))	

## Plot 1
plot(subset.data$Time, subset.data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)")
## Plot 2
plot(subset.data$Time, subset.data$Voltage,
     type = "l", ylab = "Voltage", xlab = "datetime")
## Plot 3
plot(subset.data$Time, subset.data$Sub_metering_1, type = "l", col = "black", 
     xlab="", ylab = "Energy sub metering")
lines(subset.data$Time, subset.data$Sub_metering_2, col="red")
lines(subset.data$Time, subset.data$Sub_metering_3, col="blue")
## Add the legend values
legend("topright", col=c("black", "red", "blue"), bty = "n",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)
## Plot 4
plot(subset.data$Time, subset.data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

## Close the PNG device
dev.off()
