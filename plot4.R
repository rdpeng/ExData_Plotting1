## plot4
png("plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2,2))
## 1
with(plotdata, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "" ))
## 2
with(plotdata, plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime" ))
## 3
with(plotdata, {
        plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "" )
        points(DateTime, Sub_metering_2, type = "l", col = "red" )
        points(DateTime, Sub_metering_3, type = "l", col = "blue" )
        legend("topright", lty = "solid", lwd =1, col = c("black", "red", " blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
## 4
with(plotdata, plot(DateTime, Global_reactive_power, type = "l", xlab = "datetime"))
## dev.copy(png, file = "plot2.png")
dev.off()
