power = read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, format="%d/%m/%Y %H:%M:%S")
power <- subset(power, power$DateTime >= strptime("2007-02-01 00:00:00", format = "%Y-%m-%d %H:%M:%S") & power$DateTime <= strptime("2007-02-02 00:00:00", format = "%Y-%m-%d %H:%M:%S"))

hist(power$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.copy(png, "plot1.png")
dev.off()