## First plot

png(file="plot1.png") # open the PNG device
par(mfrow=c(1,1))  # just one frame
hist(lilData$Global_active_power,xlab = "Global Active Power (kilowatts)",main = "Global Active Power",
     col = "red")
dev.off()  # close the PNG device