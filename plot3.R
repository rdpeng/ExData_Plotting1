## 
## Plot 3 - Plot line of submetering over time
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
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "transparent")

##
## create the plot of type line for submetering_1 ( black line )
##
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")

##
## add connected line to the plot  for submetering_2 ( red line )
##
lines(DateTime, Sub_metering_2, col = "red")

##
## add connected line to the plot  for submetering_3 ( blue line )
##
lines(DateTime, Sub_metering_3, col = "blue")

##
## add legend to topright, line width = 1
##
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

##
## Close the graphic device
##
dev.off()
