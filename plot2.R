## Second plot

png(file="plot2.png") # open the PNG device
par(mfrow=c(1,1))  # just one frame
plot(lilData$Time,lilData$Global_active_power,xlab = "",ylab = "Global Active Power (kilowatts)",
     type = "l",lwd = 0.5)
dev.off() # close the png device