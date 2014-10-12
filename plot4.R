# Read in the data; only interested in reading in 02/01/2007 - 02/02/2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";");
data$fDayTime <- strptime(paste(data$Date, data$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")

# Plot 4
png(file = "plog4.png", width = 480, height = 480)
par(mfrow = c(2,2))
with(data, {
  plot(fDayTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
  plot(fDayTime, Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
  plot(fDayTime, Sub_metering_1, type = "n", ylab = "Enegery sub metering")
  lines(fDayTime, Sub_metering_1)
  lines(fDayTime, Sub_metering_2, col = "red")
  lines(fDayTime, Sub_metering_3, col = "blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))
  plot(fDayTime, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()