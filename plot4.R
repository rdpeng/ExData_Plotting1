## 
## Plot 4 - 4 graphs
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
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")

##
## set the vector as a 2x2, write rowwise
##
par(mfrow = c(2, 2))

##
## Graph 1, top-left, plot line of kilowatts over time
##
plot(DateTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

##
## Graph 2, top-right, plot line of voltage over time
##
plot(DateTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

##
## Graph 3, bottom-left, plot line of submetering over time
##
## add submetering_1
plot(DateTime, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
## add submetering_2
lines(DateTime, Sub_metering_2, col = "red")
## add submetering_3
lines(DateTime, Sub_metering_3, col = "blue")
# add legend, but no border around the legend
legend("topright", bty = "n", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)

##
## Graph 4, bottom-right, plot line of reactive power over time
##
plot(DateTime, Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = colnames(newData)[4])

##
## Close the graphic device
##
dev.off()
