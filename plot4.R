power = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$DateTime >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & power$DateTime < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"))

par(mfrow=c(2,2))
plot(power$DateTime, power$Global_active_power, type = "l", xlab="" , ylab= "Global Active Power (kilowatts)")

plot(power$DateTime, power$Voltage, type = "l", xlab="datetime" , ylab= "voltage")

plot(power$DateTime, power$Sub_metering_1, type = "l", xlab="" , ylab= "Energy sub metering", col = "black")
lines(power$DateTime, power$Sub_metering_2, col = "red")
lines(power$DateTime, power$Sub_metering_3, col = "blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1))

plot(power$DateTime, power$Global_reactive_power, type = "l", xlab="datetime" , ylab= "Global Active Power (kilowatts)")

dev.copy(png, "plot4.png")
dev.off()
