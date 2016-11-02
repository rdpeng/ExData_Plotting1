#Reference the data loading script to ensure the data is available to plot
source("dataLoad.R")

#Plot 1 - Output to screen
hist(powerSub$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency",  ylim=c(0,1200))

#Copy plot to a png file called plot1
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")

#Turn off the png graphics device
dev.off()

