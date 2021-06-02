#read table into R and filter out unneeded dates
hhpc <- read.table("./household_power_consumption.txt", header = T, 
                   sep = ";", na.strings = "?")
hhpc <- hhpc[hhpc$Date == "1/2/2007" | hhpc$Date == "2/2/2007",]
#convert to POSIXCT
datetime <- paste(hhpc$Date, hhpc$Time)
DateTime <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")
hhpc <- cbind('DateTime' = DateTime, hhpc)
#create plot
png(filename = "plot4.png")
par(mfrow = c(2,2))

plot(hhpc$DateTime, hhpc$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "n")
lines(hhpc$DateTime, hhpc$Global_active_power, xlab = "",
      ylab = "Global Active Power (kilowatts)", type = "l")

plot(hhpc$DateTime,hhpc$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(hhpc$DateTime, hhpc$Sub_metering_1,
     xlab = "", 
     ylab = "Energy sub metering", type = "n")
lines(hhpc$DateTime, hhpc$Sub_metering_1, col = "black", lty = 1, lwd = 1)
lines(hhpc$DateTime, hhpc$Sub_metering_2, col = "red", lty = 1, lwd = 1)
lines(hhpc$DateTime, hhpc$Sub_metering_3, col = "blue", lty = 1, lwd = 1)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), bty = "n", lty = 1, lwd = 1)


plot(hhpc$DateTime, hhpc$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()