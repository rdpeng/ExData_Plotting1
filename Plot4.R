png("Plot4.png", width = 480, height = 480)

hh.power3 <- read.csv("hh_power_3.csv")
hh.power3$DateTime <- strptime(paste(hh.power3$Date, hh.power3$Time), "%d/%m/%y%H:%M:%S")

par(mfrow = c(2,2))

with(hh.power3, plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)", xlab = ""))

plot(hh.power3$DateTime,hh.power3$Voltage, "n", ylab = "Voltage", xlab = "datetime")
points(hh.power3$DateTime, hh.power3$Voltage, type = "l", col = "black")

plot(hh.power3$DateTime,hh.power3$Sub_metering_1, "n", ylab = "Energy sub metering", xlab = "")
points(hh.power3$DateTime, hh.power3$Sub_metering_1, type = "l", col = "black")
points(hh.power3$DateTime, hh.power3$Sub_metering_2, type = "l", col = "red")
points(hh.power3$DateTime, hh.power3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, bty = "n")

plot(hh.power3$DateTime,hh.power3$Global_reactive_power, "n", ylab = "Global_reactive_power", xlab = "datetime")
points(hh.power3$DateTime, hh.power3$Global_reactive_power, type = "l", col = "black")

dev.off()