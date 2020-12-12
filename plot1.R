## This script will construct the first plot asked in the assignment and
## save it to a png file.
## As original data is already treated in the script called Download.R
## contained in this repository, we will load into a table the file
## hpc_20070201_20070202.txt created by this script which is a csv file
## containing only the registers for february, the 1st and the 2nd, 2007. 

library(lubridate)
library(dplyr)

data <- read.csv("hpc_20070201_20070202.txt", header = TRUE)

## The requested graphic is an histogram of Global_active_power, with main
## title, x and y label informed, and color red. The graphic should be recorded
## in a png file of 480x480 pixels. Although this are the default parameters for
## png function, we will specify it in order to let clear the dimensions and
## how to change them.

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main = "Global Active Power", 
     xlab = "Frecuency", ylab = "Global Active Power(kilowatts)", col = "red")
dev.off()
