## 
## Plot 1 - Histogram Kilowatts over Frequency
##

##
## Check if file to load data is in the current directory
## if not, reset the working directory
##
if (!"loaddata.R" %in% list.files()) {
     setwd("C:/Users/larsondi/Documents/Coursera - Exploratory Data Analysis/project 1")
} 

##
## load the data
##
source("loaddata.R")

##
## open a png graphics device - 480 X 480 pixels
##
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")

##
## create the histogram
##
hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     breaks = 12, ylim = c(0, 1200))

##
## Close the graphic device
##
dev.off()

