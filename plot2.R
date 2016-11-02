#Reference the data loading script to ensure the data is available to plot
source("dataLoad.R")

#Plot 1 - Output to screen
with(powerSub, plot(Time, Global_active_power, type = "l", xlab = "", 
                    ylab = "Global Active Power (kilowatts)"))

#Copy plot to a png file called plot2
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")


#Turn off the png graphics device
dev.off()
