# Read in the data; only interested in reading in 02/01/2007 - 02/02/2007
data <- read.csv.sql("household_power_consumption.txt", sql = "select * from file where Date in ('1/2/2007', '2/2/2007')", header = T, sep = ";");
data$fDayTime <- strptime(paste(data$Date, data$Time, sep = ' '), format = "%d/%m/%Y %H:%M:%S")

# Plot 3
png(file = "plog3.png", width = 480, height = 480)
plot(data$fDayTime, data$Sub_metering_1, type = "n", ylab = "Enegery sub metering")
lines(data$fDayTime, data$Sub_metering_1)
lines(data$fDayTime, data$Sub_metering_2, col = "red")
lines(data$fDayTime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1,1))
dev.off()
