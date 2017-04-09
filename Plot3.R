hh.power3 <- read.csv("hh_power_3.csv")
hh.power3$DateTime <- strptime(paste(hh.power3$Date, hh.power3$Time), "%d/%m/%y%H:%M:%S")

plot(hh.power3$DateTime,hh.power3$Sub_metering_1, "n", ylab = "Energy sub metering", xlab = "")
points(hh.power3$DateTime, hh.power3$Sub_metering_1, type = "l", col = "black")
points(hh.power3$DateTime, hh.power3$Sub_metering_2, type = "l", col = "red")
points(hh.power3$DateTime, hh.power3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1)