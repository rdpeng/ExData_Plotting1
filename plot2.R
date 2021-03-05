#plot 2 code
png(filename = "plot2.png", width = 480, height = 480)

plot(dataset$DateTime, dataset$Global_active_power, type = "l", xlab = '', 
     ylab = "Global Active Power (kilowatts)")

dev.off()

