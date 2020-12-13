## This script will construct the fourth plot asked in the assignment and
## save it to a png file.
## As original data is already treated in the script called Download.R
## contained in this repository, we will load into a table the file
## hpc_20070201_20070202.txt created by this script which is a csv file
## containing only the registers for February, the 1st and the 2nd, 2007. 

library(lubridate)
library(dplyr)

data <- read.csv("hpc_20070201_20070202.txt", header = TRUE)

## Date and Time are characters and to complete this graphic we need to show 
## evolution on time of the Global Active Power. To have this time variable
## we will add a column pasting Date and Time, and converting this value
## to a time variable using lubridate package functions.

data <- mutate(data, DateTime = dmy_hms(paste(data$Date, data$Time, sep = " ")))

## The requested graphic is a matrix of four plots. Top left is a plot of
## Global_active_power over the time. Bottom left is a graphic of three
## magnitudes, sub_metering_1, sub_metering_2 and sub_metering_3, over the time.
## Top right is a plot of Voltage evolution over the time. Finally, bottom right
## is the evolution of Global_reactive_power over the time. All of them have an
## y label indicating the magnitude plotted, and those on the right have the x
## label "datetime".
## The graphic should be recorded in a png file of 480x480 pixels. Although this
## are the default parameters for png function, we will specify it in order to
## let clear the dimensions and how to change them.

## In order to fill the positions we will use the mfcol function replenishing
## first top left, then bottom left, in third top right and finally bottom 
## right position. There is no main title.

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

with(data, {
        plot(DateTime, Global_active_power, xlab = "",
             ylab = "Global Active Power(kilowatts)", type = "l")

        plot(data$DateTime, data$Sub_metering_1, xlab = "", 
             ylab = "Energy sub metering", type = "l")
        lines(x=data$DateTime, y = data$Sub_metering_2, col = "red")
        lines(x=data$DateTime, y = data$Sub_metering_3, col = "blue")
        legend("topright",inset = 0.01, lwd=1, col = c("black", "blue", "red"), 
               box.lty = 0, legend = c("Sub_metering_1", "Sub_metering_2", 
                                       "Sub_metering_3"), cex = 0.9)

        plot(data$DateTime, data$Voltage, xlab = "datetime", 
             ylab = "Voltage", type = "l")

        plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", 
             ylab = "Global_reactive_power", type = "l")
})
dev.off()
