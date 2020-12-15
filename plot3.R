## This script will construct the third plot asked in the assignment and
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

## The requested graphic is a plot of three magnitudes, sub_metering_1, 
## sub_metering_2 and sub_metering_3, over the time passed between 2007/02/01
## 00:00:00 and 2007/02/02 23:59:00, altogether in the same graphic, with only
## y label informed and a continuous line. Also a legend should be included.
## The graphic should be recorded in a png file of 480x480 pixels. Although this
## are the default parameters for png function, we will specify it in order to
## let clear the dimensions and how to change them.

## In order to add second and third variables to the same graphic we cannot use
## plot function once again, but lines will do the job. In legend we specify
## line width as a trick to force to write a line as a symbol

png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, xlab = "", 
     ylab = "Energy sub metering", type = "l")
lines(x=data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x=data$DateTime, y = data$Sub_metering_3, col = "blue")
legend("topright", lwd=1, col = c("black", "blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
