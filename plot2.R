power = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- subset(power, power$DateTime >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & power$DateTime < strptime("2007-02-03 00:00:00", format = "%Y-%m-%d %H:%M:%S"))

plot(power$DateTime, power$Global_active_power, type = "l", xlab="" , ylab= "Global Active Power (kilowatts)")
dev.copy(png, "plot2.png")
dev.off()