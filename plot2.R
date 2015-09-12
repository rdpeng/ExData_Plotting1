## 
## Plot 2 - Plot line of kilowatts over time
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
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

##
## create the plot of type line
##
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

##
## Close the graphic device
##
dev.off()
