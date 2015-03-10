MyData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(MyData$Date, MyData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
ActivePower <- as.numeric(MyData$Global_active_power)
ReactivePower <- as.numeric(MyData$Global_reactive_power)
Volts <- as.numeric(MyData$Volts)
subMetering1 <- as.numeric(MyData$Sub_metering_1)
subMetering2 <- as.numeric(MyData$Sub_metering_2)
subMetering3 <- as.numeric(MyData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

plot(datetime, ActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Volts, type="l", xlab="datetime", ylab="Volts")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
plot(datetime,ReactivePower,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, ReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
